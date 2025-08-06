local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }
local map = { noremap = false }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", noremap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
--   n / v / s / o = '',

----- unbind some unused keymap -----
keymap("", "q", "<Nop>", noremap) -- unbind default macro key
keymap("", "<Leader>q", "q", noremap) -- bind macro key
keymap("", "<C-b>", "<Nop>", noremap) -- unbind scroll page up

----- F key maps -----
keymap("", "<F1>", ":FzfLua keymaps<CR>", noremap)
keymap("", "<F2>", "", noremap)
keymap("", "<F3>", "", noremap)
keymap("", "<F4>", "", noremap)
keymap("", "<F5>", "", noremap)
keymap("", "<F6>", "", noremap)
keymap("", "<F7>", "", noremap)
keymap("", "<F8>", "", noremap)
keymap("", "<F9>", "", noremap)
keymap("", "<F10>", "", noremap)
keymap("", "<F11>", ":set shiftwidth=", noremap)
keymap("", "<F12>", ":cd %:h", noremap)

----- basic keys -----
keymap("n", "<C-P>", ":", map)
keymap("i", "<C-g>", "<Esc>", map)
keymap("t", "<C-g><C-g>", "<C-\\><C-n>", map)

-- save
keymap("n", "<C-s>", ":update<Return>", noremap)
keymap("n", "<Leader><C-s>", ":noa update<Return>", noremap)

-- quit
keymap("n", "<C-q><c-q>", ":<C-u>qa<Return>", noremap)
-- close window (if not last window)
-- keymap("n", "<C-w>q", ":close<Return>", noremap)-

-- not yank line break
keymap("n", "Y", "y$", noremap)

-- not yank with x
keymap("", "x", '"_x', noremap)
keymap("", "X", '"_X', noremap)

-- redo with U
keymap("n", "U", "<c-r>", noremap) -- bind new keymap

-- home / end
keymap("", "<C-h>", "^", noremap)
keymap("", "<C-l>", "$", noremap)

-- serach
keymap("n", "<C-f>", "/", noremap)
keymap("x", "<C-f>", 'y/\\V<C-R>"<CR>', noremap)

-- replace searched word
keymap("n", "<c-r>", ":%s//gc<Left><Left><Left>", noremap)
keymap("v", "<c-r>", ":s//gc<Left><Left><Left>", noremap)

-- show diff between buffer and storage
keymap("n", "<S-d><S-d>", ":<C-u>w !diff --color -u % -<Return>", noremap)

-- centering after G
keymap("n", "G", "Gzz", noremap)

-- press esc twice to hide highlight
keymap("n", "<Esc><Esc>", ":noh<Return>", noremap)

--remove all marks
keymap("n", "<Leader>M", ":delm! | delm A-Z0-9<Return>", noremap)

-- stay in indent mode
keymap("v", "<", "<gv", noremap)
keymap("v", ">", ">gv", noremap)

-- select cursor to end (not line break)
keymap("v", "<C-l>", "$h", noremap)

----- insert mode -----
keymap("i", "<C-h>", "<Left>", noremap)
keymap("i", "<C-j>", "<Down>", noremap)
keymap("i", "<C-k>", "<Up>", noremap)
keymap("i", "<C-l>", "<Right>", noremap)

----- command mode -----
-- move cursor
keymap("c", "<C-h>", "<Left>", noremap)
keymap("c", "<C-l>", "<Right>", noremap)
keymap("c", "<C-a>", "<Home>", noremap)
keymap("c", "<C-e>", "<End>", noremap)

----- window / tabs -----
-- split window
keymap("n", "<C-w>s", ":new<Return><C-w>j", noremap)
keymap("n", "<C-w>v", ":vnew<Return><C-w>l", noremap)

-- close buffer
keymap("n", "<C-w>w", ":bd<Return>", noremap)

-- new tab
keymap("n", "<C-w>t", ":tabedit<Return>", silent_noremap)

-- move tab
keymap("n", "<C-w>p", "gT", noremap)
keymap("n", "<C-w>n", "gt", noremap)

-- move tab order
keymap("n", "<C-w>P", ":-tabmove<Return>", silent_noremap)
keymap("n", "<C-w>N", ":+tabmove<Return>", silent_noremap)

-- open current buffer on new tab
keymap("n", "<C-w>z", ":tabedit %<Return>", silent_noremap)

----- quickfix / location -----
keymap("n", "[q", ":cprevious<Return>", silent_noremap)
keymap("n", "]q", ":cnext<Return>", silent_noremap)
keymap("n", "[<S-q>", ":cfirst<Return>", silent_noremap)
keymap("n", "]<S-q>", ":clast<Return>", silent_noremap)

keymap("n", "[l", ":lprevious<Return>", silent_noremap)
keymap("n", "]l", ":lnext<Return>", silent_noremap)
keymap("n", "[<S-l>", ":lfirst<Return>", silent_noremap)
keymap("n", "]<S-l>", ":llast<Return>", silent_noremap)
