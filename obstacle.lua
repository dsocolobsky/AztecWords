Class = require "lib/hump.class"

Obstacle = Class {
  init = function(self, x, y, speed, image)
    self.x = x
    self.y = y
    self.speed = speed
    self.image = image
    self.hidden = false
  end,
  
  width = 173,
  height = 45,
}

function Obstacle:update(dt)
  self.x = self.x - self.speed * dt
end

function Obstacle:draw()
  if self.hidden ~= true then
    love.graphics.draw(self.image, self.x, self.y)
  end
end

function Obstacle:isNear()
  return self.x > 50 and self.x < 200
end

function Obstacle:stop()
  self.speed = 0
end

function Obstacle:continue()
  self.hidden = true
  self.speed = 200
end

function Obstacle:stopplayer()
  if self.x <= 38 then
    self.speed = 200
    self.x = 38
  end
end