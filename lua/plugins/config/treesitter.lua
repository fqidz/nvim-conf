local treesitter = require("nvim-treesitter")

-- treesitter.setup({
--   auto_install = true,
--
--   ignore_install = { "latex" },
--
--   highlight = {
--     enable = true,
--     disable = { "latex", "csv", "psv", "tsv" },
--   },
--
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--
--         ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--         ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
--       },
--       selection_modes = {
--         ['@parameter.outer'] = 'v', -- charwise
--         ['@function.outer'] = 'V',  -- linewise
--         ['@class.outer'] = '<c-v>', -- blockwise
--       },
--       include_surrounding_whitespace = true,
--     },
--   },
-- })
--
--

local parsers = {
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
  "nix",
  "make",
  "yuck",
  "toml",
  "matlab",
  "dockerfile",
  "desktop",
}

treesitter.install(parsers)

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/4916d6592ede8c07973490d9322f187e07dfefac/README.md?plain=1#L164
-- should be registered before doing vim.treesitter.language.get_filetypes(parser)
vim.treesitter.language.register('htmldjango', { 'jinja' })
vim.treesitter.language.register('matlab', { 'octave' })
-- no treesitter parser for systemd unit files but closest is either *.desktop or *.ini
vim.treesitter.language.register('desktop', { 'systemd' })

-- https://mhpark.me/posts/update-treesitter-main/#:~:text=local%20patterns%20%3D%20%7B%7D
local patterns = {}
for _, parser in ipairs(parsers) do
    local parser_patterns = vim.treesitter.language.get_filetypes(parser)
    for _, pp in pairs(parser_patterns) do
        table.insert(patterns, pp)
    end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = patterns,
  callback = function() vim.treesitter.start() end,
})
