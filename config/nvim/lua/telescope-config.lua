require("telescope").setup({
    defaults = {
        prompt_prefix = " 🦖 > ",
    },

})

local glob_pattern = "*.py"

local mappings = {
    live_grep = function()
	require("telescope.builtin").live_grep({cwd=cwd, glob_pattern=glob_pattern})
    end,
}

return mappings
