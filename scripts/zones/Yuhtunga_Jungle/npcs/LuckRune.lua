-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Luck Rune
--  Involved in Quest: Mhaura Fortune
-- !pos -95.486 11.188 418.153 123
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
