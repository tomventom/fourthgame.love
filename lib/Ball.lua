local Class = require("lib.Class")

local B = Class:derive("Ball")

function B:new(spd)
    self.spd = spd

    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.w = 12
    self.h = 12
    self.xDir = 1
    self.yDir = 0
end

function B:reverseX()
    self.xDir = self.xDir * -1
end

function B:reverseY()
    self.yDir = self.yDir * -1    
end

function B:update(dt)

    self.x = self.x + self.spd * self.xDir * dt
    self.y = self.y + self.spd * self.yDir * dt

end

function B:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return B