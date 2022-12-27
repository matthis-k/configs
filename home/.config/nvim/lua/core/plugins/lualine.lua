local function config()
    local empty = require("lualine.component"):extend()
    function empty:draw(default_highlight)
        self.status = ""
        self.applied_separator = ""
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
    end

    local function lsp_name()
        local bufnr = vim.api.nvim_get_current_buf()
        local lsp_clients = vim.tbl_filter(function(client)
            return client.name ~= "null-ls"
        end, vim.lsp.buf_get_clients(bufnr))
        if lsp_clients ~= nil then
            return lsp_clients[1].name
        else
            return nil
        end
    end

    local function process_sections(sections)
        for name, section in pairs(sections) do
            local left = name:sub(9, 10) < "x"
            for id, comp in ipairs(section) do
                if type(comp) ~= "table" then
                    comp = { comp }
                    section[id] = comp
                end
                comp.separator = left and { right = "" } or { left = "" }
            end
        end
        return sections
    end

    local function search_result()
        if vim.v.hlsearch == 0 then
            return ""
        end
        local last_search = vim.fn.getreg("/")
        if not last_search or last_search == "" then
            return ""
        end
        local searchcount = vim.fn.searchcount({ maxcount = 9999 })
        return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
    end

    require("lualine").setup({
        options = {
            component_separators = "",
            section_separators = { left = "", right = "" },
        },
        sections = process_sections({
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                "diff",
                { "filename", file_status = false, path = 0 },
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    sections = { "error", "warn", "info", "hint" },
                    symbols = require("core.icons").diagnostics,
                    colored = true,
                    update_in_insert = true,
                    always_visible = false,
                },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                search_result,
                lsp_name,
            },
            lualine_z = {
                "filetype",
            },
        }),
        inactive_sections = {
            lualine_c = {},
        },
        extensions = {
            "nvim-tree",
            "toggleterm",
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "",
                },
                opts = { skip = true },
            },
        },
    })
end

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        },
        config = config,
    },
}
