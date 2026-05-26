local M = {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

-- Open git files, or fallback to find files if not in a git directory
local function git_files_fallback()
  local builtin = require("telescope.builtin")
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files({
      git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--others", "--deduplicate" },
    })
  else
    builtin.find_files()
  end
end

function M.config()
  local actions = require("telescope.actions")
  local open_with_trouble = require("trouble.sources.telescope").open
  local telescope = require("telescope")

  telescope.setup({
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-h>"] = actions.select_horizontal,
          ["<C-t>"] = open_with_trouble
        },
        n = {
          ["<C-t>"] = open_with_trouble
        }
      },
    },
  })

  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require("telescope").load_extension("fzf")

  -- Keymaps
  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<C-p>", git_files_fallback, {})
  vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  vim.keymap.set("n", "<leader>ff", builtin.resume, {})
  vim.keymap.set("n", "<leader>fi", builtin.live_grep, {})
  vim.keymap.set("x", "<leader>fi", builtin.grep_string, {})
  vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})

  vim.keymap.set("n", "<leader>sD", builtin.diagnostics, {})
end

return M
