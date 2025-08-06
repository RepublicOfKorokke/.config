return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	opts = {
		options = {
			transparent = true, -- Disable setting background
		},
	},
	config = function(_, opts)
		require("github-theme").setup(opts)
		vim.cmd("colorscheme github_dark")
	end,
}
