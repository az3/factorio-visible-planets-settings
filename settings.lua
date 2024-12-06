require("constants")

local mod_list = {}

function fill_dropdowns(mod_name)
    log("filling dropdowns for mod " .. mod_name)
    for _, p in ipairs(mod_planets_map[mod_name]) do
        log("ASSUMING mod '" .. mod_name .. "' has planet '" .. p .. "'; adding to selection list.")
        if mod_list[p] == nil then
            mod_list[p] = {}
            table.insert(mod_list[p], mod_picker_map[mod_name])
        else
            table.insert(mod_list[p], mod_picker_map[mod_name])
        end
    end
end

fill_dropdowns(MOD_NAME_DEFAULT)

if mods[MOD_NAME_HealdollEmily] then
    fill_dropdowns(MOD_NAME_HealdollEmily)
end
if mods[MOD_NAME_OwnlyMe] then
    fill_dropdowns(MOD_NAME_OwnlyMe)
end
if mods[MOD_NAME_SovietSpartan] then
    fill_dropdowns(MOD_NAME_SovietSpartan)
end
if mods[MOD_NAME_0mega42] then
    fill_dropdowns(MOD_NAME_0mega42)
end
if mods[MOD_NAME_Valerian] then
    fill_dropdowns(MOD_NAME_Valerian)
end

data:extend({
    -- START
    {
        type = "string-setting",
        name = "vps-nauvis-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["nauvis"],
        order = "a1",
    },
    {
        type = "string-setting",
        name = "vps-fulgora-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["fulgora"],
        order = "a2",
    },
    {
        type = "string-setting",
        name = "vps-gleba-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["gleba"],
        order = "a3",
    },
    {
        type = "string-setting",
        name = "vps-vulcanus-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["vulcanus"],
        order = "a4",
    },
    {
        type = "string-setting",
        name = "vps-aquilo-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["aquilo"],
        order = "a5",
    },
    {
        type = "string-setting",
        name = "vps-shattered-planet-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list["shattered-planet"],
        order = "a6",
    },
    -- END
})