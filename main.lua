function love.load()
	require "Level6"
	love.window.setMode(580,900)
	level6_load()
end

function love.draw()
	level6_draw()
end

function love.update(dt)
	level6_update(dt)
end

--[[function love.keypressed(key)
	level6_keypressed(key);
end]]

function love.joystickpressed(joystick)
	level6_joystickpressed(joystick)
end

function love.joystickreleased(joystick, button)
	level6_joystickreleased(joystick, button)
end

function love.joystickaxis(joystick, axis, value)
	level6_joystickaxis(joystick, axis, value)
end

function love.keyreleased(key)
	level6_keyreleased(key)
end

function love.joystickadded(joystick)
	level6_joystickadded(joystick)
end

function love.joystickremoved(joystick)
	level6_joystickremoved(joystick)
end
