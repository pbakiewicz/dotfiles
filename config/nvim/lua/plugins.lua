local packer = require('packer')

return packer.startup(function(use)
    -- basic packages
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- LSP even tho builtin requires this package.
    use 'mhinz/vim-startify'
    use 'voldikss/vim-floaterm'
    use 'justinmk/vim-sneak'
    use "f-person/git-blame.nvim" -- for blaming
    -- colorschemes
    use 'lunarvim/colorschemes'
    use 'folke/tokyonight.nvim'
    -- telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    -- comments
    use "tpope/vim-commentary"
    -- completions core plugin
    use "hrsh7th/nvim-cmp"
    -- completions sources
    use "hrsh7th/cmp-nvim-lsp" -- LSP baby
    use "onsails/lspkind.nvim" -- Make LSP more beautiful
    use "hrsh7th/cmp-buffer" -- buffer
    use "hrsh7th/cmp-path" -- path
    use "hrsh7th/cmp-nvim-lua" -- neovim Lua API
    use "saadparwaiz1/cmp_luasnip" -- snippets completion for LuaSnip specifically
    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    -- debugging
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'
    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- unit tests
    use "vim-test/vim-test"

end)
