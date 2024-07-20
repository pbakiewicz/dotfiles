local cmp = require "cmp"

cmp.setup {
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- bez tego wsadzanie emojisów nie działa.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "buffer", keyword_length = 5},
        { name = "emoji", insert = true }
    },
}
