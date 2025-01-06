return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"stylua", -- lua formatter
				"black", -- python formatter
				"isort", -- python library importing sort formatter
			},
			automatic_installation = false,
			handlers = {},
		})

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					vim.notify("Format by : " .. client.name)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
				async = false,
			})
		end
		-- if you want to set up formatting on save, you can use this as a callback
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		-- add to your shared on_attach callback
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Anything not supported by mason.
			},
			on_attach = on_attach,
		})
	end,
}
