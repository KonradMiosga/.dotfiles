-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 14
config.window_background_opacity = 0.9

-- tmux
-- this will be good...
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
-- config.keys = {
--     {
--         mods = "LEADER",
--         key = "c",
--         action = wezterm.action.SpawnTab "CurrentPaneDomain",
--     },
--     {
--         mods = "LEADER",
--         key = "x",
--         action = wezterm.action.CloseCurrentPane { confirm = true }
--     },
--     {
--         mods = "LEADER",
--         key = "b",
--         action = wezterm.action.ActivateTabRelative(-1)
--     },
--     {
--         mods = "LEADER",
--         key = "n",
--         action = wezterm.action.ActivateTabRelative(1)
--     },
--     {
--         mods = "LEADER",
--         key = "|",
--         action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
--     },
--     {
--         mods = "LEADER",
--         key = "-",
--         action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
--     },
--     {
--         mods = "LEADER",
--         key = "h",
--         action = wezterm.action.ActivatePaneDirection "Left"
--     },
--     {
--         mods = "LEADER",
--         key = "j",
--         action = wezterm.action.ActivatePaneDirection "Down"
--     },
--     {
--         mods = "LEADER",
--         key = "k",
--         action = wezterm.action.ActivatePaneDirection "Up"
--     },
--     {
--         mods = "LEADER",
--         key = "l",
--         action = wezterm.action.ActivatePaneDirection "Right"
--     },
--     {
--         mods = "LEADER",
--         key = "LeftArrow",
--         action = wezterm.action.AdjustPaneSize { "Left", 5 }
--     },
--     {
--         mods = "LEADER",
--         key = "RightArrow",
--         action = wezterm.action.AdjustPaneSize { "Right", 5 }
--     },
--     {
--         mods = "LEADER",
--         key = "DownArrow",
--         action = wezterm.action.AdjustPaneSize { "Down", 5 }
--       },
--       {
--         mods = "LEADER",
--         key = "UpArrow",
--         action = wezterm.action.AdjustPaneSize { "Up", 5 }
--       },
--     }
--
--     for i = 1, 9 do
--       -- leader + number to activate that tab
--       table.insert(config.keys, {
--         key = tostring(i),
--         mods = "LEADER",
--         action = wezterm.action.ActivateTab(i-1),
--       })
--     end
--
-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- config.tab_and_split_indices_are_zero_based = true

-- and finally, return the configuration to wezterm
return config
