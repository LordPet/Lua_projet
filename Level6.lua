
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
    
    p.x = 300
    p.y = 300
    p.width = 50 -- 25 is the normal width
    p.height = 60 -- 40 is the normal height
    p.jumpSpeed = -800 -- -800 is the normal jump speed
    p.runSpeed = 500
 
   	
	gravity = 1000 -- 1800 is the normal gravity
 
    yFloor = 500
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
    -- round down our x, y values
    local x = math.floor(p.x)
    local y = math.floor(p.y)
 
    -- draw the player shape
    g.setColor(playerColor)
    g.rectangle("fill", x, y, p.width, p.height)
 
    -- draw the ground
    g.setColor(groundColor)
    g.rectangle("fill", 0, yFloor, 800, 100)
 
    -- debug information
    g.setColor(255, 255, 255)
    local isTrue = ""
    g.print("Player coordinates: ("..x..","..y..")", 5, 5)
    g.print("Current state: "..p.state, 5, 20)    
    g.print(Connected, 5, 35)
    g.print(Button,5,50)
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