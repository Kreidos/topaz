-----------------------------------
-- Attachment: Arcanic Cell
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    pet:addMod(tpz.mod.OCCULT_ACUMEN, 10)
end

attachment_object.onUnequip = function(pet)
    pet:delMod(tpz.mod.OCCULT_ACUMEN, 10)
end

attachment_object.onManeuverGain = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.OCCULT_ACUMEN, 10)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.OCCULT_ACUMEN, 15)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.OCCULT_ACUMEN, 15)
    end
end

attachment_object.onManeuverLose = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.OCCULT_ACUMEN, 10)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.OCCULT_ACUMEN, 15)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.OCCULT_ACUMEN, 15)
    end
end

return attachment_object
