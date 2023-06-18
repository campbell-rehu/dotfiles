local formatters = require("lvim.lsp.null-ls.formatters")

local function deepMergeTables(tables)
	local mergedTable = {}

	local function mergeInto(dest, src)
		for key, value in pairs(src) do
			if type(value) == "table" then
				-- If the value is a table, then merge it recursively
				if type(dest[key]) ~= "table" then
					dest[key] = {}
				end
				mergeInto(dest[key], value)
			else
				-- Otherwise, simply set the value
				dest[key] = value
			end
		end
	end

	-- Iterate through each table in the collection
	for _, tbl in ipairs(tables) do
		mergeInto(mergedTable, tbl)
	end

	return mergedTable
end

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

lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin-macchiato"

local defaultFormatters = {
	{ name = "stylua" },
	{ name = "prettier" },
	{ name = "beautysh" },
}

lvim.builtin.which_key.mappings["g"] = {
	["g"] = {
		"<cmd>:LazyGit<CR>",
		"Open LazyGit in a floating buffer",
	},
}

lvim.builtin.which_key.mappings["t"] = {
	["rf"] = {
		'<cmd>lua require("jester").run({ terminal_cmd = ":ToggleTerm" })<CR>',
		"Run tests in current file",
	},
}

local customPlugins = {}
local customLvimConfig = {}
local customWhichKeyMappings = {}
local customFormatters = {}

-- Retrieve custom config from custom-config module
local status, customConfig = pcall(require, "custom-config")
if status then
	customPlugins = customConfig.plugins
	customFormatters = customConfig.formatters
	customWhichKeyMappings = customConfig.whichKeyMappings
	customLvimConfig = customConfig.customLvimConfig
end

-- Merge default lvim config with any customLvimConfig
local allLvimConfig = deepMergeTables({ lvim, customLvimConfig })

-- Merge default plugins with any customPlugins
allLvimConfig.plugins = deepMergeTables({ lvim.plugins, customPlugins })

-- Merge default which_key mappings with any custom which_key mappings
allLvimConfig.builtin.which_key.mappings = deepMergeTables({ lvim.builtin.which_key.mappings, customWhichKeyMappings })

-- Merge default formatters with any custom formatters
formatters.setup(deepMergeTables({ defaultFormatters, customFormatters }))

lvim = allLvimConfig
