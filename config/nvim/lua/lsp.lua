local nvim_lsp = require('lspconfig')

-- define server as in :h lspconfig-server-configurations
local servers = { 'gopls', 'sumneko_lua' , 'pyright'}


-- defining shared on_attach function
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    -- gi przy pyright w ogóle nie istnieje! Ale przy językach gdzie przeciążamy funkcje ma fajne
    -- zastosowanie, gdyż gd, pójdzie do structa gdzie zadeklarowaliśmy funkcję, ale może być
    -- przecież w 5 miejscach przeciążona. I gi tam dojdzie.
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    -- gt trochę najdziwniejsze, gd pójdzie gdzie tą zmienną zadeklarowaliśmy, 
    -- a gt, czym ta zmienna faktycznie jest. W pythonie imho przy braku super
    -- stubsow gd i gt pojdzie w to samo miejsce.
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "dj", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "dk", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
end


local diagnostic_config = {
    virtual_text = false, -- don't show red info
    float = {
	focusable = false,
	source = "always",
    }
}

-- Setting all lsp server with default setting
for _, server in ipairs(servers) do
    nvim_lsp[server].setup{
	on_attach = on_attach,
	vim.diagnostic.config(diagnostic_config)
    }
end

-- custom for lua
nvim_lsp.sumneko_lua.setup{
    settings = {
	Lua = {
	    diagnostics = {
		-- set vim as global variable so lsp diagnostics doesn't compain
		globals = { 'vim' }
	    }
	}
    }
}
