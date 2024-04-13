require("telescope").setup({
    defaults = {
        prompt_prefix = " 🦖 > ",
    },

})

-- in git repo always use live grep as a top path
-- if not, use live grep in folder you are currently in.
local git_top_level = vim.fn.systemlist("git rev-parse --show-toplevel")
if vim.v.shell_error == 0 then
    cwd = git_top_level[1]
end

-- to do set ff outsideof git repo to use file find

local glob_pattern = "*.{py,go,lua}"


local mappings = {
    live_grep = function()
	require("telescope.builtin").live_grep({cwd=cwd, glob_pattern=glob_pattern})
    end,
}

return mappings
