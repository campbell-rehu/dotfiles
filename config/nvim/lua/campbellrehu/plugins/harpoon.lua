return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values
    local helpers = require("campbellrehu.core.helpers")

    helpers.generateKeymap("n", "<leader>HA", function()
      harpoon:list():add()
    end, "harpoon: add file")

    helpers.generateKeymap("n", "<leader>HD", function()
      harpoon:list():remove()
    end, "harpoon: remove file")

    helpers.generateKeymap("n", "<leader>HL", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, "harpoon: toggle list")

    helpers.generateKeymap("n", "<leader>HN", function()
      harpoon:list():prev()
    end, "harpoon: prev file")

    helpers.generateKeymap("n", "<leader>HP", function()
      harpoon:list():next()
    end, "harpoon: next file")

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

    helpers.generateKeymap("n", "<leader>HT", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
