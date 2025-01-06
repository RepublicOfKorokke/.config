return {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("scrollbar").setup()
        require("scrollbar.handlers.gitsigns").setup()
    end,
}
