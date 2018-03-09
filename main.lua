local baton = require 'baton'
local inspect = require 'inspect'

local input = baton.new {
	controls = {
		left = {'key:left', 'axis:leftx-', 'button:dpleft'},
		right = {'key:right', 'axis:leftx+', 'button:dpright'},
		up = {'key:up', 'axis:lefty-', 'button:dpup'},
		down = {'key:down', 'axis:lefty+', 'button:dpdown'},
		action = {'key:x', 'button:a'},
	},
	pairs = {
		move = {'left', 'right', 'up', 'down'}
	},
	joystick = love.joystick.getJoysticks()[1],
}

function love.update(dt)
	input:update()
end

function love.draw()
	local x, y = input:get 'move'
	love.graphics.print(tostring(x) .. '\n' .. tostring(y))
end