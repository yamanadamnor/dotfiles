local keymap = vim.keymap
local opts = { noremap, silent = true }

-- Code actions
keymap.set("n", "<space>ca", function()
	vim.lsp.buf.code_action()
end)

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
