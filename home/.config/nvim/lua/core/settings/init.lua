local function apply_options(opts)
    for opt, value in pairs(opts) do
        vim.opt[opt] = value
    end
end

local function apply_editor_settings()
    local es = require("core.settings.editor")
    apply_options(es.options)

    if es.hl_on_yank then
        vim.api.nvim_create_augroup("YankHighlight", { clear = true })
        vim.api.nvim_create_autocmd("TextYankPost", {
            group = "YankHighlight",
            callback = function()
                vim.highlight.on_yank({ higroup = "Visual", timeout = "400" })
            end,
        })
    end

    if es.format_on_save then
        vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "",
            group = "FormatOnSave",
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
end

apply_editor_settings()
