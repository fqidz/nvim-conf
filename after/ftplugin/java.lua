-- a lot of the following is from:
-- https://github.com/LazyVim/LazyVim/blob/b8899781516da71ba0f63afa93fb4a6b25dff144/lua/lazyvim/plugins/extras/lang/java.lua#L87-L145

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local jdtls_workspace_dir =
  vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
local jdtls_config_dir =
  vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"

local config = {
  cmd = {
    vim.fn.exepath("jdtls"),
    '-configuration', jdtls_config_dir,
    '-data', jdtls_workspace_dir
  },
  root_dir = vim.fs.root(vim.api.nvim_buf_get_name(0), vim.lsp.config.jdtls.root_markers),
  -- settings = {
  --   java = {
  --     settings = {
  --       url = "/home/faidz/.config/nvim/rule/jdtls.prefs";
  --     }
  --   }
  -- }
}
require('jdtls').start_or_attach(config)

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>da", vim.diagnostic.open_float , opts)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action , opts)
