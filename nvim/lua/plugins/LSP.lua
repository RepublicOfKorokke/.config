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
		require("fidget").setup({})
	end,
}
