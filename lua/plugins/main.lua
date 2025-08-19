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
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      "saadparwaiz1/cmp_luasnip",
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
    "mikavilpas/yazi.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    event = "VeryLazy",
    keys = {
      {
        "-",
        "<cmd>Yazi<cr>",
      },
    },
    opts = {
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      open_for_directories = true,
      highlight_hovered_buffers_in_same_directory = false,
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end
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
  },
  {
    "mfussenegger/nvim-jdtls",
    version = "0.2.0",
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    dir = "~/.local/share/nvim/nix/markdown-preview-nvim/",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      require("plugins.config.markdown-preview")
    end,
  },
  {
    "let-def/texpresso.vim",
    dir = "~/.local/share/nvim/nix/texpresso-vim/",
    ft = { "tex" },
    config = function()
      require("plugins.config.texpresso")
    end,
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.config.session-manager")
    end,
  },
}
