local M = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
}

-- Open git files, or fallback to find files if not in a git directory
local function git_files_fallback()
    local builtin = require("telescope.builtin")
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
        builtin.git_files { git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--deduplicate" } }
    else
        builtin.find_files()
    end
end

function M.config()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-h>"] = actions.select_horizontal,
                },
            },
        },
    })

    -- Keymaps
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-p>", git_files_fallback, {})
    vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>ff", builtin.resume, {})
    vim.keymap.set("n", "<leader>fi", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})

    vim.keymap.set("n", "<leader>sD", builtin.diagnostics, {})
end

return M
