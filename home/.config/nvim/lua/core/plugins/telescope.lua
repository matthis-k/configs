local function config()
    local telescope = require("telescope")
    local themes = require("telescope.themes")
    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            ["ui-select"] = {
                themes.get_dropdown({}),
            },
        },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = config,
    },
}
