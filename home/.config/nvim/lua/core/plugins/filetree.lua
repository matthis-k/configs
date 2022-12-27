local icons = require("core.icons").diagnostics
icons.warn = nil
local function config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({

        sync_root_with_cwd = true,
        view = {
            side = "right",
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
