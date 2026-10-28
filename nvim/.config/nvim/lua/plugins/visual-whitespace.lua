local M = {
    'mcauley-penney/visual-whitespace.nvim',
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {
        match_types = {
            space = true,
            tab = true,
            nbsp = true,
            lead = true,
            trail = true,
        },
    },
    init = function()
        vim.keymap.set({ 'n', 'v' }, "<leader>tw", require("visual-whitespace").toggle, {})
    end
}

return M
