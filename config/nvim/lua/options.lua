vim.g.mapleader = ','
vim.g.maplocalleader = ','

local options = {
    clipboard = "unnamedplus",
    splitbelow = true,
    splitright = true,
    mouse ="a",
    number = true,
    relativenumber = true,
    showtabline=2,
    background = "dark",
    foldmethod = "marker",
    scrolloff = 8,
    backup = false,
    cmdheight = 2,
    ignorecase = true, -- ignore case on search
    smartcase = true, -- when type capital letter ignorecase is off
    swapfile = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g['sneak#label'] = 1

vim.cmd "set softtabstop=4 shiftwidth=4 noexpandtab"

-- options for git blame
vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_message_template = "<summary> * <date> * <author>"
