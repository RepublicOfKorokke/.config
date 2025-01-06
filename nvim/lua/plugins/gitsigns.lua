return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        numhl = true,
        linehl = false,
        word_diff = true,
        current_line_blame = true,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "[g", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "]g", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "<leader>gp", gs.preview_hunk)
            map("n", "<leader>gs", gs.stage_hunk)
            map("v", "<leader>gs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", "<leader>gS", gs.stage_buffer)
            map("n", "<leader>gu", gs.undo_stage_hunk)
            map("v", "<leader>gu", function()
                gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", "<leader>gr", gs.reset_hunk)
            map("v", "<leader>gr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", "<leader>gR", gs.reset_buffer)
            map("n", "<leader>gb", function()
                gs.blame_line({ full = true })
            end)
            map("n", "<leader>gd", gs.toggle_deleted)
        end,
    },
}
