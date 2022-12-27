local function config()
    local notify = require("notify")
    -- notify.setup({level = vim.log.levels.ERROR })
    vim.notify = notify
end

return {
    {
        "rcarriga/nvim-notify",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = config,
    },
}
