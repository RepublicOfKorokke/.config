return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig" },
		{ "Jint-lzxy/lsp_signature.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	opts = {
		ensure_installed = {
			"bashls",
			"cssls",
			"lua_ls",
			"pyright",
			"ruff",
			"rust_analyzer",
			"ts_ls",
			"yamlls",
		},
	},
}
