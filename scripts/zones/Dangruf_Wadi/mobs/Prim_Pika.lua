-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Prim Pika
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 644, 1, tpz.regime.type.GROUNDS)
end

return entity
