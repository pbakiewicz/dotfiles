
"For running ctrlp
set runtimepath^=~/.config/nvim/other/ctrlp.vim
let g:ctrlp_show_hidden = 1  "for showing hidden files
set diffopt+=vertical  "for splitting only vertically

" For default start in buffers. Use ranger to look for files.
let g:ctrlp_cmd = "CtrlPBuffer"
" For searing in tags TODO: sync with tag file
nnoremap <leader>t :CtrlPTag<CR>
