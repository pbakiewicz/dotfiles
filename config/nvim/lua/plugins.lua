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
    -- ogarnij lepiej te tabele w lua
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- == lepsze w tym kejse niz >>>>
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
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
            })

        end,
    },
})
