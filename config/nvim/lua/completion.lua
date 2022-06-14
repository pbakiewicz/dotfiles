local cmp = require "cmp"

-- More info :h ins-completion

cmp.setup {
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({
	  behavior = cmp.ConfirmBehavior.Insert, -- find what it does
	  select = true,
      })
    },
    sources = {
	-- order in priority
	{ name = "nvim_lsp"},
	{ name = "nvim_lua"},
	{ name = "path"},
	{ name = "buffer", keyword_length=5 },
    },
    snippet = {
	expand = function(args)
	    require("luasnip").lsp_expand(args.body)
	end,
    },
    formatting = {
	format = require("lspkind").cmp_format {
	    with_text = true,
	    menu = {
		buffer = "[buf]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[api]",
		path = "[path]",
		luasnip = "[snip]",
	    }
	}
    },
    experimental = {
	ghost_text = true,
	native_menu = false,
    }
}
