"{{{ Plugin installed
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'justinmk/vim-sneak'
Plug 'dylanaraps/wal.vim'
call plug#end()
"}}}

"{{{ Main settings
let mapleader = ","
syntax on " highlight stuff
colorscheme darkblue

"{{{2 Variables
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
"Better colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set t_Co=256
" set termguicolors
set foldmethod=marker " Folding with {{{ - }}}
set pyx=3 "for nvim python version
"}}}2

"{{{2 Shortcuts
map <leader>, :w<CR>
map <leader>. :wq<CR>

:map <C-h> <C-w>h
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-l> <C-w>l
"Buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
" Shortcuts for tabs
nnoremap gn :tabnew<CR>
nnoremap gk :tabnext<CR>
nnoremap gj :tabprev<CR>
" quick escaping
inoremap jk <Esc>
inoremap kj <Esc>

" resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

"TODO: check why <C-m> gave wiers in fugitive
map ]q :cnext<CR>
map [q :cprev<CR>
""}}}2

"For yaml to have 2 spaces not weird tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"For exporting to pdf on every *note* file save
autocmd BufWritePost note-*.md silent !buildNote %:p
autocmd BufWritePost todos.md silent !buildTODO
"}}}

"{{{ Coc settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-arg>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>s
"}}}

"{{{ Startify
"to be able to use AG
let g:startify_change_to_dir = 0
"}}}

"{{{ Fugitive
:map <leader>b :Gblame<CR>

"Fugitive staged differences
command Greview :Git diff --staged
nnoremap <leader>gr :Greview<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gs :Gstatus<cr>
"}}}

"{{{ NerdTree
:map <leader>v :NERDTreeToggle<CR>

"Start NerdTree when no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"}}}

"{{{ Python
"For python 
"set fdm=indent
imap <C-b> import pudb; pu.db
imap <C-v> from blackfire import probe; probe.initialize(); probe.enable()
"autocmd BufWritePost *.py call Flake8() "flake8 on save


2mat ErrorMsg '\%119v.' "highlights 81st char
"}}}

"{{{ Ag
"######################################
"For SILVER SEARCHER
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
"nnoremap K :grep! --py "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
" AG for /
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
"#############################################
"}}}

"{{{ Ctrlp
"For running ctrlp
set runtimepath^=~/.config/nvim/other/ctrlp.vim
let g:ctrlp_show_hidden = 1  "for showing hidden files
set diffopt+=vertical  "for splitting only vertically

" For default start in buffers. Use ranger to look for files.
let g:ctrlp_cmd = "CtrlPBuffer"
" For searing in tags TODO: sync with tag file
nnoremap <leader>t :CtrlPTag<CR>
"}}}

"{{{ Quickscope

"conf for quickscope https://www.chrisatmachine.com/Neovim/14-quickscope/
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150
"}}}

"{{{ Sneak
let sneak#label = 1
"}}}
