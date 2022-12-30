local M = {}

function M.edit_plugins()
    local io = require("io")
    local plugins_path = vim.fn.stdpath("config") .. "/lua/core/plugins/"
    local plugins = {}
    for file in io.popen("ls -a " .. plugins_path):lines() do
        if file ~= "." and file ~= ".." then
            table.insert(plugins, file)
        end
    end
    vim.ui.select(plugins, { prompt = "Select a plugin to edit:" }, function(choice)
        if choice ~= nil then
            vim.cmd("edit " .. plugins_path .. choice)
        end
    end)
end

function M.new_plugin()
    vim.ui.input({ prompt = "Enter new plugin: " }, function(input)
        if not input then
            return
        end
        local plugins_path = vim.fn.stdpath("config") .. "/lua/core/plugins/"
        if string.sub(input, -4) ~= ".lua" then
            input = input .. ".lua"
        end
        local path = plugins_path .. input
        local file = io.open(path)
        if file then
            vim.notify("Plugin already exists", vim.log.levels.INFO)
            file:close()
        else
            vim.cmd("edit " .. path)
            local template = {
                "local function config()",
                "end",
                "",
                "return {",
                "    {",
                '        "",',
                "        dependencies = {},",
                "        config = config,",
                "    },",
                "}",
            }
            vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
        end
    end)
end

function M.edit()
    local path = vim.fn.stdpath("config")
    vim.cmd("cd " .. path)
    vim.cmd("edit " .. path .. "/lua/core/init.lua")
end

return M
