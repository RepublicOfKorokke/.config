return {
	"VonHeikemen/fine-cmdline.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	config = function()
		require("fine-cmdline").setup({
			hooks = {
				after_mount = function(input)
					local fn = require("fine-cmdline").fn

					vim.keymap.set(
						"i",
						"<C-k>",
						fn.up_search_history,
						{ buffer = input.bufnr, noremap = true, silent = true, desc = "Up Search History" }
					)
					vim.keymap.set(
						"i",
						"<C-j>",
						fn.down_search_history,
						{ buffer = input.bufnr, noremap = true, silent = true, desc = "Down Search History" }
					)
					vim.keymap.set(
						"i",
						"<C-p>",
						fn.up_history,
						{ buffer = input.bufnr, noremap = true, silent = true, desc = "Up History" }
					)
					vim.keymap.set(
						"i",
						"<C-n>",
						fn.down_history,
						{ buffer = input.bufnr, noremap = true, silent = true, desc = "Down History" }
					)
				end,
			},
		})
		function open_fine_replace()
			local fineline = require("fine-cmdline")
			fineline.open({
				default_value = "%s//gc",
			})

			vim.defer_fn(function()
				local left_keys = vim.api.nvim_replace_termcodes(
					"<Left><Left><Left>",
					true, -- from_part
					true, -- do_lt
					true -- special
				)
				vim.api.nvim_feedkeys(left_keys, "i", false) -- Send in insert mode
			end, 10) -- Wait 10 ms before sending
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader><C-r>",
			"<cmd>lua open_fine_replace()<CR>",
			{ noremap = true, silent = true, desc = "Fine Replace" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-p>",
			':lua require("fine-cmdline").open()<CR>',
			{ noremap = true, silent = true, desc = "Open Commandline" }
		)
	end,
}
