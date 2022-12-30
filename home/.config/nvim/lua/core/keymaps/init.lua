local keymaps = {
    whichkey = {
        { maps = require("core.keymaps.leader_maps") },
        { maps = require("core.keymaps.normal_maps") },
        { maps = require("core.keymaps.visual_maps"), opts = { mode = "v" } },
        { maps = require("core.keymaps.insert_maps"), opts = { mode = "i" } },
        { maps = require("core.keymaps.terminal_maps"), opts = { mode = "t" } },
    },
    ["nvim-tree"] = require("core.keymaps.file_tree_maps"),
}

return keymaps
