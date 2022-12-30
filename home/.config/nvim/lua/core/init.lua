local modules = {
    "core.settings",
    "core.lazy",
    "core.visuals",
}

for _, module in pairs(modules) do
    require(module)
end
