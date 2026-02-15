return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "*", "#", "g*", "g#", "/" },
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
		vim.api.nvim_set_keymap(
			"n",
			"*",
			[[*<Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Search Word Forward" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"#",
			[[#<Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Search Word Backward" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"g*",
			[[g*<Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Search Word Forward" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"g#",
			[[g#<Cmd>lua require('hlslens').start()<CR>]],
			{ noremap = true, desc = "Search Word Backward" }
		)
	end,
}
