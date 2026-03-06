local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    initial_mode = "normal",
  },
  -- pickers = {
  --   live_grep = {
  --     find_command =
  --   },
  -- },
})

vim.keymap.set(
  'n',
  '<leader>ff',
  function()
    builtin.find_files({
      hidden = true,
      no_ignore = true,
    })
  end,
  {}
)
vim.keymap.set(
  'n',
  '<leader>fg',
  function()
    builtin.live_grep({
      additional_args = { "--no-ignore" },
    })
  end,
  {}
)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-[>', builtin.lsp_references, {})
