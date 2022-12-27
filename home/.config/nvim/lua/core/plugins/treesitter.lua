local function config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "all" },
        ignore_install = { "javascript" },
    })
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {},
        config = config,
    },
}
