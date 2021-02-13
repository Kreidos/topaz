-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Rhoikos
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 338)
end

return entity
