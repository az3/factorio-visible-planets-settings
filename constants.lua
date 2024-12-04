planets = {
    "nauvis",
    "fulgora",
    "gleba",
    "vulcanus",
    "aquilo",
    "shattered-planet",
}

MOD_NAME_DEFAULT = "default"
MOD_NAME_HealdollEmily = "sharper_planets"
MOD_NAME_OwnlyMe = "hd_planets"
MOD_NAME_SovietSpartan = "hd_planets_renders"
MOD_NAME_Valerian = "valerian-planets"
MOD_NAME_polite_alpha = "polite-alpha-planets"

mod_picker_map = {
    [MOD_NAME_DEFAULT] = "Default",
    [MOD_NAME_HealdollEmily] = "HealdollEmily's \"Sharper Planets\"",
    [MOD_NAME_OwnlyMe] = "OwnlyMe's \"HD planets\"",
    [MOD_NAME_SovietSpartan] = "SovietSpartan's \"HD Planets Renders\"",
    [MOD_NAME_Valerian] = "Valerian's \"valerian-planets\"",
    [MOD_NAME_polite_alpha] = "polite_alpha's \"polite-alpha-planets\"",
}

picker_mod_map = {}

for mod_name, picker in pairs(mod_picker_map) do
    table.insert(picker_mod_map, { picker = mod_name })
end
