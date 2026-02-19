return {
	"haya14busa/vim-edgemotion", -- move code block quickly
	event = "VeryLazy",
	config = function()
		vim.api.nvim_set_keymap("n", "<C-j>", "<Plug>(edgemotion-j)", { noremap = true, desc = "Move Down" })
		vim.api.nvim_set_keymap("n", "<C-k>", "<Plug>(edgemotion-k)", { noremap = true, desc = "Move Up" })
	end,
}
