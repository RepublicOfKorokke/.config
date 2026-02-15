return {
	"vim-skk/skkeleton",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "vim-denops/denops.vim" },
		{ "delphinus/skkeleton_indicator.nvim", opts = {} },
	},
	config = function()
		vim.keymap.set({ "i", "c", "t" }, "<C-l>", "<Plug>(skkeleton-toggle)", { desc = "toggle skkeleton" })
		local dicts = vim.fn.glob("~/skk/*", true, true)
		vim.fn["skkeleton#config"]({
			eggLikeNewline = true,
			globalDictionaries = dicts,
		})
	end,
}
