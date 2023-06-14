local formatters = require("lvim.lsp.null-ls.formatters")

lvim.plugins = {
	{
		"shaunsingh/nord.nvim",
	},
	{
		-- options: catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"David-Kunz/jester",
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
}

lvim.colorscheme = "catppuccin-macchiato"

formatters.setup({
	{ name = "stylua" },
	{ name = "prettier" },
})

lvim.format_on_save.enabled = true

-- ##### Key Mappings #####
-- lazygit key mappings
lvim.builtin.which_key.mappings["g"] = {
	["g"] = {
		"<cmd>:LazyGit<CR>",
		"Open LazyGit in a floating buffer",
	},
}

-- jester key mappings
lvim.builtin.which_key.mappings["trf"] = {
	'<cmd>lua require("jester").run({ terminal_cmd = ":ToggleTerm" })<CR>',
	"Run tests in current file",
}
