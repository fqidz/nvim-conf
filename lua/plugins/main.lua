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
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({"telescope"})
    end,
  },
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    init = function()
      local possession = require("nvim-possession")

      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end)
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<leader>ss", function()
        possession.update()
      end)
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end)
    end,
    config = function()
      require("plugins.config.possession")
    end
  }
}
