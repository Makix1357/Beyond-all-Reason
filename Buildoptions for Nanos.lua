Buildoptions for Nanos

--Building Nanos
local UnitDefs = UnitDefs or {}
local Factions = {"arm", "cor", "leg"}
for _, faction in ipairs(Factions) do
    local units = faction.."nanotct2"
     if UnitDefs[units] then
        UnitDefs[units].buildoptions = UnitDefs[faction.."ack"].buildoptions
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
            local baseBuildOptions = UnitDefs[faction.."ck"].buildoptions
            UnitDefs[unit].buildoptions = {}
            for i, option in ipairs(baseBuildOptions) do
                UnitDefs[unit].buildoptions[i] = option
            end
            table.insert(UnitDefs[unit].buildoptions, faction.."aap")
            table.insert(UnitDefs[unit].buildoptions, faction.."avp")
        end
    end
end
