-----------------------------------
-- Area: RuAun Gardens
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 145, 2, tpz.regime.type.FIELDS)
end

return entity
