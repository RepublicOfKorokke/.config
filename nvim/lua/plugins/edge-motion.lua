return {
    "haya14busa/vim-edgemotion", -- move code block quickly
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.api.nvim_set_keymap("n", "<C-j>", "<Plug>(edgemotion-j)", { noremap = true })
        vim.api.nvim_set_keymap("n", "<C-k>", "<Plug>(edgemotion-k)", { noremap = true })
    end,
}
