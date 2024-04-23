return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config").values
		local helpers = require("campbellrehu.core.helpers")

		helpers.generateKeymap("n", "<leader>a", function()
			harpoon:list():add()
		end)
		helpers.generateKeymap("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		helpers.generateKeymap("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		helpers.generateKeymap("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		-- setup telescope
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		helpers.generateKeymap("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
