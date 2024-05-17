return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({ flavour = "macchiato" })
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"xero/miasma.nvim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			require("tokyonight").setup({ style = "storm" })
		end,
	},
}
