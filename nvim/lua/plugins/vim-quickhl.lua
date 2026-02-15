return {
	"t9md/vim-quickhl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.api.nvim_set_keymap(
			"",
			"<leader>m",
			"<Plug>(quickhl-manual-this)",
			{ noremap = true, desc = "Highlight Current" }
		)
		vim.api.nvim_set_keymap(
			"",
			"<leader>M",
			"<Plug>(quickhl-manual-reset)",
			{ noremap = true, desc = "Reset Highlight" }
		)
	end,
}
