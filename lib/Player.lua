local Class = require("lib.Class")

local P = Class:derive("Player")

function P:new(x, y, w, h, spd, upkey, downkey)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.spd = spd

    self.upkey = upkey
    self.downkey = downkey
end

function P:update(dt)

    if Key:key(self.upkey) then
        self.y = self.y - self.spd * dt
    elseif Key:key(self.downkey) then
        self.y = self.y + self.spd * dt        
    end

    if self.y <= 0  then
        self.y = 0
    elseif self.y >= 480 - self.h then
        self.y = 480 - self.h
    end
end

function P:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return P