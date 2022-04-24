local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mhinz/vim-startify'
    use 'francoiscabrol/ranger.vim'
    use 'voldikss/vim-floaterm'
    use 'justinmk/vim-sneak'
    use {'rbgrouleff/bclose.vim', lock = true} -- bclose closes ranger term from buffers
    use 'lunarvim/colorschemes'
    use 'folke/tokyonight.nvim'

    use "hrsh7th/nvim-cmp" -- core of completion
    use "hrsh7th/cmp-buffer" -- buffer source
    use "hrsh7th/cmp-path" -- path source
    use "hrsh7th/cmp-nvim-lua"
    -- for LSP!! use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    -- use "saadparwaiz1/cmp_luasnip"
    -- use "L3MON4D3/LuaSnip"
    -- use "rafamadriz/friendly-snippets"

end)
