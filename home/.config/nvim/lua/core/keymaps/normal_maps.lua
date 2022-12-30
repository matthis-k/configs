return {
    ["<c-d>"] = { "<c-d>zz", "Page down" },
    ["<c-u>"] = { "<c-u>zz", "Page up" },
    n = { "nzz", "Next match" },
    N = { "Nzz", "Previous match" },
    ["<c-t>"] = { "<cmd>ToggleTerm direction=float<cr>", "Terminal" },
    ["<c-h>"] = { [[<cmd>wincmd h<cr>]], "Focus left" },
    ["<c-j>"] = { [[<cmd>wincmd j<cr>]], "Focus down" },
    ["<c-k>"] = { [[<cmd>wincmd k<cr>]], "Focus up" },
    ["<c-l>"] = { [[<cmd>wincmd l<cr>]], "Focus right" },
    ["<c-w>"] = { [[<cmd>wincmd w<cr>]], "Close" },
}
