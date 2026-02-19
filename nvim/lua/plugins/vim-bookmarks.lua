return {
	"MattesGroeger/vim-bookmarks",
	keys = {
		{ "mm", "<Plug>BookmarkToggle", mode = "n", desc = "<Plug>BookmarkToggle" },
		{ "mi", "<Plug>BookmarkAnnotate", mode = "n", desc = "<Plug>BookmarkAnnotate" },
		{ "ma", "<Plug>BookmarkShowAll", mode = "n", desc = "<Plug>BookmarkShowAll" },
		{ "mj", "<Plug>BookmarkNext", mode = "n", desc = "<Plug>BookmarkNext" },
		{ "mk", "<Plug>BookmarkPrev", mode = "n", desc = "<Plug>BookmarkPrev" },
		{ "mc", "<Plug>BookmarkClear", mode = "n", desc = "<Plug>BookmarkClear" },
		{ "mx", "<Plug>BookmarkClearAll", mode = "n", desc = "<Plug>BookmarkClearAll" },
		{ "mkk", "<Plug>BookmarkMoveUp", mode = "n", desc = "<Plug>BookmarkMoveUp" },
		{ "mjj", "<Plug>BookmarkMoveDown", mode = "n", desc = "<Plug>BookmarkMoveDown" },
		{ "mg", "<Plug>BookmarkMoveToLine", mode = "n", desc = "<Plug>BookmarkMoveToLine" },
	},
	init = function()
		vim.g.bookmark_no_default_key_mappings = 1
	end,
}
