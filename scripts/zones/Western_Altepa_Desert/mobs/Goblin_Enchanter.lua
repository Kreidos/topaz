-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Goblin Enchanter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 137, 1, tpz.regime.type.FIELDS)
end

return entity
