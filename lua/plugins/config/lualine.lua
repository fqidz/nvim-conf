-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local rose_pine_colors = {
  blue   = '#9ccfd8',
  cyan   = '#9ccfd8',
  black  = '#191724',
  white  = '#e0def4',
  red    = '#eb6f92',
  violet = '#c4a7e7',
  grey   = '#26233a',
  gold   = '#f6c177',
}

local bubbles_theme = {
  normal = {
    a = { fg = rose_pine_colors.black, bg = rose_pine_colors.violet },
    b = { fg = rose_pine_colors.white, bg = rose_pine_colors.grey },
    c = { fg = rose_pine_colors.white },
  },

  insert = { a = { fg = rose_pine_colors.black, bg = rose_pine_colors.blue } },
  visual = { a = { fg = rose_pine_colors.black, bg = rose_pine_colors.cyan } },
  replace = { a = { fg = rose_pine_colors.black, bg = rose_pine_colors.red } },
  command = { a = { fg = rose_pine_colors.black, bg = rose_pine_colors.gold } },

  inactive = {
    a = { fg = rose_pine_colors.white, bg = rose_pine_colors.black },
    b = { fg = rose_pine_colors.white, bg = rose_pine_colors.black },
    c = { fg = rose_pine_colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
