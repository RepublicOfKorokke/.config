local M = {}

--- Format the buffer and show which formatter is used.
---@param bufnr integer|nil  Buffer to act on (defaults to current)
M.do_format = function(bufnr)
	local conform = require("conform")
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local infos, _ = conform.list_formatters_to_run(bufnr)
	for _, info in ipairs(infos) do
		vim.notify("Format by conformat: " .. info.name, vim.log.levels.INFO, { title = "Conform" })
	end

	conform.format({ bufnr = bufnr })
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>lf",
			function()
				M.do_format()
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},

	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = {
				-- To fix auto-fixable lint errors.
				"ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
			rust = { "rustfmt" },
			sh = { "shfmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
		},

		default_format_opts = {
			lsp_format = "never",
		},
	},

	config = function(_, opts)
		local conform = require("conform")
		vim.notify("Formatter loaded")

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				M.do_format(args.buf)
			end,
		})

		conform.setup(opts)
	end,
}
