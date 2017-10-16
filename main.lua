Key = require("lib.Keyboard")
local Player = require("lib.Player")
local Ball = require("lib.Ball")

local p1
local p2
local b

function love.load()

    Key:hookLoveEvents()
    p1 = Player(580, 240, 20, 80, 200, "up", "down")
    p2 = Player(60, 240, 20, 80, 200, "w", "s")
    b = Ball(100)
end

function collidedWithHorizontal(r)
    return r.y <= 0 or r.y >= 
end

function collided(r1, r2)
    return r1.x < r2.x + r2.w and
        r2.x < r1.x + r1.w and
        r1.y < r2.y + r2.h and
        r2.y < r1.y + r1.h
end

function love.update(dt)
    if dt > 0.04 then return end
    
    if collided(b, p1) or collided(b, p2) then
        b:reverseX()
        b.spd = b.spd + 0.2
        rand = love.math.random(8) / 10 * (love.math.random(0,1)*2-1)
        b.yDir = rand
        -- print(rand)
    end

    if Key:keyDown("escape") then
		love.event.quit()
	end

    p1:update(dt)
    p2:update(dt)
    b:update(dt)
    Key:update(dt)
    
end

function love.draw()
    p1:draw()
    p2:draw()
    b:draw()    
end