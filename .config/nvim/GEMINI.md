# Neovim Native Plugin Manager (`vim.pack`)

This document summarizes the key features and workflow of Neovim's built-in plugin manager, `vim.pack`, as derived from the official documentation.

## Overview

`vim.pack` is Neovim's native solution for managing plugins without requiring external plugin managers. It leverages Git for cloning and updating repositories and maintains plugin states, including versioning, within a structured directory.

## Key Concepts and Workflows

*   **Plugin Storage**: Plugins are installed into structured directories within Neovim's `pack` paths. The primary locations are typically under `$XDG_DATA_HOME/nvim/site/pack/{vendor}/` which contains:
    *   `start/{plugin_name}`: Plugins in these directories are automatically loaded when Neovim starts.
    *   `opt/{plugin_name}`: Plugins in these directories are "optional" and must be explicitly loaded (e.g., using `:packadd {plugin_name}`).
*   **Git Integration**: `vim.pack` uses `git` commands (specifically `git clone`) to fetch plugin repositories. This means a functional `git` executable is a prerequisite.
*   **State Tracking (`nvim-pack-lock.json`)**:
    *   A JSON-based lockfile, `nvim-pack-lock.json` (located at `$XDG_CONFIG_HOME/nvim/`), tracks the installed plugin data and their exact revisions.
    *   This lockfile is crucial for reproducible environments and should ideally be managed under version control.
*   **Adding Plugins (`vim.pack.add()`):**
    *   Plugins are added by calling `vim.pack.add({ src = 'https://github.com/owner/repo' })`. In this project's `lua/config/packs.lua` file, this function is used to add plugins.
    *   When used in this manner (without a specified `type = 'start'` or explicit placement into a `start` directory), `vim.pack` typically places these plugins into the `stdpath('data')/site/pack/core/opt/{plugin_name}` directory.
    *   This means the plugins are considered "optional" packages. While they are cloned, they are *not* automatically loaded at Neovim startup by default Neovim mechanisms. However, the structure of `packs.lua` within the `init.lua` loading sequence can effectively trigger their loading if the `vim.pack.add` call itself causes them to be added to the runtime path.
    *   The `src` field specifies the Git repository URI.
    *   `vim.pack` performs a "partial blobless `git clone`" for efficient download.
*   **Updating Plugins (`vim.pack.update()`):**
    *   This command downloads new changes from the specified plugin sources.
    *   It can be run interactively to review changes or with `{ force = true }` for non-interactive updates.
*   **Versioning**:
    *   Plugins can be pinned to specific versions (e.g., default branch, a specific branch/tag, or a commit hash).
    *   Semantic Versioning (`v<major>.<minor>.<patch>`) tags are used for tracking releases.
*   **Lifecycle Management**:
    *   **Freezing/Unfreezing**: Plugins can be frozen to a specific revision to prevent updates or unfrozen to allow them to be updated again.
    *   **Rollbacks**: The system supports reverting to previous plugin states.
    *   **Deletion (`vim.pack.del()`):** Plugins can be removed using this function.
*   **Events**:
    *   `PackChangedPre` and `PackChanged` events are emitted during plugin state changes (install, update, delete). These can be hooked into for custom logic, such as running post-installation build scripts (e.g., `npm install`).
*   **`vim.pack.Spec`**: This Lua table defines the configuration for each plugin, including fields like `source`, `type`, `opt` (for optional plugins), `frozen`, and `tag`.

## Key Functions

The core functionality revolves around:

*   `vim.pack.add()`: Add and install plugins.
*   `vim.pack.del()`: Delete installed plugins.
*   `vim.pack.get()`: Retrieve information about installed plugins.
*   `vim.pack.update()`: Update plugins to their latest versions or specified revisions.

## Limitations and Considerations

*   **External Dependencies**: While `vim.pack` is native to Neovim, it still relies on external tools like `git` for its operation.
*   **Post-Installation Steps**: `vim.pack` does not inherently automate post-installation build steps (like running `npm install` for Node.js-based plugins). As seen with `iamcco/markdown-preview.nvim`, after the plugin is cloned, users *must* manually navigate to the plugin's `app` directory and run `npm install` to set up its server components. These steps often need to be triggered manually or via custom autocommands hooked into `PackChanged` events.
*   **Error Reporting**: Error messages from underlying `git` commands might require external troubleshooting (e.g., for authentication or network issues), as seen in the recent `fatal: could not read Username` error.

