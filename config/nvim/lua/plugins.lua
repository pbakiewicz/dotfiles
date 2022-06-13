local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- pretty much required for LSP to function
    use 'mhinz/vim-startify'
    use 'voldikss/vim-floaterm'
    use 'justinmk/vim-sneak'
    use 'lunarvim/colorschemes'
    use 'folke/tokyonight.nvim'

    -- telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-file-browser.nvim" }


    -- completions
    use "hrsh7th/nvim-cmp" -- core
    use "hrsh7th/cmp-nvim-lsp" -- LSP baby
    use "hrsh7th/cmp-buffer" -- buffer
    use "hrsh7th/cmp-path" -- path
    use "hrsh7th/cmp-nvim-lua" -- neovim Lua API

    use "f-person/git-blame.nvim" -- for blaming

    -- snippets
    -- https://youtu.be/_DnmphIwnjo?t=785
    -- use "saadparwaiz1/cmp_luasnip"
    -- use "L3MON4D3/LuaSnip"
    -- use "rafamadriz/friendly-snippets"

end)
