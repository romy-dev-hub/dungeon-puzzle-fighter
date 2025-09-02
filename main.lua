local sti = require "sti";

--game state
local states = {
    exploration = {},
    battle = {}
}

local currentState = 'exploration';


--global variables
local player = {
    x = 100;
    y = 100;
    speed = 200;
    hp = 100;
    maxHp = 100;
    level = 1;
    xp = 0;
}

local enemy = nil;  -- will be set during battle
local map = nil;
local encounterChance = 0.05;  -- 5% per update cycle 