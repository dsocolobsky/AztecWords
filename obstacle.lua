Class = require "hump.class"

Obstacle = Class {
  init = function(self, x, y, image)
    self.x = x
    self.y = y
    self.image = image
  end,
  
  width = 173,
  height = 45,
  speed = 200,
}

function Obstacle:update(dt)
  self.x = self.x - self.speed * dt
end

function Obstacle:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Obstacle:isNear()
  return self.x > 50 and self.x < 200
end

function Obstacle:stop()
  self.speed = 0
end

function Obstacle:continue()
  self.speed = 200
end

function Obstacle:stopplayer()
  if self.x <= 38 then
    self.speed = 200
    self.x = 38
  end
end