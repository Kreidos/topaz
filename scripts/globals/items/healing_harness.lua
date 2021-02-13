-----------------------------------
-- ID: 14495
-- Item: Healing Harness
-- Item Effect: Restores 50-75 HP
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:getHP() == target:getMaxHP()) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

item_object.onItemUse = function(target)
    local hpHeal = math.random(50, 75)
    local dif = target:getMaxHP() - target:getHP()
    if (hpHeal > dif) then
        hpHeal = dif
    end
    target:addHP(hpHeal)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, hpHeal)
end

return item_object
