-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Pot
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 749, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 751, 1, tpz.regime.type.GROUNDS)
end

return entity
