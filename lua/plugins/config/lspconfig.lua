-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set("n", "<Leader>ra", vim.lsp.buf.rename)

-- change the lsp diagnostics from undercurl to underline
local hl_groups = {
  'DiagnosticUnderlineOk',
  'DiagnosticUnderlineError',
  'DiagnosticUnderlineInfo',
  'DiagnosticUnderlineHint',
  'DiagnosticUnderlineWarn'
}

for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. ' gui=underline')
end

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

lspconfig.nil_ls.setup({
  capabilities = capabilities,
})

lspconfig.marksman.setup({
  capabilities = capabilities,
})

-- lspconfig.tailwindcss.setup({
--     capabilities = capabilities,
-- })

lspconfig.html.setup({
  capabilities = capabilities,
})


lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

lspconfig.svelte.setup({
  capabilities = capabilities,
})

lspconfig.basedpyright.setup({
  capabilities = capabilities,
  settings = {
    basedpyright = {
        analysis = {
            autoSearchPaths = true,
            typeCheckingMode = "standard",
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
        },
    }
  }
})

lspconfig.ruff.setup({
  capabilities = capabilities,
})
