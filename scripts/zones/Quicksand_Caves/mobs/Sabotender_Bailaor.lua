-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sabotender Bailaor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 816, 1, tpz.regime.type.GROUNDS)
end

return entity
