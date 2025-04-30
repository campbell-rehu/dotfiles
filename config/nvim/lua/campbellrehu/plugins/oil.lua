return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	lazy = false,
	config = function()
		local oil = require("oil")
		local helpers = require("campbellrehu.core.helpers")
		oil.setup({
			default_file_explorer = false,
		})
		helpers.generateKeymap("n", "<leader>-", function()
			oil.toggle_float()
		end, "Toggle Oil (floating window)")
	end,
}
