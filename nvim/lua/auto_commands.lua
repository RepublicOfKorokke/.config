local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- Set indent width
autocmd("BufEnter", {
    setlocal,
    pattern = "*.rs",
    command = "set shiftwidth=4",
})

autocmd("BufEnter", {
    setlocal,
    pattern = { "*.ts", "*.tsx" },
    command = "set shiftwidth=2",
})

autocmd("BufEnter", {
    setlocal,
    pattern = { "*.json" },
    command = "set shiftwidth=2",
})

autocmd("LspAttach", {
    callback = function(args)
        local server_name = vim.lsp.get_client_by_id(args.data.client_id).name
        vim.notify("LSP server: " .. server_name .. "\nAttached to: " .. vim.fn.expand("%"))
        -- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]) -- auto format on save
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>ll", function()
            vim.notify("LSP server: " .. server_name .. "\nAttached to: " .. vim.fn.expand("%"))
        end)
        vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
        end)
        -- LSP handlers
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                format = function(diagnostic)
                    return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
                end,
            },
        })
    end,
})
