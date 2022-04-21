-- Zabezpieczamy się przed tym gdy nie ma pluginu dającego darkplusa

local colorscheme = "darkplus"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found :|")
    return
end
