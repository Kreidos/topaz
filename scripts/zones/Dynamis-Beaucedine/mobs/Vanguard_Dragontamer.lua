-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Vanguard Dragontamer
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Beaucedine/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DRAKLIX_SCALECRUST_PH, 10, 1200) -- 20 minutes
end

return entity
