local config = {
    cmd = { os.getenv("JDTLS_PATH") },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Leader>da", vim.diagnostic.open_float , opts)
map("n", "<Leader>ca", vim.lsp.buf.code_action , opts)
