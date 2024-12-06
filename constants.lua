-- maybe rename it to first6 ?
planets = { "nauvis", "fulgora", "gleba", "vulcanus", "aquilo", "shattered-planet", }
local first5 = { "nauvis", "fulgora", "gleba", "vulcanus", "aquilo" }

MOD_NAME_DEFAULT = "default"
MOD_NAME_HealdollEmily = "sharper_planets"
MOD_NAME_OwnlyMe = "hd_planets"
MOD_NAME_SovietSpartan = "hd_planets_renders"
MOD_NAME_0mega42 = "YAPR"
MOD_NAME_Valerian = "valerian-planets"

mod_picker_map = {
    [MOD_NAME_DEFAULT] = "Default",
    [MOD_NAME_HealdollEmily] = "HealdollEmily's \"Sharper Planets\"",
    [MOD_NAME_OwnlyMe] = "OwnlyMe's \"HD planets\"",
    [MOD_NAME_SovietSpartan] = "SovietSpartan's \"HD Planets Renders\"",
    [MOD_NAME_0mega42] = "0mega42's \"YAPR - yet another planet rendering\"",
    [MOD_NAME_Valerian] = "Valerian's Planets",
}

function reverse(kv_table)
    local vk_table = {}
    for key, value in pairs(kv_table) do
        vk_table[value] = key
    end
    return vk_table
end

picker_mod_map = reverse(mod_picker_map)

mod_planets_map = {
    [MOD_NAME_DEFAULT] = planets,
    [MOD_NAME_HealdollEmily] = first5,
    [MOD_NAME_OwnlyMe] = planets,
    [MOD_NAME_SovietSpartan] = planets,
    [MOD_NAME_0mega42] = first5,
    [MOD_NAME_Valerian] = first5,
}

