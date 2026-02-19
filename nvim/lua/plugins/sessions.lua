return {
	"natecraddock/sessions.nvim",
	keys = {
		{ "<Leader>ss", ":SessionsSave<Return>", mode = "n", desc = "Save Session" },
		{ "<Leader>sl", ":SessionsLoad<Return>", mode = "n", desc = "Load Session" },
	},
	config = function()
		require("sessions").setup({
			session_filepath = vim.fn.stdpath("data") .. "/sessions",
			absolute = true,
		})
	end,
}
