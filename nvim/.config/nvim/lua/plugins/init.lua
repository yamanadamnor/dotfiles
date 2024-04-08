return {
	-- Various colorschemes
	-- "flazz/vim-colorschemes",
	"w0ng/vim-hybrid",

	-- Colorscheme
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		require("kanagawa").setup({
	-- 			transparent = true,
	-- 			theme = "dark",
	-- 			overrides = function()
	-- 				return {
	-- 					TelescopeBorder = { default = true, link = "TelescopeNormal" },
	-- 					TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
	-- 					TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
	-- 					TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd([[colorscheme kanagawa]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavor = "macchiato",
				integrations = {
					telescope = true,
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	-- Emmet
	"mattn/emmet-vim",

	-- Comment support for TSX support
	{

		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

	-- Change surrounding symbols
	"tpope/vim-surround",

	-- Detect indentation
	"tpope/vim-sleuth",

	-- Git stuff
	"tpope/vim-fugitive",

	-- Highlight colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	-- Caddyfile support
	"isobit/vim-caddyfile",

	"dstein64/vim-startuptime",

	-- TODO comments hightlighting
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
