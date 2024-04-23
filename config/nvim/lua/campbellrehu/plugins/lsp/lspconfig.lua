return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local helpers = require("campbellrehu.core.helpers")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local generateLSPKeymap = function(mode, keymap, command, description, buffer)
					helpers.generateKeymap(
						mode,
						keymap,
						command,
						{ buffer = buffer, silent = true, desc = description }
					)
				end
				-- setup keymaps
				generateLSPKeymap("n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references", ev.buf)
				generateLSPKeymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration", ev.buf)
				generateLSPKeymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions", ev.buf)
				generateLSPKeymap(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					"Show LSP implementations",
					ev.buf
				)
				generateLSPKeymap(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					"Show LSP type definitions",
					ev.buf
				)
				generateLSPKeymap(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					"See available code actions",
					ev.buf
				)
				generateLSPKeymap("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename", ev.buf)
				generateLSPKeymap(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					"Show buffer diagnostics",
					ev.buf
				)
				generateLSPKeymap("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", ev.buf)
				generateLSPKeymap("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic", ev.buf)
				generateLSPKeymap("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic", ev.buf)
				generateLSPKeymap("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor", ev.buf)
				generateLSPKeymap("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP", ev.buf)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
