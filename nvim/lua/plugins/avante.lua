return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "lmstudio",
		auto_suggestions_provider = "lmstudio",
		providers = {
			lmstudio = {
				__inherited_from = "openai",
				endpoint = "http://localhost:1234/v1",
				api_key_name = "",
				model = "qwen/qwen3-4b",
			},
		},
		input = {
			provider = "snacks",
			provider_opts = {
				title = "Avante Input",
				icon = " ",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	},
}
