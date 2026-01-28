return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "go", "c", "lua", "vim", "vimdoc", "query" },
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
}
