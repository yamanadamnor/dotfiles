local M = {
	"zbirenbaum/copilot.lua",
}

function M.config()
	require("copilot").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end

return M