This native manager provides a solid, foundational approach to plugin management, offering a balance between simplicity and control, though some advanced features typically found in third-party managers (like automatic post-install hooks) may require manual configuration.

## Neovim Package Loading and Structure

Neovim's native package management organizes plugins into two main categories based on their loading behavior:

*   **`start` packages (Automatic Loading)**:
    *   Plugins placed in `pack/{vendor}/start/{plugin_name}` directories are automatically loaded by Neovim upon startup.
    *   This is typically used for essential plugins that are needed immediately when Neovim launches.
    *   Neovim scans these directories for files like `plugin/`, `ftdetect/`, `syntax/`, and loads them. `autoload/` files are also searched on demand, and `after/` directories are processed later in the startup sequence.

*   **`opt` packages (Optional/Manual Loading)**:
    *   Plugins placed in `pack/{vendor}/opt/{plugin_name}` directories are *not* loaded automatically at startup.
    *   They must be explicitly loaded using the `:packadd {plugin_name}` command within Neovim.
    *   This is useful for plugins that are used less frequently or that you only want to load when needed, helping to keep Neovim's startup time faster.
    *   `:packadd! {plugin_name}` can be used to force an optional plugin to load at startup, even if Neovim was started with `--noplugin`.


---

### Plugin: `iamcco/markdown-preview.nvim`

**Purpose:**
Provides a real-time Markdown preview in a modern web browser for Neovim (and Vim 8.1+). It supports synchronized scrolling between the editor and the preview, fast asynchronous updates, and a flexible configuration.

**Main Features:**
*   Cross-platform compatibility (macOS/Linux/Windows).
*   Synchronized scrolling.
*   Fast asynchronous updates.
*   Support for various rendering extensions like KaTeX (math), PlantUML, Mermaid, Chart.js, js-sequence-diagrams, Flowchart, dot.
*   Includes Table of Contents, Emojis, Task lists, and local image display.
*   Flexible configuration options.

**Installation (Key takeaway for `vim.pack.add` users):**
The `README.md` provides installation instructions for various plugin managers. For `vim.pack.add` users, the critical step after cloning the repository is to manually run `cd app && npx --yes yarn install` (or `npm install` if yarn is not preferred) inside the plugin's directory. This command builds the necessary server components for the previewer.

**Basic Configuration (`init.lua` / `init.vim`):**
The plugin is configured using global Vim variables (e.g., `vim.g.mkdp_auto_start`).
*   `vim.g.mkdp_auto_start`: `0` (default) - does not auto-open preview on Markdown buffer entry. Set to `1` to enable auto-start.
*   `vim.g.mkdp_auto_close`: `1` (default) - auto-closes the preview window when leaving a Markdown buffer. Set to `0` to keep it open.
*   `vim.g.mkdp_filetypes`: `{'markdown'}` (default) - defines filetypes for which the preview is active. Can be extended (e.g., `{'markdown', 'vimwiki'}`).
*   `vim.g.mkdp_theme`: `'dark'` or `'light'` - sets the preview theme, otherwise defaults to system preferences.

**Commands and Mappings:**
*   `:MarkdownPreview`: Start the preview.
*   `:MarkdownPreviewStop`: Stop the preview.
*   `:MarkdownPreviewToggle`: Toggle the preview.
*   Example mappings:
    *   `nmap <C-s> <Plug>MarkdownPreview`
    *   `nmap <C-p> <Plug>MarkdownPreviewToggle` (This is similar to what we configured)

**Custom Examples:**
Supports various custom markdown syntaxes for Table of Contents, Image Sizing, PlantUML, KaTeX, Mermaid, js-sequence-diagrams, Flowchart, dot, and Chart.js.

**Troubleshooting (`FAQ` highlights):**
*   **Lagging synchronized scrolling**: Set `updatetime` to a smaller number (e.g., `set updatetime=100`).
*   **WSL 2 issue (cannot open browser)**: Install `xdg-utils` (`sudo apt-get install -y xdg-utils`).
*   **Changing theme**: There's a hidden button in the header of the preview page to toggle themes.
*   **CLI options for browser**: `g:mkdp_browserfunc` can be used with a custom Vim function to open the browser with specific CLI arguments (e.g., `--new-window`).

**Prerequisites:** Node.js and Yarn (or npm).
