require("constants")

local nauvis_picker = settings.startup["vps-nauvis-picker"].value
local vulcanus_picker = settings.startup["vps-vulcanus-picker"].value
local gleba_picker = settings.startup["vps-gleba-picker"].value
local fulgora_picker = settings.startup["vps-fulgora-picker"].value
local aquilo_picker = settings.startup["vps-aquilo-picker"].value
local shattered_planet_picker = settings.startup["vps-shattered-planet-picker"].value

-- local yapr_nauvis_res = settings.startup["yapr-nauvis-res"]

function get_mod_name(planet_name)
    if planet_name == "nauvis" and nauvis_picker ~= nil then
        return picker_mod_map[nauvis_picker]
    end
    if planet_name == "vulcanus" and vulcanus_picker ~= nil then
        return picker_mod_map[vulcanus_picker]
    end
    if planet_name == "gleba" and gleba_picker ~= nil then
        return picker_mod_map[gleba_picker]
    end
    if planet_name == "fulgora" and fulgora_picker ~= nil then
        return picker_mod_map[fulgora_picker]
    end
    if planet_name == "aquilo" and aquilo_picker ~= nil then
        return picker_mod_map[aquilo_picker]
    end
    if planet_name == "shattered-planet" and shattered_planet_picker ~= nil then
        return picker_mod_map[shattered_planet_picker]
    end
    if mods["maraxsis"] then
        local maraxsis_picker = settings.startup["vps-maraxsis-picker"].value
        if planet_name == "maraxsis" and maraxsis_picker ~= nil then
            return picker_mod_map[maraxsis_picker]
        end
    end
    if mods["tenebris"] then
        local tenebris_picker = settings.startup["vps-tenebris-picker"].value
        if planet_name == "tenebris" and tenebris_picker ~= nil then
            return picker_mod_map[tenebris_picker]
        end
    end
    return nil
end

function update_prototype(prototype, planet_name)
    local mod_name = get_mod_name(planet_name);
    if mod_name == nil then
        return
    end
    if mod_name == MOD_NAME_DEFAULT then
        prototype.starmap_icon_size = 512
        if planet_name == "nauvis" then
            prototype.starmap_icon = "__base__/graphics/icons/starmap-planet-nauvis.png"
        elseif planet_name == "shattered-planet" then
            prototype.starmap_icon = "__space-age__/graphics/icons/starmap-shattered-planet.png"
        elseif planet_name == "maraxsis" then -- FIXME check necessity.
            if mods["maraxsis"] then
                prototype.starmap_icon = "__maraxsis__/graphics/planets/maraxsis-starmap-icon.png"
            end
        elseif planet_name == "tenebris" then
            if mods["tenebris"] then
                prototype.starmap_icon = "__tenebris__/graphics/icons/starmap-planet-tenebris.png"
            end
        else
            prototype.starmap_icon = "__space-age__/graphics/icons/starmap-planet-" .. planet_name .. ".png"
        end
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
    if mod_name == MOD_NAME_0mega42 then
        prototype.starmap_icon = "__" .. MOD_NAME_0mega42 .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
        --[[
        if planet_name == "nauvis" then
            prototype.starmap_icon = "__" .. MOD_NAME_0mega42 .. "__/graphics/" .. planet_name .. "-" .. yapr_nauvis_res .. ".png"
            if yapr_nauvis_res == "144p" then
                prototype.starmap_icon_size = 144
            end
            if yapr_nauvis_res == "2K" then
                prototype.starmap_icon_size = 2048
            end
        else
            prototype.starmap_icon = "__" .. MOD_NAME_0mega42 .. "__/graphics/" .. planet_name .. ".png"
            prototype.starmap_icon_size = 2048
        end
        ]]--
    end
    if mod_name == MOD_NAME_Valerian then
        prototype.starmap_icon = "__" .. MOD_NAME_Valerian .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 2048
    end
    if mod_name == MOD_NAME_grog2 then
        prototype.starmap_icon = "__" .. MOD_NAME_grog2 .. "__/graphics/" .. planet_name .. ".png"
        prototype.starmap_icon_size = 3840
    end
    if mod_name == MOD_NAME_maraxsis then
        prototype.starmap_icon = "__" .. MOD_NAME_maraxsis .. "__/graphics/planets/maraxsis-starmap-icon.png"
        prototype.starmap_icon_size = 512
    end
    if mod_name == MOD_NAME_tenebris then
        prototype.starmap_icon = "__" .. MOD_NAME_tenebris .. "__/graphics/icons/starmap-planet-tenebris.png"
        prototype.starmap_icon_size = 512
    end
    log("prototype.starmap_icon is chosen as: '" .. prototype.starmap_icon .. "' [" .. prototype.starmap_icon_size .. "p]")
end

function fetch_prototype(planet_name)
    local prototype = data.raw["space-location"][planet_name] or data.raw["planet"][planet_name]
    if prototype == nil then
        log("for planet name '" .. planet_name .. "', prototype is nil.")
    else
        update_prototype(prototype, planet_name)
    end
end

for _, planet_name in pairs(first6) do
    fetch_prototype(planet_name)
end

if mods["maraxsis"] then
    fetch_prototype("maraxsis")
end

if mods["tenebris"] then
    fetch_prototype("tenebris")
end
