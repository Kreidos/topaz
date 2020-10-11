------------------------------------
-- Records of Eminence
------------------------------------
require("scripts/globals/status")

tpz = tpz or {}
tpz.roe = tpz.roe or {}

tpz.roe.triggers =
{
    mobKill = 1,        -- Player kills a Mob (Counts for mobs killed by partymembers)
    wSkillUse = 2,      -- Player Weapon skill used
    itemLooted = 3,     -- Player successfully loots an item
    synthSuccess = 4,   -- Player synth success
    dmgTaken = 5,       -- Player takes Damage
    dmgDealt = 6,       -- Player deals Damage
    expGain = 7,        -- Player gains EXP
}

tpz.roe.checks = {}
local checks = tpz.roe.checks

-- Main general check function for all-purpose use.
-- Some functions may specify custom handlers (ie. gain exp or deal dmg.)
checks.masterCheck = function(self, player, params)
    for func in pairs(self.reqs) do
        if not checks[func] or not checks[func](self, player, params) then
            return false
        end
    end
    return true
end


checks.mobID = function(self, player, params)    -- Mob ID check
    return (params.mob and self.reqs.mobID[params.mob:getID()]) and true or false
end

checks.mobXP = function(self, player, params)    -- Mob yields xp
    return (params.mob and player:checkKillCredit(params.mob)) and true or false
end

checks.mobFamily = function(self, player, params)   -- Mob family in set
    return (params.mob and self.reqs.mobFamily[params.mob:getFamily()]) and true or false
end

checks.mobSystem = function(self, player, params)   -- Mob system in set
    return (params.mob and self.reqs.mobSystem[params.mob:getSystem()]) and true or false
end

checks.dmgMin = function(self, player, params)  -- Minimum Dmg Dealt/Taken
    return (params.dmg and params.dmg >= self.reqs.dmgMin) and true or false
end

checks.dmgMax = function(self, player, params)  -- Maximum Dmg Dealt/Taken
    return (params.dmg and params.dmg <= self.reqs.dmgMax) and true or false
end

checks.zone = function(self, player, params)  -- Player in Zone
    return (self.reqs.zone[player:getZoneID()]) and true or false
end

checks.zoneNot = function(self, player, params)  -- Player not in Zone
    return (not self.reqs.zoneNot[player:getZoneID()]) and true or false
end

checks.itemID = function(self, player, params)  -- itemid in set
    return (params.itemid and self.reqs.itemID[params.itemid]) and true or false
end

checks.levelSync = function(self, player, params)  -- Player is Level Sync'd
    return self.reqs.levelSync and player:isLevelSync() and true or false
end

-- Load Records
package.loaded["scripts/globals/roe_records"] = nil
require("scripts/globals/roe_records")

--[[ **************************************************************************
    Complete a record of eminence. This is for internal roe use only.
    For external calls use onRecordTrigger below. (see healing.lua for example)
    If record rewards items, and the player cannot carry them, return false.
    Otherwise, return true.
    Example of usage with params (all params are optional):
        npcUtil.completeRecord(player, record#, {
            item = { {640,2}, 641 },          -- see npcUtil.giveItem for formats (Only given on first completion)
            keyItem = tpz.ki.ZERUHN_REPORT,   -- see npcUtil.giveKeyItem for formats
            sparks = 500,
            xp = 1000
        })
     *************************************************************************** --]]
local function completeRecord(player, record, params)
    local params = params or {}

    if not player:getEminenceCompleted(record) and params["item"] then
        if not npcUtil.giveItem(player, params["item"]) then
            player:messageBasic(tpz.msg.basic.ROE_UNABLE_BONUS_ITEM)
            return false
        end
    end

    player:messageBasic(tpz.msg.basic.ROE_COMPLETE,record)

    if params["sparks"] ~= nil and type(params["sparks"]) == "number" then
        local bonus = 1
        if player:getEminenceCompleted(record) then
            player:addCurrency('spark_of_eminence', params["sparks"] * bonus * SPARKS_RATE)
            player:messageBasic(tpz.msg.basic.ROE_RECEIVE_SPARKS, params["sparks"] * SPARKS_RATE, player:getCurrency("spark_of_eminence"))
        else
            bonus = 3
            player:addCurrency('spark_of_eminence', params["sparks"] * bonus * SPARKS_RATE)
            player:messageBasic(tpz.msg.basic.ROE_FIRST_TIME_SPARKS, params["sparks"] * bonus * SPARKS_RATE, player:getCurrency("spark_of_eminence"))
        end
    end

    if params["xp"] ~= nil and type(params["xp"]) == "number" then
        player:addExp(params["xp"] * ROE_EXP_RATE)
    end

    if params["keyItem"] ~= nil then
        npcUtil.giveKeyItem(player, params["keyItem"])
    end

    -- successfully complete the record
    if params["repeatable"] then
        player:messageBasic(tpz.msg.basic.ROE_REPEAT_OR_CANCEL)
        player:setEminenceCompleted(record, 1)
    else
        player:setEminenceCompleted(record)
    end
    return true
end

-- *** onRecordTrigger is the primary entry point for all record calls. ***
-- Even records which are completed through Lua scripts should point here and
-- have record information entered in roe_records.lua. This keeps everything neat.

function tpz.roe.onRecordTrigger(player, recordID, params)
    local entry = tpz.roe.records[recordID]
    if entry and entry:check(player, params) then
        local progress = (params and params.progress or player:getEminenceProgress(recordID)) + entry.increment
        if progress >= entry.goal then
            completeRecord(player, recordID, entry.reward)
        else
            player:setEminenceProgress(recordID, progress, entry.goal)
        end
    end
end
