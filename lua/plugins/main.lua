return {
  {
    "nvim-treesitter/nvim-treesitter", 
    config = function()
      require("plugins.config.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins.config.lspconfig")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      require("plugins.config.cmp")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.config.autopairs")
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("plugins.config.oil")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.config.comment")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugins.config.telescope")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = '^4',
    lazy = false,
    config = function()
      require("plugins.config.rustaceanvim")
    end,
  }
}
