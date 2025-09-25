-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set("n", "<Leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>da", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v" }, "<Leader>fa", function()
  vim.lsp.buf.format({ async = false })
end)

vim.lsp.enable({ "luals", "nixd", "clangd", "marksman", "texlab", "html", "css_ls", "ts_ls", "jinja_lsp", "svelte",
  "basedpyright", "ruff" });

vim.lsp.config.luals = {
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
}

-- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md#configuration-overview
vim.lsp.config.nixd = {
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
          expr =
          '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations."laptop".options.home-manager.users.type.getSubOptions []',
        },
      },
    },
  },
}

vim.lsp.config.clangd = {
  capabilities = capabilities,
}

vim.lsp.config.marksman = {
  capabilities = capabilities,
}

vim.lsp.config.texlab = {
  capabilities = capabilities,
}

vim.lsp.config.html = {
  capabilities = capabilities,
  filetypes = { "html", "templ", "jinja" },
}

vim.lsp.config.cssls = {
  capabilities = capabilities,
}

vim.lsp.config.ts_ls = {
  capabilities = capabilities,
}

vim.lsp.config.jinja_lsp = {
  capabilities = capabilities,
}

vim.lsp.config.svelte = {
  capabilities = capabilities,
}

vim.lsp.config.basedpyright = {
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
}

vim.lsp.config.ruff = {
  capabilities = capabilities,
}
