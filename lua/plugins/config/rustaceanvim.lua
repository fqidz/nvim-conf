local map = vim.keymap.set

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      local bufnr_opts = { noremap = true, silent = true, buffer = bufnr }
      map(
        "n", "<Leader>da",
        function()
          vim.cmd.RustLsp({"renderDiagnostic", "current"})
        end,
        bufnr_opts
      )
      map(
        "n", "<Leader>dn",
        function()
          vim.cmd.RustLsp({"renderDiagnostic", "cycle"})
        end,
        bufnr_opts
      )
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}
