config.load_autoconfig() # load settings done via the gui

c.tabs.title.format = "{audio} {index}| {current_title}"
c.fonts.web.size.default = 16

c.tabs.background = True
c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
# c.spellcheck.languages = ['en-US']
c.url.searchengines = {

# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }
c.url.searchengines['duden'] = 'https://www.duden.de/suchen/dudenonline/{}'
c.url.searchengines['dictcc'] = 'https://www.dict.cc/?s={}'

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

c.auto_save.session = True # save tabs on quit/restart

config.bind('h', 'history')
config.bind('cs','cmd-set-text -s :config-source')

css = './gruvbox-all-sites.css'
config.bind(',n', f'config-cycle content.user_stylesheets {css} ""')


config.set("content.headers.user_agent",
           "Mozilla/5.0 (X11; Linux x86_64) "
           "AppleWebKit/537.36 (KHTML, like Gecko) "
           "Chrome/121.0.0.0 Safari/537.36",
           "https://accounts.google.com/*")


c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '7%'

# adblock
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "both"
c.content.tls.certificate_errors = "block"

c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
    # 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=223428',
    "https://adaway.org/hosts.txt",
    # 'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts',
]
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-social.txt",
    "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt",
]
c.editor.command = ['alacritty', '-e', 'nvim', '{file}', '-c', 'normal {line}G{column0}l']
config.source("gruvbox.py")
