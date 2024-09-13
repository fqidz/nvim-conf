return {
  {
    "rose-pine/neovim",
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      require("plugins.config.barbar")
    end,
    opts = { },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.config.lualine")
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.config.dashboard")
    end,
  }
}
