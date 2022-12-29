local function config()
    local parsers = require("nvim-treesitter.parsers").available_parsers()
    for i, parser in ipairs(parsers) do
        if not parser.maintainer then
            table.remove(parsers, i)
        end
    end

    require("nvim-treesitter.configs").setup({
        ensure_installed = parsers,
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
