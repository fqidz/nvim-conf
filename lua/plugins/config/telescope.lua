local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    initial_mode = "normal",
  },
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
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-[>', builtin.lsp_references, {})
