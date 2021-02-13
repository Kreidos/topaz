-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wildkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 787, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 789, 1, tpz.regime.type.GROUNDS)
end

return entity
