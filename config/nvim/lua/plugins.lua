local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mhinz/vim-startify'
    use 'francoiscabrol/ranger.vim'
    use 'voldikss/vim-floaterm'
end)
