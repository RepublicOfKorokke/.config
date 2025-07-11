return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "seoul256",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				refresh = {
					statusline = 5000,
					tabline = 5000,
					winbar = 5000,
				},
			},
			tabline = { -- tab view
				lualine_a = { "tabs" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = { -- top view
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_winbar = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "encoding", "filetype", "fileformat" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			sections = { -- bottom view
				lualine_a = { "mode" },
				lualine_b = { "searchcount" },
				lualine_c = { "selectioncount" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "lsp_status" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		})
	end,
}
