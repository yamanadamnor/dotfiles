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
require("config")
