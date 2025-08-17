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
		vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua builtin<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>fd", ":FzfLua diagnostics_document<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>fg", ":FzfLua live_grep<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>fn", ":FzfLua files<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>fb", ":FzfLua buffers<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>ft", ":FzfLua tabs<Return>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>fr", ":FzfLua resume<Return>", { noremap = true })
	end,
}
