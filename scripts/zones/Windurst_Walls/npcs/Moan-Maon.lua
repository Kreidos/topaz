-----------------------------------
-- Area: Windurst Walls
--  NPC: Moan-Maon
-- Type: Standard NPC
-- !pos 88.244 -6.32 148.912 239
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local WildcatWindurst = player:getCharVar("WildcatWindurst")

    if (player:getQuestStatus(tpz.quest.log_id.WINDURST, tpz.quest.id.windurst.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatWindurst, 7)) then
        player:startEvent(497)
    else
        player:startEvent(307)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 497) then
        player:setCharVar("WildcatWindurst", utils.mask.setBit(player:getCharVar("WildcatWindurst"), 7, true))
    end

end
