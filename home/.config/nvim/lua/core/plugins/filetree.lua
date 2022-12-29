local icons = require("core.icons").diagnostics
local function process_mappings(mappings)
    local list = {}
    for key, action in pairs(mappings) do
        table.insert(list, { key = key, action = action })
    end
    return {
        list = list,
        custom_only = true,
    }
end

icons.warn = nil
local function config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        view = {
            side = "right",
            mappings = process_mappings(require("core.keymaps")["nvim-tree"]),
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = icons,
        },
    })
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        },
        config = config,
    },
}
