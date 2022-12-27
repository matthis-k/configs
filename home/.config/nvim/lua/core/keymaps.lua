local telescope_builtin = require("telescope.builtin")
local lazy = require("lazy")
local utils = require("core.utils")

local leader_maps = {
    ["<leader>"] = {

        ["<leader>"] = {
            name = "Plugins",
            h = { lazy.home, "Home" },
            s = { lazy.sync, "Sync" },
            e = { utils.edit_plugins, "Edit plugins" },
            n = { utils.new_plugin, "New plugin" },
            c = { utils.edit_config, "Goto config" },
        },
        e = { "<cmd>NvimTreeToggle<cr>", "Files" },
        f = {
            name = "Find",
            f = { telescope_builtin.find_files, "File" },
            w = { telescope_builtin.live_grep, "Word" },
        },
        h = { "<cmd>nohlsearch<cr>", "Reset highlights" },
        l = {
            name = "LSP",
            a = { vim.lsp.buf.code_action, "Code actions" },
            f = { vim.lsp.buf.format, "Format file" },
            r = { vim.lsp.buf.rename, "Rename" },
        },
        t = {
            name = "Terminal",
            t = { "<cmd>ToggleTerm direction=float<cr>", "Open floating" },
            h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Open horizontal" },
            n = { "<cmd>ToggleTerm direction=tab<cr>", "Open horizontal" },
        },
        p = { '"_dP', "Paste (no yank)" },
        q = { "<cmd>quit<cr>", "quit" },
        w = { "<cmd>write<cr>", "save" },
        ["?"] = { "<cmd>Whichkey<cr>", "help" },
    },
}

local visual_maps = {
    J = { ":m '>+1<cr>gv=gv", "Move line down" },
    K = { ":m '<-2<cr>gv=gv", "Move line up" },
}

local normal_maps = {
    ["<C-d>"] = { "<C-d>zz", "Page down" },
    ["<C-u>"] = { "<C-u>zz", "Page up" },
    n = { "nzz", "Next match" },
    N = { "Nzz", "Previous match" },
    ["<C-t>"] = { "<cmd>ToggleTerm direction=float<cr>", "Terminal" },
}

local insert_maps = {
    ["<C-v>"] = { '<esc>"_dP<cr>', "Paste (no yank)" },
    ["<C-BS>"] = { '<esc>l"_cb', "Delete word before" },
    ["<C-Del>"] = { '<esc>l"_cw', "Delete word after" },
}

local keymaps = {
    { maps = leader_maps },
    { maps = normal_maps },
    { maps = visual_maps, opts = { mode = "v" } },
    { maps = insert_maps, opts = { mode = "i" } },
}

return keymaps
