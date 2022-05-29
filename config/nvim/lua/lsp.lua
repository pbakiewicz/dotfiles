local nvim_lsp = require('lspconfig')

-- define server as in :h lspconfig-server-configurations
local servers = { 'gopls', 'sumneko_lua' , 'pyright'}


-- defining shared on_attach function
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    -- Nie wiem jeszcze czy dla pythona jest przydatna specjalnie, ale w golangu
    -- gd pojdzie do deklaracji funkcji w structcie, a gi do jej pojedynczej
    -- implementacji. Pamietaj ze implemetnacji moze byc wiecej niz jedna, wiec
    -- warto to sobie w telescopie obudowac.
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    -- Dziala szzegolnie przy moich zmiennych, gdzie gd, pokaza moment zadeklarowania zmiennej
    -- a gt, czym ta zmienna konkretnie jest, czyli np deklaracja klasy
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    -- mozna pokusic sie o dodanie do telescope'a
    vim.keymap.set("n", "dj", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "dj", vim.diagnostic.goto_prev, {buffer = 0})

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
	capabilites = capabilities,
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
