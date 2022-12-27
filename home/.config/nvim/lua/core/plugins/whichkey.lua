local function config()
    local keymaps = require("core.keymaps")
    local wk = require("which-key")
    wk.setup({
        plugins = {
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        key_labels = {
            ["<leader>"] = "lead",
        },
        operators = { gc = "Comments" },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        popup_mappings = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        window = {
            border = "rounded",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 2, 2, 2, 2 },
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 10 },
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "center",
        },
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = false,
        show_keys = false,
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
    })

    for _, mapset in ipairs(keymaps) do
        if mapset.opts == nil then
            wk.register(mapset.maps)
        else
            wk.register(mapset.maps, mapset.opts)
        end
    end
end

return {
    {
        "folke/which-key.nvim",
        dependencies = {},
        config = config,
    },
}
