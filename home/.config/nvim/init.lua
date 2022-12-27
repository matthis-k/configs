local modules = {
    "core.editor",
    "core.lazy",
    "core.colorscheme",
}

for _, module in pairs(modules) do
    require(module)
end
