return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
		vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua builtin<Return>", { noremap = true, desc = "Find Files" })
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>fd",
			":FzfLua diagnostics_document<Return>",
			{ noremap = true, desc = "Diagnostics" }
		)
		vim.api.nvim_set_keymap("n", "<Leader>fg", ":FzfLua live_grep<Return>", { noremap = true, desc = "Live Grep" })
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>fG",
			":FzfLua grep_cword<Return>",
			{ noremap = true, desc = "Grep Cword" }
		)
		vim.api.nvim_set_keymap("n", "<Leader>fl", ":FzfLua blines<Return>", { noremap = true, desc = "Buffer Lines" })
		vim.api.nvim_set_keymap("n", "<Leader>fn", ":FzfLua files<Return>", { noremap = true, desc = "Files" })
		vim.api.nvim_set_keymap("n", "<Leader>fN", ":FzfLua oldfiles<Return>", { noremap = true, desc = "Oldfiles" })
		vim.api.nvim_set_keymap("n", "<Leader>fb", ":FzfLua buffers<Return>", { noremap = true, desc = "Buffers" })
		vim.api.nvim_set_keymap("n", "<Leader>ft", ":FzfLua tabs<Return>", { noremap = true, desc = "Tabs" })
	end,
}
