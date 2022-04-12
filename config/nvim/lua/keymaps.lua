vim.g.mapleader = ','
vim.g.maplocalleader = ','

local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

k("n", "<leader><leader>", ":w<CR>", opts)
k("n", "<leader>.", ":wq<CR>", opts)
k("n", "..", ":q!", opts)

-- sane navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)
-- buffers
k("n", "<TAB>", ":bnext<CR>", opts)
k("n", "<S-TAB>", ":bprevious<CR>", opts)
-- tabs
k("n", "gn", ":tabnew<CR>", opts)
k("n", "gk", ":tabnext<CR>", opts)
k("n", "gj", ":tabprev<CR>", opts)
-- fav save
k("i", "jk", "<Esc>", opts)

-- resizing
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
k("v", "<A-j>", ":m '>+1<CR>gv", opts)
k("v", "<A-k>", ":m '<-2<CR>gv", opts)

-- Pasting puts new value into void registry
k("v", "p", '"_dP', opts)

-- nmap <leader>g :FloatermNew --height=1.0 --width=1.0 --autoclose=1 lazygit<CR>