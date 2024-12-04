require("constants")

local nauvis_picker = settings.startup["vps-nauvis-picker"].value
local fulgora_picker = settings.startup["vps-fulgora-picker"].value
local gleba_picker = settings.startup["vps-gleba-picker"].value
local vulcanus_picker = settings.startup["vps-vulcanus-picker"].value
local aquilo_picker = settings.startup["vps-aquilo-picker"].value
local shattered_planet_picker = settings.startup["vps-shattered-planet-picker"].value

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
    return nil
end

function update_prototype(prototype, planet_name)
    local picker = get_picker(planet_name)
    if picker == nil then
        log("for planet name '" .. planet_name .. ", picker is nil.")
        return
    else
        log("for planet name '" .. planet_name .. ", picker is selected as '" .. picker .. "'.")
    end
    local mod_name = picker_mod_map[picker];
    if mod_name == MOD_NAME_DEFAULT then
        -- NOOP
    end
    if mod_name == MOD_NAME_HealdollEmily then
        prototype.starmap_icon = "__" .. MOD_NAME_HealdollEmily .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
    end
    if mod_name == MOD_NAME_OwnlyMe then
        prototype.starmap_icon = "__" .. MOD_NAME_OwnlyMe .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 4072
    end
    if mod_name == MOD_NAME_SovietSpartan then
        prototype.starmap_icon = "__" .. MOD_NAME_SovietSpartan .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
    end
    if mod_name == MOD_NAME_Valerian then
        -- FIXME NOT YET RELEASED
        prototype.starmap_icon = "__" .. MOD_NAME_Valerian .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2160
    end
    if mod_name == MOD_NAME_polite_alpha then
        prototype.starmap_icon = "__" .. MOD_NAME_polite_alpha .. "__/graphics/" .. planet_name .. ".png"
        -- FIXME NOT YET RELEASED
        prototype.starmap_icon_size = 2048
    end
    log("prototype.starmap_icon is chosen as: " .. prototype.starmap_icon)
end

for _, name in pairs(planets) do
    local prototype = data.raw["space-location"][name] or data.raw["planet"][name]
    if prototype == nil then
        log("for planet name '" .. planet_name .. ", prototype is nil.")
    else
        update_prototype(prototype, name)
    end
end
