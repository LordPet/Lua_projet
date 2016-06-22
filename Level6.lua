
function level6_load()
    g = love.graphics
    playerColor = {255,0,128}
    groundColor = {25,200,25}

    -- Joystick
    Connected = "No controller connected"
    Button = "Nope"

    -- instantiate our player and set initial values
    require "Player"
    p = Player:new()

    p.x = 2*32
    p.y = 24*32
    map_x = 16
    map_y = 26
    love.window.setMode(map_x*32,map_y*32)
    p.width = 32
    p.height = 32
    p.jumpSpeed = -400
    p.runSpeed = 500


	  gravity = 1800 -- 1800 is the normal gravity

    yFloor = 800

    map = {
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 1
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 2
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 3
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 4
    		{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }, -- 5
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 6
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 7
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 8
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 9
    		{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }, -- 10
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 11
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 12
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 13
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 14
    		{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }, -- 15
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 16
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 17
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 18
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 19
    		{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }, -- 20
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 21
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 22
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 23
    		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, -- 24
    		{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }, -- 25
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }  -- 26
    }
end

function level6_update(dt)
    if love.keyboard.isDown("right") then
        p:moveRight()
    end
    if love.keyboard.isDown("left") then
        p:moveLeft()
    end
    -- if the space key is pressed...
    if love.keyboard.isDown("space") then
        p:jump()
    end


    -- update the player's position
    p:update(dt, gravity)

    -- stop the player when they hit the borders
    if p.x > 800 - p.width then p.x = 800 - p.width end
    if p.x < 0 then p.x = 0 end
    if p.y < 0 then p.y = 0 end
    if p.y > yFloor - p.height then
        p:hitFloor(yFloor)
    end
end

function level6_joystickpressed(joystick)
    if joystick:isGamepadDown("a") then
        p:jump()
    end
    if joystick:isGamepadDown("dpleft") then
        p:moveLeft()
    end
    if joystick:isGamepadDown("dpright") then
        p:moveRight()
    end
end

function level6_joystickreleased(joystick, button)
    Button = button
    if button == 4 or button == 3 then
        p:stop()
    end
end

function level6_joystickaxis(joystick, axis, value)
    if value >= 0.1 then
        if axis == 1 then
            p:moveRight()
        elseif axis == 3 then
            p:moveRight()
        end
    elseif value <= -0.1 then
        if axis == 1 then
            p:moveLeft()
        elseif axis == 2 then
            p:jump()
        elseif axis == 3 then
            p:moveLeft()
        elseif axis == 4 then
            p:jump()
        end
    else
        p:stop()
    end
end

function level6_draw()
    -- draw the player shape
    g.setColor(playerColor)
    g.rectangle("fill", p.x, p.y-32, p.width, p.height)

    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
              love.graphics.rectangle("line", (x-1) * 32, (y-1) * 32, 32, 32)
            end
        end
    end
end

function level6_keyreleased(key)
    if key == "escape" then
        love.event.push("quit")  -- actually causes the app to quit
    end
    if (key == "right") or (key == "left") then
        p:stop()
    end
end

function level6_joystickadded(joystick)
    Connected = joystick:getName().." is connected"
end

function level6_joystickremoved(joystick)
    Connected = "No controller connected"
end
