Terminal = require("toggleterm.terminal").Terminal

local M = {}

M.lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "tab" })
function M.toggle_lazygit()
    M.lazygit:toggle()
end

M.btm = Terminal:new({ cmd = "btm", hidden = true, direction = "tab" })
function M.toggle_btm()
    M.btm:toggle()
end

return M
