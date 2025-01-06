return {
    "projekt0n/github-nvim-theme",
    lazy = false,
    config = function()
        require("github-theme").setup({
            options = {
                transparent = true, -- Disable setting background
            },
        })
        vim.cmd("colorscheme github_dark")
    end,
}
