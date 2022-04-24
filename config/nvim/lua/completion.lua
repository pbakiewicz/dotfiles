local cmp = require "cmp"

cmp.setup {
    sources = {
	{ name = "buffer", keyword_length=3 },
    },
}
