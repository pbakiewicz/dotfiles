local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

k("n", "<leader><leader>", ":w<CR>", opts)
k("i", "<leader><leader>", ":w<CR>", opts)
k("n", "<leader>.", ":wq<CR>", opts)
k("n", "..", ":q!<CR>", opts)

--telescope
k("n", "ff", ":Telescope git_files<CR>", opts)
k("n", "fg", "<cmd>lua require('telescope-config').live_grep()<cr>", opts)
k("n", "fb", ":Telescope buffers<cr>", opts)
-- Tutaj też można lsp_dynamic_workspace, bez podawania query, jeżeli repo nie jest ogromne.
k("n", "fs", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols({ignore_symbols='variable', query=vim.fn.input('Podaj symbol: ')})<CR>", opts)
k("n", "fc", ":Telescope colorscheme<cr>", opts)
k("n", "fm", ":Telescope marks<cr>", opts)
k("n", "<leader>f", "<cmd>lua require('telescope-config').file_browser()<cr>", opts)
k("n", "\\", ":Telescope lsp_document_symbols<CR>", opts)
k("n", "<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy=ascending,})<cr>", opts)


-- sane navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

--quickfix list, mostly for putting data with <C-q> from telescope
k("n", "]q", ":cnext<CR>", opts)
k("n", "]Q", ":clast<CR>", opts)
k("n", "[q", ":cprev<CR>", opts)
k("n", "[Q", ":cfirst<CR>", opts)
k("n", "<leader>q", ":cclose<CR>", opts)

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

-- Floaterm
k("n", "<C-\\>", ":FloatermToggle<CR>", opts)
-- Lazygit, zawsze warto sobie odświeżać co tam nowego.
k("n", "<leader>g", ":FloatermNew --height=1.0 --width=1.0 --autoclose=1 lazygit<CR>", opts)

-- blame
k("n", "<leader>b", ":GitBlameToggle<cr>", opts)
k("n", "<leader>bo", ":GitBlameOpenCommitURL<cr>", opts)

-- vim test
k("n", "t<C-n>", "<cmd>TestNearest<cr>", opts)
k("n", "t<C-f>", "<cmd>TestFile<cr>", opts)

-- debugger
k("n", "<F1>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
k("n", "<F2>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
k("n", "<F3>", "<Cmd>lua require'dap'.run_to_cursor()<CR>", opts)
k("n", "<F4>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
k("n", "<F5>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
k("n", "<F6>", "<Cmd>lua require'dap'.continue()<CR>", opts)
k("n", "<F7>", "<Cmd>lua require'dap'.repl.toggle()<CR>", opts)
k("n", "<F8>", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
k("n", "<F9>", "<Cmd>lua require'dapui'.eval(vim.fn.input 'Co zevaulować? ')<cr>", opts)
k("n", "<F10>", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Podaj warunek: '))<CR>", opts)
k("n", "<F12>", "<Cmd>lua require'dap'.terminate()<CR>", opts)
k("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
k("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)



-- for python only
k("n", "<space>", "zc", opts)
vim.api.nvim_exec(':autocmd FileType python :nmap <leader>c I#<esc>', false)
vim.api.nvim_exec(':autocmd FileType python :abbrev pudb import pudb; pu.db', false)
