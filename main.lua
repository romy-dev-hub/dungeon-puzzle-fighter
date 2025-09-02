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

-- love callbacks
function love.load()
    -- Initialize the game world
    map = sti("assets/dungeon_map.lua");

    -- load assets
    player.image = love.graphics.newImage("assets/player.png");

    -- add enemy images later .. 
end

function love.update(dt)
    if currentState == 'exploration' then 
        -- handle player movement
        -- up
        if love.keyboard.isDown("w") then
            player.y = player.y - player.speed * dt
        end
        
        -- down
        if love.keyboard.isDown("s") then
            player.y = player.y + player.speed * dt
        end

        -- left
        if love.Keyboard.isDown("a") then
            player.x = player.x - player.speed * dt
        end

        -- right 
        if love.keyboard.isDown("d") then
            player.x = player.x + player.speed * dt
        end

        -- Random encounter (problem: make it based on steps, not time)
       -- if math.random() < encounterChance then
       --     startBattle()
      --  end

        -- Update map camera to follow player
      --  map:update(dt)

    -- elseif currentState == 'battle' then
        -- Battle logic: Present puzzle, check solve, apply damage
        -- Placeholder: Press space to "solve" and end battle
       -- if love.keyboard.isDown('space') then
        --    resolveBattle(true)  -- True = player wins
       -- end
    end
end

function love.draw()

    -- draw the map and player
    map:draw(-player.x + love.graphics.getWidth() / 2, -player.y + love.graphics.getHeight() / 2)
    love.graphics.draw(player.image, player.x, player.y)

end