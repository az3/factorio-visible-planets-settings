require("constants")

local nauvis_picker = picker_mod_map[settings.startup["vps-nauvis-picker"].value]
local fulgora_picker = picker_mod_map[settings.startup["vps-fulgora-picker"].value]
local gleba_picker = picker_mod_map[settings.startup["vps-gleba-picker"].value]
local vulcanus_picker = picker_mod_map[settings.startup["vps-vulcanus-picker"].value]
local aquilo_picker = picker_mod_map[settings.startup["vps-aquilo-picker"].value]
local shattered_planet_picker = picker_mod_map[settings.startup["vps-shattered-planet-picker"].value]

function get_picker(planet_name)
    if planet_name == "nauvis" then
        return nauvis_picker
    end
    if planet_name == "fulgora" then
        return fulgora_picker
    end
    if planet_name == "gleba" then
        return gleba_picker
    end
    if planet_name == "vulcanus" then
        return vulcanus_picker
    end
    if planet_name == "aquilo" then
        return aquilo_picker
    end
    if planet_name == "shattered-planet" then
        return shattered_planet_picker
    end
end

function update_prototype(prototype, planet_name)
    picker = get_picker(planet_name)

    if picker == MOD_NAME_DEFAULT then
        -- NOOP
    end
    if picker == MOD_NAME_HealdollEmily then
        prototype.starmap_icon = "__" .. MOD_NAME_HealdollEmily .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
    end
    if picker == MOD_NAME_OwnlyMe then
        prototype.starmap_icon = "__" .. MOD_NAME_OwnlyMe .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 4072
    end
    if picker == MOD_NAME_SovietSpartan then
        prototype.starmap_icon = "__" .. MOD_NAME_SovietSpartan .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
    end
    if picker == MOD_NAME_Valerian then
        -- FIXME NOT YET RELEASED
        prototype.starmap_icon = "__" .. MOD_NAME_Valerian .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2160
    end
    if picker == MOD_NAME_polite_alpha then
        prototype.starmap_icon = "__" .. MOD_NAME_polite_alpha .. "__/graphics/" .. planet_name .. ".png"
        -- FIXME NOT YET RELEASED
        prototype.starmap_icon_size = 2160
    end
end

for _, name in pairs(planets) do
    local prototype = data.raw["space-location"][name] or data.raw["planet"][name]
    update_prototype(prototype, name)
end
