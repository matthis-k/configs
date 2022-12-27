local function config_mason()
    require("mason.settings").set({
        ui = {
            border = "rounded",
        },
    })
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.completion.spell,
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.diagnostics.write_good,
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
    lsp.setup()
    lsp.setup_nvim_cmp({
        sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "buffer" },
        },
    })

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
            "rafamadriz/friendly-snippets",
        },
        config = config,
    },
}
