-----------------------------------
-- Area: San d'Oria-Jeuno Airship
--  NPC: ???
-- Involved In Quest: The Stars Of Ifrit
-- !pos -9 -5 -13 223
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/keyitems")
require("scripts/globals/world")
local ID = require("scripts/zones/San_dOria-Jeuno_Airship/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local TOTD = VanadielTOTD()
    local TheStarsOfIfrit = player:getQuestStatus(tpz.quest.log_id.BASTOK, tpz.quest.id.bastok.THE_STARS_OF_IFRIT)

    if (TOTD == tpz.time.NIGHT and IsMoonFull()) then
        if (TheStarsOfIfrit == QUEST_ACCEPTED and player:hasKeyItem(tpz.ki.CARRIER_PIGEON_LETTER) == false) then
            player:addKeyItem(tpz.ki.CARRIER_PIGEON_LETTER)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CARRIER_PIGEON_LETTER)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
