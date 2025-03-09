-- auto update lazy
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup("filetype"),
    pattern = {"*.h", "*.c"},
    command = "setlocal filetype=c",
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})

-- remove white space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

-- hide lsp diagnostics when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = {"*"},
    callback = function()
      vim.diagnostic.config({
        virtual_text = false;
        underline = false;
      })
    end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = {"*"},
    callback = function()
      vim.diagnostic.config({
        virtual_text = true;
        underline = true;
      })
    end,
})
