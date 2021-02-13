-----------------------------------
-- Area: Xarcabard
--  Mob: Demon Warlock
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 55, 1, tpz.regime.type.FIELDS)
end

return entity
