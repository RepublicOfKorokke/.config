vim.loader.enable() -- byte-compiles and caches Lua files

-- disable default vim plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("autocmd!") -- remove all autocmd

vim.api.nvim_create_user_command("FormatJson", "%!jq '.'", {})
vim.api.nvim_create_user_command("TX", "split | wincmd j | resize 20 | terminal ", {})
