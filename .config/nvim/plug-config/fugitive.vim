:map <leader>b :Gblame<CR>

"Fugitive staged differences
command Greview :Git diff --staged
nnoremap <leader>gr :Greview<cr>
nnoremap <leader>gc :Gcommit<cr>

