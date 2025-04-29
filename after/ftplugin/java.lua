-- a lot of the following is from:
-- https://github.com/fabelv/nix-config/blob/9871c41701b8f0a0c97cd385ef60e4c94a825e0c/home-manager/features/editors/nvim/plugin/java.lua
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = os.getenv("JDTLS_WORKSPACE") .. '/' .. project_name
local config_path = os.getenv("JDTLS_CONFIG")
local launcher_path = vim.fn.glob(os.getenv("JDTLS_HOME") .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local config = {
    -- cmd options from https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#configuration-verbose
    -- jdtls somehow doesn't detect javafx with just `cmd = { 'jdtls' }`
    cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', launcher_path,
      '-configuration', config_path,
      '-data', workspace_dir
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>da", vim.diagnostic.open_float , opts)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action , opts)
