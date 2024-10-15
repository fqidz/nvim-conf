vim.cmd([[
    function OpenMarkdownPreview (url)
      execute "silent ! firefox --new-window " . a:url
    endfunction
  ]])

vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 0
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
-- vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/lua/utils/github-markdown.css"
vim.g.mkdp_page_title = '${name}'
vim.g.mkdp_combine_preview = 1

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-s>", "<Cmd>MarkdownPreview<CR>", opts)

