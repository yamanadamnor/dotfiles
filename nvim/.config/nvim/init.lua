------------------------------------------
-- Miscellaneous

-- Disable netrw (built-in file explorer) since we use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
------------------------------------------
-- Formatting (see :help nvim-defaults)

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.scrolloff = 3
------------------------------------------
-- Style

if vim.fn.has("termguicolors") then
    vim.o.termguicolors = true
end

-- Hide tilde empty line
vim.o.fillchars = "eob: "
------------------------------------------

------------------------------------------
-- Yank to clipboard on WSL

vim.o.clipboard = "unnamedplus"
------------------------------------------

------------------------------------------
-- VimTeX
-- vim.g.vimtex_view_general_viewer = "~/.local/bin/sumatrapdf.sh"
vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
vim.g.maplocalleader = ","
------------------------------------------

------------------------------------------
-- LuaSnip

vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

------------------------------------------

-- go
require("config")