require("telescope").setup{
    defaults = {
	prompt_prefix = "🦖: ",
    },
    extensions = {
	file_browser = {
	    theme = "ivy",
	    hijack_netrw = true,
	}
    }
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")


local cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
local glob_pattern = "*.py"

local mappings = {
    live_grep = function()
	require("telescope.builtin").live_grep({cwd=cwd, glob_pattern=glob_pattern})
    end,
    file_browser = function()
	require ("telescope").extensions.file_browser.file_browser({cwd=cwd})
    end,
}

return mappings
