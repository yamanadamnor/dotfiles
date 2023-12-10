------------------------------------------
-- Miscellaneous
vim.o.splitright = true
vim.o.splitbelow = true
vim.g.mapleader = " "

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

-- Comment
vim.g.skip_ts_context_commentstring_module = true
------------------------------------------

-- Style
if vim.fn.has("termguicolors") then
    vim.o.termguicolors = true
end

-- Hide tilde empty line
vim.o.fillchars = "eob: "
------------------------------------------
-- Yank to clipboard on WSL
vim.opt.clipboard = 'unnamedplus'

------------------------------------------
-- VimTeX

if vim.fn.has("win32") or (vim.fn.has("unix") and vim.fn.exists("$WSLENV")) then
    if vim.fn.executable("sioyek.exe") then
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
        vim.g.vimtex_callback_progpath = "wsl nvim"
    end
end
vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
vim.g.maplocalleader = ","
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
-- GO
require("config")
