local function config()
    require("leap").add_default_mappings()
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
    require("leap").init_highlight(true)
end

return {
    {
        "ggandor/leap.nvim",
        dependencies = {},
        config = config,
    },
}
