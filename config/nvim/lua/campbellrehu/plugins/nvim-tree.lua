return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 70,
				relativenumber = true,
				side = "right",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "󰅀",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})
		local helpers = require("campbellrehu.core.helpers")

		helpers.generateKeymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", "Toggle file explorer")
		helpers.generateKeymap(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			"Toggle file explorer on currently open file"
		)
		helpers.generateKeymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer")
		helpers.generateKeymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer")
	end,
}
