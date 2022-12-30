local telescope_builtin = require("telescope.builtin")
local lazy = require("lazy")
local utils = require("core.utils")

return {
    ["<leader>"] = {
        ["<leader>"] = {
            name = " Plugins",
            h = { lazy.home, " Home" },
            s = { lazy.sync, " Sync" },
            e = { utils.config.edit_plugins, " Edit plugins" },
            n = { utils.config.new_plugin, " New plugin" },
            c = { utils.config.edit, " Goto config" },
        },
        a = { "<cmd>Alpha<cr>", " Start screen" },
        e = { "<cmd>NvimTreeToggle<cr>", " Files" },
        f = {

            name = " Find",
            f = { telescope_builtin.find_files, " File" },
            w = { telescope_builtin.live_grep, " Word" },
        },
        g = {
            name = " Git",
            g = { utils.apps.toggle_lazygit, " Toggle lazygit" },
        },
        h = { "<cmd>nohlsearch<cr>", "Reset highlights" },
        l = {

            name = " LSP",
            a = { vim.lsp.buf.code_action, " Code actions" },
            f = { vim.lsp.buf.format, "ﱓ Format file" },
            r = { vim.lsp.buf.rename, " Rename" },
        },
        t = {
            name = " Terminal",
            t = { "<cmd>ToggleTerm direction=float<cr>", " Open floating" },
            h = { "<cmd>ToggleTerm direction=horizontal<cr>", " Open horizontal" },
            n = { "<cmd>ToggleTerm direction=tab<cr>", " Open Tab" },
            g = { utils.apps.toggle_lazygit, " Toggle lazygit" },
            b = { utils.apps.toggle_btm, "龍Toggle btm" },
        },
        p = { '"_dP', " Paste (no yank)" },
        q = { "<cmd>quit<cr>", " Quit" },
        w = { "<cmd>write<cr>", " Save" },
        ["?"] = { "<cmd>Whichkey<cr>", " Help" },
    },
}
