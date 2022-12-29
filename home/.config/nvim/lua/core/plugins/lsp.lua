local function config_mason()
    require("mason.settings").set({
        ui = {
            border = "rounded",
        },
    })
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.mdformat,
        },
    })
end

local function config_mason_null_ls()
    local mason_nullls = require("mason-null-ls")
    mason_nullls.setup({
        automatic_installation = true,
        automatic_setup = true,
    })
    mason_nullls.setup_handlers({})
end

local function config()
    config_mason()

    local lsp = require("lsp-zero")
    lsp.preset("recommended")
    lsp.ensure_installed({ "sumneko_lua", "rust_analyzer" })
    lsp.set_preferences({
        sign_icons = require("core.icons").diagnostics,
    })
    lsp.nvim_workspace()
    lsp.setup_nvim_cmp({
        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "luasnip" },
        },
        completion = {
            completeopt = "menu,menuone,noinsert,noselect",
        },
        preselect = "none",
        formatting = {
            fields = { "menu", "abbr", "kind" },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = "λ",
                    luasnip = "⋗",
                    buffer = "Ω",
                    path = "🖫",
                    nvim_lua = "Π",
                }

                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
    })
    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = false,
        float = true,
    })

    config_mason_null_ls()
end

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-null-ls.nvim",
            "jose-elias-alvarez/null-ls.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
        },
        config = config,
    },
}
