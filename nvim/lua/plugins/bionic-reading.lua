local target_filetypes = { "text", "markdown", "json" }

return {
	{
		"FluxxField/bionic-reading.nvim",
		ft = target_filetypes,

		opts = function()
			local file_types_config = {}
			for _, ft in ipairs(target_filetypes) do
				file_types_config[ft] = "any"
			end

			return {
				file_types = file_types_config,
			}
		end,
	},
}
