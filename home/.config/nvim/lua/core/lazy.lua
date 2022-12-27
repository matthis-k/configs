local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local lazy = require("lazy")
local opts = {
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- lockfile generated after running update.
    install = {
        missing = true,
        colorscheme = { "catppuccin-mocha" },
    },
    ui = {
        border = "rounded",
    },
    checker = {
        enabled = true,
        notify = true,
        frequency = 3600 * 3,
    },
    change_detection = {
        notify = false,
    },
}
lazy.setup("core.plugins", opts)
