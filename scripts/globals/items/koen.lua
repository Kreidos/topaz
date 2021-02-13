-----------------------------------
-- ID: 6430
-- Item: Koen
-- Additional Effect: Fire Damage
-- Enchantment: "Enfire"
-- Charges: 30 Reuse: 300 Secs
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 5

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = math.random(4, 19)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, tpz.magic.ele.FIRE, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.FIRE, 0)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.FIRE)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.FIRE, dmg)

        local message = tpz.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = tpz.msg.basic.ADD_EFFECT_HEAL
        end

        return tpz.subEffect.FIRE_DAMAGE, message, dmg
    end
end

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    local effect = tpz.effect.ENFIRE
    doEnspell(target, target, nil, effect)
end

return item_object
