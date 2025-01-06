return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    config = function()
        require("fzf-lua").setup({
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
        })
        vim.api.nvim_set_keymap("n", "<Leader>f", ":FzfLua builtin<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fq", ":FzfLua quickfix<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fQ", ":FzfLua quickfix_stack<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fg", ":FzfLua live_grep<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fG", ":FzfLua grep_cword<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fl", ":FzfLua blines<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fL", ":FzfLua lines<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua files<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fF", ":FzfLua oldfiles<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fb", ":FzfLua buffers<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>ft", ":FzfLua tabs<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fr", ":FzfLua resume<Return>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>fR", ":FzfLua registers<Return>", { noremap = true })
    end,
}
