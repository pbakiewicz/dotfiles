local cmp = require "cmp"

-- More info :h ins-completion

cmp.setup {
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true })
    },
    sources = {
	{ name = "nvim_lsp"},
	{ name = "nvim_lua"},
	{ name = "path"},
	{ name = "buffer", keyword_length=5 },
    },
    experimental = {
	ghost_text = true,
	native_menu = false,
    }
}