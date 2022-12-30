return {
    ["<leader>"] = {
        p = { '"_dP', "Paste (no yank)" },
    },
    J = { ":m '>+1<cr>gv=gv", "Move line down" },
    K = { ":m '<-2<cr>gv=gv", "Move line up" },
    ["<"] = { "<gv", "Unindent selection" },
    [">"] = { ">gv", "Unindent selection" },
}
