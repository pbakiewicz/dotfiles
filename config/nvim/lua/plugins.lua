local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    "mhinz/vim-startify",
    {
        "f-person/git-blame.nvim",
        opts = {
            enabled = false, -- on startup disabled
            date_format = "%r",
            message_template = "<summary> * <date> * <author>"
        },
    },
    "voldikss/vim-floaterm",
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- w lazy.nvim to jest obudowane w require(MAIN).setup(opts)
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<cr>",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    }
                },
            })

        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        },
    },
    -- completion stuff
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-path",
    -- sneak
    "justinmk/vim-sneak",
    -- lsp
    {
      "neovim/nvim-lspconfig",
       config = function()
           vim.lsp.enable("pyright");
           vim.lsp.enable("dockerls");

       end,
    },
    -- mason aby installowac lsp/dap/lintery itd. tylko dla neovim
    {
       "mason-org/mason.nvim",
       -- te opts akurat, ze ponoc nie bede musial setupowac tego plugin explicite
        opts = {}
    },
    -- comments
    {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    -- debugging
    {
      -- tutaj ten glowny plugin umozliwiajacy polaczenie sie z serwerem dap
      "mfussenegger/nvim-dap",
      keys = {
        {
          "<leader>db",
          function() require("dap").toggle_breakpoint() end,
          desc = "Toggle Breakpoint"
        },

        {
          "<leader>dc",
          function() require("dap").continue() end,
          desc = "Continue"
        },

        {
          "<leader>dC",
          function() require("dap").run_to_cursor() end,
          desc = "Run to Cursor"
        },

        {
          "<leader>dT",
          function() require("dap").terminate() end,
          desc = "Terminate"
        },
      },
    },

    {
      -- tutaj dodatkowy plugin zalatwiajacy od razu konfiguracje do pythona
      "mfussenegger/nvim-dap-python",
      -- to akurat musi byc bo inaczej ze nie znalazlo konfiguracji.
      config = function()
        require("dap-python").setup(python)
      end,
      -- Consider the mappings at
      -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
      dependencies = {
        "mfussenegger/nvim-dap",
      },
    },
},

})
