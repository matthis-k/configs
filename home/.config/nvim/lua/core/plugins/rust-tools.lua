local function config() end

return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "simrat39/rust-tools.nvim",

            -- Debugging
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        config = config,
    },
}
