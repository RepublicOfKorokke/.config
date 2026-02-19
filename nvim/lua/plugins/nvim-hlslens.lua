return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "*", [[*<Cmd>lua require('hlslens').start()<CR>]], mode = "n", desc = "jump to word with hlslens" },
		{ "#", [[#<Cmd>lua require('hlslens').start()<CR>]], mode = "n", desc = "jump to previous word with hlslens" },
	},
	config = function()
		require("hlslens").setup()
		vim.api.nvim_set_keymap(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Next Search" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Previous Search" }
		)
	end,
}
