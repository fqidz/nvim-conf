local header_list = {
  shadow = {
    "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
  }
}

require('dashboard').setup {
  theme = 'hyper',
  shortcut_type = 'number',
  config = {
    header = header_list.shadow,
    shortcut = {
      {
        icon = ' ',
        desc = 'files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' nixconfig',
        group = 'DiagnosticHint',
        action = 'Telescope find_files search_dirs=/etc/nixos/',
        key = 'n',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope find_files search_dirs=~/.config/',
        -- action = 'Telescope find_files cwd=~/.config/',
        key = 'c',
      },
    },
    footer = {},
  },
}
