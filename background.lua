Class = require "hump.class"

Background = Class {
  init = function(self, image)
    self.x = 0
    self.y = 0
    self.image = image
    self.speed = 160
  end,
}

function Background:update(dt)
  self.x = self.x - self.speed * dt
  
  if self.x <= -3072 then
    self.x = 0
  end
end

function Background:draw()
  love.graphics.draw(self.image, self.x, self.y)
end