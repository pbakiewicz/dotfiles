local function setup_lsp()
    local on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        -- gi przy pyright w ogóle nie istnieje, gdyz python nie ma osobnej deklaracji od
        -- wlasciwej implementacji jak np. go gdzie deklarujemy funkcje w structcie, a
        -- implementujemy ją poniżej.
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
        -- gt trochę najdziwniejsze, gd pójdzie gdzie tą zmienną zadeklarowaliśmy,
        -- a gt, czym ta zmienna faktycznie jest. W pythonie imho przy braku super
        -- stubsow gd i gt pojdzie w to samo miejsce.
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "dj", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "dk", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ff", function() require("conform").format({ lsp_format = "fallback" }) end, { buffer = 0 })
    end

    local diagnostic_config = {
        virtual_text = false, -- don't show red info
        float = {
            focusable = false,
            source = "always",
        }
    }

    -- Tutaj podpinamy shortcuty pod każdy z lsp
    local servers = { 'pyright', 'dockerls', 'lua_ls' }
    for _, server in ipairs(servers) do
        -- to jest z tego pluginu z configuracja
        vim.lsp.config(server, {
            on_attach = on_attach,
            diagnostics = diagnostic_config,
        })
    end
end

return {
    {
        "neovim/nvim-lspconfig", config = setup_lsp
    },
    {
        "mason-org/mason.nvim",
        -- te opts akurat, ze ponoc nie bede musial setupowac tego plugin explicite
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = { ensure_installed = { "lua_ls", "pyright", "dockerls" } }
    },
    {
        'stevearc/conform.nvim', -- aby połączyć blacka z LSP
        opts = {
            formatters_by_ft = {
                python = { "black" },
            },
        }
    },

}
