return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		mason.setup({
			ui = {
				icons = {
					package_installed = "󰄬",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"pyright",
				"bashls",
				"csharp_ls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"gopls",
				"jsonls",
				"marksman",
				"sqlls",
				"taplo",
				"terraformls",
				"hydra_lsp",
			},
		})
	end,
}
