-----------------------------------
-- Area: Port Windurst
--  NPC: Laughing Lizard
-- Standard Info NPC (fishing)
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(618)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
