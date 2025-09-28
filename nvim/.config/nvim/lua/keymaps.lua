local keymap = vim.keymap
local opts = { noremap, silent = true }

-- LSP

-- Code actions
keymap.set("n", "<space>ca", vim.lsp.buf.code_action)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump({
    count = 1,
    float = true
  })
end)

-- Peek references
keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})

-- Definitions
keymap.set("n", "gd", vim.lsp.buf.definition)

-- Rename
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
