local function config()
    require("toggleterm").setup({
        autochdir = true,
        float_opts = { border = "curved" },
    })
end

return {
    {
        "akinsho/toggleterm.nvim",
        dependencies = {},
        config = config,
    },
}
