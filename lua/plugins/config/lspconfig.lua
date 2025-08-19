-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set("n", "<Leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>da", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v" }, "<Leader>fa", function()
  vim.lsp.buf.format({ async = false })
end)

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

-- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md#configuration-overview
lspconfig.nixd.setup({
  capabilities = capabilities,
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nix fmt" },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.laptop.options',
        },
        home_manager = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations."laptop".options.home-manager.users.type.getSubOptions []',
        },
      },
    },
  },
})

lspconfig.clangd.setup({
  capabilities = capabilities,
})

lspconfig.marksman.setup({
  capabilities = capabilities,
})
lspconfig.texlab.setup({
  capabilities = capabilities,
})

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { "html", "templ", "jinja" },
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

lspconfig.jinja_lsp.setup({
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
