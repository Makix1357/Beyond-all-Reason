--Building Nanos
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else 
        copy = orig
    end
    return copy
end
local UnitDefs = UnitDefs or {}
local Factions = {"arm", "cor", "leg"}
for _, faction in ipairs(Factions) do
    local units = faction.."nanotct2"
     if UnitDefs[units] then
        UnitDefs[units].buildoptions = deepcopy(UnitDefs[faction.."ack"].buildoptions)
        table.insert(UnitDefs[units].buildoptions, faction.."aap")
        table.insert(UnitDefs[units].buildoptions, faction.."avp")
        table.insert(UnitDefs[units].buildoptions, faction.."wint2")
        table.insert(UnitDefs[units].buildoptions, faction.."afust3")
        if faction == "arm" or faction == "cor" then
            table.insert(UnitDefs[units].buildoptions, faction.."mmkrt3")
        else 
            table.insert(UnitDefs[units].buildoptions, faction.."adveconvt3")
        end
    end
end
for _, faction in ipairs(Factions) do
    local units = {faction.."nanotc", faction.."respawn"}
    for _, unit in ipairs(units) do
        if UnitDefs[unit] then
            local baseBuildOptions = deepcopy(UnitDefs[faction.."ck"].buildoptions)
            UnitDefs[unit].buildoptions = {}
            for i, option in ipairs(baseBuildOptions) do
                UnitDefs[unit].buildoptions[i] = option
            end
            table.insert(UnitDefs[unit].buildoptions, faction.."ap")
            table.insert(UnitDefs[unit].buildoptions, faction.."vp")
        end
    end
end
