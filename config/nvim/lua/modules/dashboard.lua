return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'hyper',
            config = {
                week_header = { enable = true },
                shortcut = {
                    { desc = "󰈞 Find", action = "Telescope find_files", key = "ff" },
                    { desc = " Dotfiles", action = "lcd ~/o/dotfiles | Telescope find_files", key = "d" },
                },
            }
        })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
