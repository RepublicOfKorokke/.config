local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true,
	shell = "fish", -- which shell to use when execute Ex command
	-- mouse = "", -- disable mouse operation
	timeoutlen = 500, -- wait time for keys: ESC, combination, etc.
	updatetime = 300, -- wait input for this ms. after no key input, write to swap
	undofile = true, -- save operation to file for undo after close file
	writebackup = true, -- make backup before save file
	backup = false, -- do not save backup file after file saved successfully
	backupskip = { "/tmp/*", "/private/tmp/*" }, -- do not make backup when files are in this dir
	swapfile = true, -- use swap file
	showmode = false, -- show current mode: insert, visual
	cmdheight = 1, -- Ex command UI heigh
	conceallevel = 0, -- do not hide any text automatically
	hlsearch = true, -- highlight matched text
	ignorecase = true, -- ignore text case
	smartcase = true, -- pattern with at least one uppercase character, the search becomes case sensitive
	showtabline = 2, -- show tab always
	smartindent = true, -- set indent widht by last line
	termguicolors = true, -- use true color
	expandtab = true, -- use white space instead of tab
	shiftwidth = 4, -- size of auto indent
	tabstop = 4, -- how much white spaces for convert <Tab>
	cursorline = true, -- hilight cursor line
	cursorcolumn = true, -- hilight cursor column
	number = true, -- show line number
	relativenumber = false, -- do not show relative number corresponding to current line
	numberwidth = 4, -- width for line number
	wrap = false, -- do not wrap long line
	completeopt = { "menuone" }, -- text complement UI option
	pumheight = 10, -- max height of text complement
	pumblend = 30, -- transpaalent pum
	winblend = 30, -- transparent all floating window
	scrolloff = 10, -- how much margin for top and bottom line
	sidescrolloff = 15, -- how much margin for left and right
	splitbelow = true,
	splitright = true,
	autochdir = false, -- change the working dir automatically; I use it, but not worth
	signcolumn = "yes",
	spell = true,
	spelllang = { "en_us" },
	foldmethod = "indent", -- options) manual indent expr  syntax diff  marker
	foldcolumn = "4", -- how many columns to show folding indicator on left
	foldlevelstart = 99, -- 0 for close all, 99 for open all on start
}

vim.opt.shortmess:append("c") -- do not show ins-completation-menu message

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.scriptencoding = "utf-8" -- this have to set after encoding
vim.cmd("set whichwrap+=<,>,[,],h,l") -- these keys can wrap move to next / previous line
vim.cmd([[set iskeyword+=-]]) -- add - as keyword for separation
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd("set tags=./.tags;,.tags;") -- find tags file till root
vim.cmd("set clipboard+=unnamedplus") -- To ALWAYS use the clipboard for ALL operations

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("trail:-")
vim.opt.listchars:append("tab:»-")
vim.opt.listchars:append("extends:»")
vim.opt.listchars:append("precedes:«")
vim.opt.listchars:append("nbsp:%")
