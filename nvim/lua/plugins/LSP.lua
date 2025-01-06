return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "Jint-lzxy/lsp_signature.nvim", opts = {} },
		{ "j-hui/fidget.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
		})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				})
				vim.notify("Set LSP by mason: " .. server_name)
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,
		})
		require("fidget").setup({})
	end,
}
