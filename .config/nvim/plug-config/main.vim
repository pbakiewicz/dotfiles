syntax on " highlight stuff
colorscheme gruvbox
"set nowrap "wrapping is bad - PS but not really for small floating windows
set cursorline " highlight line with cursor
set clipboard=unnamedplus " copying to default clipboard
set splitbelow splitright " normal splitting
set mouse=a " use mouse
set number relativenumber " numbers
set backspace=indent,eol,start " backspace deletes everyhing
set nobackup " recommended by coc
set nowritebackup " recommended by coc
set noshowmode " no ---INSERT -- anymore
set showtabline=2 "always show tabs
set tabstop=2 "bigger tabs
"hi Normal guibg=NONE ctermbg=NONE " transparent backgorund

"Navigating between windows
:map <C-h> <C-w>h
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-l> <C-w>l
"Shortcuts
map <leader>, :w<CR>
map <leader>. :wq<CR>
"Buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
"TODO: check why <C-m> gave wiers in fugitive
map ]q :cnext<CR>
map [q :cprev<CR>
" Shortcuts for tabs
nnoremap gn :tabnew<CR>
nnoremap gk :tabnext<CR>
nnoremap gj :tabprev<CR>
"For yaml to have 2 spaces not weird tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"Better colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set t_Co=256
set termguicolors

" escaping?
inoremap jk <Esc>
inoremap kj <Esc>

" resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

"for nvim python version
set pyx=3

"For exporting to pdf on every *note* file save
autocmd BufWritePost note-*.md silent !buildNote %:p

