local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- pretty much required for LSP to function
    use 'mhinz/vim-startify'
    use 'francoiscabrol/ranger.vim'
    use 'voldikss/vim-floaterm'
    use 'justinmk/vim-sneak'
    use {'rbgrouleff/bclose.vim', lock = true} -- bclose closes ranger term from buffers
    use 'lunarvim/colorschemes'
    use 'folke/tokyonight.nvim'

    -- completions
    use "hrsh7th/nvim-cmp" -- core
    use "hrsh7th/cmp-nvim-lsp" -- LSP baby
    use "hrsh7th/cmp-buffer" -- buffer
    use "hrsh7th/cmp-path" -- path
    use "hrsh7th/cmp-nvim-lua" -- neovim Lua API

    -- snippets
    -- https://youtu.be/_DnmphIwnjo?t=785
    -- use "saadparwaiz1/cmp_luasnip"
    -- use "L3MON4D3/LuaSnip"
    -- use "rafamadriz/friendly-snippets"

end)
