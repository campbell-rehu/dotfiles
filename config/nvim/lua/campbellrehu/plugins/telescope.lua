return {
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.6",
  dependencies = { 
    "nvim-lua/plenary.nvim", 
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local telescope_config = require("telescope.config")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local helpers = require("campbellrehu.core.helpers")
    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

    -- search hidden files and follow symbolic links. source=https://mischavandenburg.com/zet/neovim-telescope-follow-symlinks/
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")
    table.insert(vimgrep_arguments, "-L")


    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
          }
        },
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*", "-L"}
        },
      }
    })

    telescope.load_extension("fzf")

    helpers.generateKeymap("n", "<leader>ff", builtin.find_files, "[F]ind [F]iles")
    helpers.generateKeymap("n", "<leader>ft", builtin.live_grep, "[F]ind [T]ext in current working directory")
    helpers.generateKeymap("n", "<leader>fb", builtin.buffers, "[F]ind [B]uffer")
    helpers.generateKeymap("n", "<leader>fh", builtin.help_tags, "[F]ind [H]elp")
    helpers.generateKeymap("n", "<leader>fk", builtin.keymaps, "[F]ind [K]eymap")
    helpers.generateKeymap("n", "<leader>fc", builtin.grep_string, "[F]ind string under [C]ursor")
    helpers.generateKeymap("n", "<leader>fd", "<cmd>TodoTelescope<CR>", "[F]ind TO[D]Os")

  end
}
