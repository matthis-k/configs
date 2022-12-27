local function config()
    require("neural").setup({
        open_ai = {
            api_key = "<YOUR_OPENAI_KEY>",
        },
    })
end

return {
    {
        "dense-analysis/neural",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "ElPiloto/significant.nvim",
        },
        config = config,
    },
}
