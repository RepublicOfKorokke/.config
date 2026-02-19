return {
	"t9md/vim-quickhl",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>m", "<Plug>(quickhl-manual-this)", mode = "n", desc = "Highlight Current" },
		{ "<leader>M", "<Plug>(quickhl-manual-reset)", mode = "n", desc = "Reset Highlight" },
	},
}
