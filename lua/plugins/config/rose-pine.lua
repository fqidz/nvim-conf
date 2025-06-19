require("rose-pine").setup({
  variant = "auto", -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn

  enable = {
    terminal = true,
    migrations = true, -- Handle deprecated options automatically
  },

  before_highlight = function(group, highlight, palette)
    -- Turn undercurls into underlines
    if highlight.undercurl then
      highlight.undercurl = false
      highlight.underline = true
    end
  end,
})

vim.cmd.colorscheme("rose-pine")
