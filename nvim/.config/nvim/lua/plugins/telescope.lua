
return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    opts = function()
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      return {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },

        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-h>"] = actions.select_horizontal,
              ["<C-t>"] = open_with_trouble,
            },
            n = {
              ["<C-t>"] = open_with_trouble,
            },
          },
        },
      }
    end,

    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,

    keys = {
      {
        "<C-p>",
        function()
          local builtin = require("telescope.builtin")

          vim.fn.system("git rev-parse --is-inside-work-tree")

          if vim.v.shell_error == 0 then
            builtin.git_files({
              git_command = {
                "git",
                "ls-files",
                "--exclude-standard",
                "--cached",
                "--others",
                "--deduplicate",
              },
            })
          else
            builtin.find_files()
          end
        end,
        desc = "Find git files (fallback to files)",
      },

      {
        "<leader>fb",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Fuzzy find in current buffer",
      },

      {
        "<leader>ff",
        "<cmd>Telescope resume<cr>",
        desc = "Resume Telescope",
      },

      {
        "<leader>fi",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live grep",
      },

      {
        "<leader>fi",
        "<cmd>Telescope grep_string<cr>",
        mode = "x",
        desc = "Grep selected text",
      },

      {
        "<leader>fs",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document symbols",
      },
    },
  },
}
