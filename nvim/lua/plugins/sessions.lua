return {
    "natecraddock/sessions.nvim",
    event = "VeryLazy",
    config = function()
        require("sessions").setup({
            events = { "VimLeavePre", "WinEnter" },
            session_filepath = vim.fn.stdpath("data") .. "/sessions",
            absolute = true,
        })

        vim.api.nvim_set_keymap("n", "<Leader>ss", ":SessionsSave<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>sl", ":SessionsLoad<Return>", { noremap = true })
    end,
}
