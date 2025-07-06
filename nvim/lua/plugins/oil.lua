return {
	"stevearc/oil.nvim",
	keys = {
		{ "<C-n><C-n>", ":Oil<cr>", mode = "n" },
	},
	opts = {
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<TAB>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["g."] = "actions.toggle_hidden",
		},
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
		},
		delete_to_trash = false,
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
