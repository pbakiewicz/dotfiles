vim.g.mapleader = ','
vim.g.maplocalleader = ','

local options = {
    clipboard = "unnamedplus",
    splitbelow = true,
    splitright = true,
    number = true,
    relativenumber = true,
    scrolloff = 8,
    ignorecase = true, -- ignore case on search
    smartcase = true,  -- when type capital letter ignorecase is off
    tabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    -- naucz sie lepiej tego block visual
    virtualedit = "block",
    termguicolors = true,
    -- bardzo annoying jak czyta się i wrapuje w środku słowa
    linebreak = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end



vim.g['sneak#label'] = 1
vim.g['sneak#prompt'] = '🔎 '
vim.g['sneak#s_next'] = 1


-- vim test
-- btw, co to za konstrukcja w lua z tym hashem?
-- vim.g["test#python#runner"] = "djangotest"
-- vim.g["test#python#djangotest#options"] = "--keepdb"
-- vim.g["test#strategy"] = "neovim"
