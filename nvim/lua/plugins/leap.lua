return {
	"https://codeberg.org/andyg/leap.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap to next char" })
		vim.keymap.set("n", "S", "<Plug>(leap-anywhere)", { desc = "Leap to next char anywhere" })
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		require("leap.user").set_repeat_keys("<TAB>", "<S-Tab>")
		do
			-- Return an argument table for `leap()`, tailored for f/t-motions.
			local function as_ft(key_specific_args)
				local common_args = {
					inputlen = 1,
					inclusive = true,
					-- To limit search scope to the current line:
					-- pattern = function (pat) return '\\%.l'..pat end,
					opts = {
						labels = "", -- force autojump
						safe_labels = vim.fn.mode(1):match("[no]") and "" or nil, -- [1]
					},
				}
				return vim.tbl_deep_extend("keep", common_args, key_specific_args)
			end

			local clever = require("leap.user").with_traversal_keys -- [2]
			local clever_f = clever("f", "F")
			local clever_t = clever("t", "T")

			for key, key_specific_args in pairs({
				f = { opts = clever_f, desc = "Leap to next char" },
				F = { backward = true, opts = clever_f, desc = "Leap to prev char" },
				t = { offset = -1, opts = clever_t, desc = "Leap to before next char" },
				T = { backward = true, offset = 1, opts = clever_t, desc = "Leap to after prev char" },
			}) do
				vim.keymap.set({ "n", "x", "o" }, key, function()
					require("leap").leap(as_ft(key_specific_args))
				end)
			end
		end
	end,
	dependencies = { "tpope/vim-repeat" },
}
