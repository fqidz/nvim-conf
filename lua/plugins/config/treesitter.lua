require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    -- custom
    "rust",
    "python",
    "html",
    "htmldjango",
    "javascript",
    "jsdoc",
  },

  auto_install = true,

  ignore_install = { "latex" },

  highlight = {
    enable = true,
    disable = { "latex" },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",

        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
})

-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#adding-parsers
-- permalink: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#adding-parsers
vim.treesitter.language.register('htmldjango', 'jinja')
