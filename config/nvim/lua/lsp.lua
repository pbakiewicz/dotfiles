local nvim_lsp = require('lspconfig')

-- define server as in :h lspconfig-server-configurations
local servers = { 'gopls', 'sumneko_lua' , 'pyright'}


-- defining shared on_attach function
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    -- type definition, when you are too lazy to press gd twice, first on var
    -- second on constructor
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    -- implementation is it even useful for python? In go it goes to the
    -- actual implementation of function not to its declaration as in interface
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
end


-- Setting all lsp server with default setting
for _, server in ipairs(servers) do
    nvim_lsp[server].setup{
	on_attach = on_attach
    }
end

-- custom for lua
nvim_lsp.sumneko_lua.setup{
    settings = {
	Lua = {
	    diagnostics = {
		globals = { 'vim' } -- to stop parser complain about vim variable
	    }
	}
    }
}
