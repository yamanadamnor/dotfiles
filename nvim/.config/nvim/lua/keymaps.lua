local keymap = vim.keymap
local opts = { noremap, silent = true }

-- Search TODOs
keymap.set("n", "<leader>ft", "<cmd>Trouble todo keywords=TODO,FIX,FIXME<cr>")

-- LSP

-- Code actions
keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>")

-- Diagnostics
keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Hover
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Peek references
keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>")

-- Definitions
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Rename
keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>")
