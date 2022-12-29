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
        g = {
            name = "Git",
            g = { utils.toggle_lazygit, "Toggle lazygit" },
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
            n = { "<cmd>ToggleTerm direction=tab<cr>", "Open Tab" },
            g = { utils.toggle_lazygit, "Toggle lazygit" },
            b = { utils.toggle_btm, "Toggle btm" },
        },
        p = { '"_dP', "Paste (no yank)" },
        q = { "<cmd>quit<cr>", "quit" },
        w = { "<cmd>write<cr>", "save" },
        ["?"] = { "<cmd>Whichkey<cr>", "help" },
    },
}

local visual_maps = {
    ["<leader>"] = {
        p = { '"_dP', "Paste (no yank)" },
    },
    J = { ":m '>+1<cr>gv=gv", "Move line down" },
    K = { ":m '<-2<cr>gv=gv", "Move line up" },
    ["<"] = { "<gv", "Unindent selection" },
    [">"] = { ">gv", "Unindent selection" },
}

local normal_maps = {
    ["<c-d>"] = { "<c-d>zz", "Page down" },
    ["<c-u>"] = { "<c-u>zz", "Page up" },
    n = { "nzz", "Next match" },
    N = { "Nzz", "Previous match" },
    ["<c-t>"] = { "<cmd>ToggleTerm direction=float<cr>", "Terminal" },
    ["<c-h>"] = { [[<Cmd>wincmd h<CR>]], "Focus win left" },
    ["<c-j>"] = { [[<Cmd>wincmd j<CR>]], "Focus win down" },
    ["<c-k>"] = { [[<Cmd>wincmd k<CR>]], "Focus win up" },
    ["<c-l>"] = { [[<Cmd>wincmd l<CR>]], "Focus win right" },
}

local insert_maps = {
    ["<c-v>"] = { '<esc>"_dP<cr>', "Paste (no yank)" },
    ["<c-BS>"] = { '<esc>l"_cb', "Delete word before" },
    ["<c-Del>"] = { '<esc>l"_cw', "Delete word after" },
}

local file_tree_mappings = {
    ["."] = "cd",
    ["<2-LeftMouse>"] = "edit",
    ["<bs>"] = "close_node",
    ["<cr>"] = "edit",
    ["F"] = "clear_live_filter",
    ["H"] = "toggle_dotfiles",
    ["K"] = "toggle_file_info",
    ["R"] = "full_rename",
    ["Z"] = "expand_all",
    ["a"] = "create",
    ["d"] = "remove",
    ["f"] = "live_filter",
    ["h"] = "close_node",
    ["l"] = "edit",
    ["p"] = "paste",
    ["q"] = "close",
    ["r"] = "rename",
    ["x"] = "cut",
    ["y"] = "copy",
    ["z"] = "collapse_all",
}

local terminal_maps = {
    ["<a-esc>"] = { [[<c-\><c-n>]], "Exit terminal mode" },
    ["<c-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
    ["<c-h>"] = { [[<Cmd>wincmd h<CR>]], "Focus win left" },
    ["<c-j>"] = { [[<Cmd>wincmd j<CR>]], "Focus win down" },
    ["<c-k>"] = { [[<Cmd>wincmd k<CR>]], "Focus win up" },
    ["<c-l>"] = { [[<Cmd>wincmd l<CR>]], "Focus win right" },
}

local keymaps = {
    whichkey = {
        { maps = leader_maps },
        { maps = normal_maps },
        { maps = visual_maps, opts = { mode = "v" } },
        { maps = insert_maps, opts = { mode = "i" } },
        { maps = terminal_maps, opts = { mode = "t" } },
    },
    ["nvim-tree"] = file_tree_mappings,
}

return keymaps
