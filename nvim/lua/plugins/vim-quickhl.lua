return {
    "t9md/vim-quickhl",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.api.nvim_set_keymap("", "<leader>m", "<Plug>(quickhl-manual-this)", { noremap = true })
        vim.api.nvim_set_keymap("", "<leader>M", "<Plug>(quickhl-manual-reset)", { noremap = true })
    end,
}
