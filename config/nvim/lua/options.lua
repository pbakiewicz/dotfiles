vim.g.mapleader = ','
vim.g.maplocalleader = ','

local options = {
    clipboard = "unnamedplus",
    splitbelow = true,
    splitright = true,
    number = true,
    relativenumber = true,
    foldmethod = "indent",
    foldlevel = 8,
    scrolloff = 8,
    ignorecase = true, -- ignore case on search
    smartcase = true, -- when type capital letter ignorecase is off
    tabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    -- naucz sie lepiej tego block visual
    virtualedit = "block",
    wrap = false,
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.g['sneak#label'] = 1

-- options for git blame
-- vim.g.gitblame_enabled = 0
-- vim.g.gitblame_date_format = "%r"
-- vim.g.gitblame_message_template = "<summary> * <date> * <author>"

-- vim test
-- btw, co to za konstrukcja w lua z tym hashem?
-- vim.g["test#python#runner"] = "djangotest"
-- vim.g["test#python#djangotest#options"] = "--keepdb"
-- vim.g["test#strategy"] = "neovim"
