local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mhinz/vim-startify'
    use 'francoiscabrol/ranger.vim'
    use 'voldikss/vim-floaterm'
    use 'justinmk/vim-sneak'
    use {'rbgrouleff/bclose.vim', lock = true} -- bclose closes ranger term from buffers
    use 'lunarvim/colorschemes' -- more colors scheme like tokyonight

    -- completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
end)
