Class = require "hump.class"
local anim8 = require 'anim8'

Player = Class {
  init = function(self, x, y, image)
    self.x = x
    self.y = y
    self.image = image
    
    local g = anim8.newGrid(96, 140, image:getWidth(), image:getHeight())
    self.run_animation = anim8.newAnimation(g('1-4', '1-2'), 0.1)
    self.jump_animation = anim8.newAnimation(g(2, 2), 1)
    
    self.vidas = 3
  end,
  
  width = 96,
  height = 140,
  dy = 0,
  state = "idle",
  jumpingstate = "ascending",
  speed = 160,
  toppoint = 250,
}

function Player:reset()
  self.dy = 0
  self.state = "idle"
  self.jumpingstate = "ascending"
  self.speed = 160
  self.x = 40
  self.y = 380
end

function Player:update(dt)
  self.run_animation:update(dt)
  
  if self.state == "falling" then
    self:fall()
  elseif self.state == "jumping" then
    self:jump()
  elseif self.state == "backing" then
    self:reset()
  end
  
  self.y = self.y + self.speed * self.dy * dt
end

function Player:draw()
  if self.dy == 0 then
    self.run_animation:draw(self.image, self.x, self.y)
  else
    self.jump_animation:draw(self.image, self.x, self.y)
  end
end

function Player:fall()
  self.dy = 1
  
  if self.y >= 650 then
    game.obstacle:continue()
  end
    
  if self.y >= 920 then
    self:reset()
    self.state = "reset"
    
    self.vidas = self.vidas - 1
  end
end

function Player:jump()
  if self.jumpingstate == "ascending" then
    self.dy = -1
      
    if self.y <= self.toppoint then
      self.jumpingstate = "descending"
    end
  else
    self.dy = 1
      
    if self.y >= 380 then
      self:reset()
      self.state = "reset"
    end
  end
end