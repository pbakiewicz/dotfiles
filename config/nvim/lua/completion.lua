local cmp = require "cmp"

-- tutaj dodać te automatyczne formatowanie


-- Bez tego to taba zwykłego  nie użyję
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local feedkey = function(key, mode)
--  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end

cmp.setup {
    mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
--      elseif vim.fn["vsnip#available"](1) == 1 then
--        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
 --     elseif vim.fn["vsnip#jumpable"](-1) == 1 then
 --       feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
        -- bez tego wsadzanie emojisów nie działa.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "buffer", keyword_length = 5},
        { name = "emoji", insert = true },
        { name = "path" },
    },
}
