return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
				-- [options]
			},
		})
	end,
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"andymass/vim-matchup",
	},
}
