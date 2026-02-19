local function getWords()
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
		return vim.fn.wordcount().visual_words .. " words"
	else
		return vim.fn.wordcount().words .. " words"
	end
end

local function getChars()
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		return vim.fn.wordcount().visual_chars .. " chars"
	else
		return vim.fn.wordcount().chars .. " chars"
	end
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
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
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "diff", "diagnostics" },
			lualine_y = { "branch" },
			lualine_z = { "lsp_status" },
		},
		winbar = { -- top view
			lualine_a = { { "filename", path = 1 } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = { { "filename", path = 1 } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		sections = { -- bottom view
			lualine_a = { "mode" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "encoding", "fileformat", "filetype", "filesize" },
			lualine_y = { getWords, getChars },
			lualine_z = { "location", "progress" },
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
	},
}
