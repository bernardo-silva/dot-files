local opts = { noremap = true, silent = true }
local expr_opts = { expr = true, noremap = true, silent = true }

local term_opt = { silent = true }

local keymap = vim.api.nvim_set_keymap


-- Space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


keymap("n", "gA", "$i", opts)

-- Open explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)


-- Visual mode
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Files
-- keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

keymap("n", "<leader>n", "<cmd>vnew<cr>", opts)

-- Buffers
-- keymap("n", "<leader>bd", "<cmd>bd<cr>", opts)
-- Move between buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

keymap("n", "<leader>r", ":MagmaEvaluateOperator<cr>", expr_opts)
keymap("n", "<leader>rr", "<cmd>MagmaEvaluateLine<cr>", opts)

-- TagBar
-- keymap("n", "<leader>tt", "<cmd>TagbarToggle<cr>", opts)
-- keymap("n", "<leader>tj", "<cmd>TagbarOpenAutoClose<cr>", opts)
