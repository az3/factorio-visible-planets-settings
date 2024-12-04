require("constants")

local mod_list = { mod_picker_map[MOD_NAME_DEFAULT] }

if mods[MOD_NAME_HealdollEmily] then
    table.insert(mod_list, mod_picker_map[MOD_NAME_HealdollEmily])
end

if mods[MOD_NAME_OwnlyMe] then
    table.insert(mod_list, mod_picker_map[MOD_NAME_OwnlyMe])
end

if mods[MOD_NAME_SovietSpartan] then
    table.insert(mod_list, mod_picker_map[MOD_NAME_SovietSpartan])
end

if mods[MOD_NAME_Valerian] then
    table.insert(mod_list, mod_picker_map[MOD_NAME_Valerian])
end

-- FIXME Replace it with MOD_NAME_polite_alpha
if mods[MOD_NAME_Valerian] then
    table.insert(mod_list, mod_picker_map[MOD_NAME_polite_alpha])
end

data:extend({
    -- START
    {
        type = "string-setting",
        name = "vps-nauvis-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a1",
    },
    {
        type = "string-setting",
        name = "vps-fulgora-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a2",
    },
    {
        type = "string-setting",
        name = "vps-gleba-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a3",
    },
    {
        type = "string-setting",
        name = "vps-vulcanus-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a4",
    },
    {
        type = "string-setting",
        name = "vps-aquilo-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a5",
    },
    {
        type = "string-setting",
        name = "vps-shattered-planet-picker",
        setting_type = "startup",
        default_value = mod_picker_map[MOD_NAME_DEFAULT],
        allowed_values = mod_list,
        order = "a6",
    },
    -- END
})