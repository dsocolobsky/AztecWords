Class = require "lib/hump.class"

Background = Class {
  init = function(self, image1, image2, image3, image4)
    self.x = 0
    self.y = 0
    self.index = 1
    self.speed = 160
    
    self.images = {}
    self.images[1] = image1
    self.images[2] = image2
    self.images[3] = image3
    self.images[4] = image4
  end,
}

function Background:update(dt)
  self.x = self.x - self.speed * dt
  
  if self.x <= -3072 then
    self.x = 0
  end
end

function Background:draw()
  love.graphics.draw(self.images[1], self.x, self.y)
  love.graphics.draw(self.images[2], self.x + 1024, self.y)
  love.graphics.draw(self.images[3], self.x + 2048, self.y)
  love.graphics.draw(self.images[4], self.x + 3072, self.y)
end