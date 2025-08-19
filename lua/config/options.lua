vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.winborder = "single"
-- vim.lsp.inlay_hint.enable()

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.fillchars = { eob = " " }

vim.opt.inccommand = "split"

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8

vim.opt.termguicolors = true

vim.opt.ignorecase = true

vim.g.mapleader = " "

vim.opt.signcolumn = "yes";

vim.diagnostic.config({
  update_in_insert = true,
})

vim.filetype.add {
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
    -- set to `jinja` instead of `htmldjango`
    -- based on: https://github.com/neovim/neovim/blob/40b64e91007e364fd7c7eaab64ce7c8cf0150aec/runtime/lua/vim/filetype/detect.lua#L772
    html = function(_path, bufnr)
      local content = vim.api.nvim_buf_get_lines(bufnr, 0, 41, false) or ''
      for _, line in ipairs(content) do
        if vim.regex(
              [[\c{%\s*\(autoescape\|block\|comment\|csrf_token\|cycle\|debug\|extends\|filter\|firstof\|for\|if\|ifchanged\|include\|load\|lorem\|now\|query_string\|regroup\|resetcycle\|spaceless\|templatetag\|url\|verbatim\|widthratio\|with\)\>\|{#\s\+]])
            :match_str(line) ~= nil then
          return "jinja"
        end
      end
    end,
  },
}
