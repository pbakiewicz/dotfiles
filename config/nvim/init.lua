require('plugins')
require('options')
require('keymaps')
require("colorscheme")
require("completion")


-- LSP config
require'lspconfig'.gopls.setup{
    on_attach = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
	-- type definition, when you are too lazy to press gd twice, first on var
	-- second on constructor
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
	-- implementation is it even useful for python? In go it goes to the 
	-- actual implementation of function not to its declaration as in interface
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    end,
}
