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

call plug#end()

let mapleader = ","

source plug-config/main.vim
source plug-config/coc.vim
source plug-config/startify.vim
source plug-config/fugitive.vim
source plug-config/nerdtree.vim
source plug-config/python.vim
source plug-config/ag.vim
source plug-config/ctrlp.vim
source plug-config/quickscope.vim
source plug-config/sneak.vim
