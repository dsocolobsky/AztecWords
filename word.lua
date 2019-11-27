Class = require "lib/hump.class"

Letter = Class {
  init = function(self, x, y, str)
    self.x = x
    self.y = y
    
    self.str = str
    self.strlength = string.len(str)
    
    self.status = 0
  end;

  __tostring = function(self)
    return self.str
  end;
}

function Letter:update(dt)
  
end

function Letter:draw()
  if self.status == 1 then
    love.graphics.setColor(0, 1, 0, 1)
  elseif self.status == -1 then
    love.graphics.setColor(1, 0, 0, 1)
  end
  
  love.graphics.print(self.str, self.x, self.y)
  love.graphics.setColor(1, 1, 1, 1)
end

Word = Class {
    init = function(self, str)
      self.str = str
      self.letters = {}
      self.status = 0
      self.current = 1

      self.x = 280
      self.y = 674
      
      for i = 1, string.len(str) do
        table.insert(self.letters, Letter(self.x + ((i-1)*32), self.y, string.sub(str, i, i)))
      end
    end;

    __tostring = function(self)
      return self.str
    end;    
}

function Word:update(dt)
  
end

function Word:draw()
  for _,v in pairs(self.letters) do
    v:draw()
  end
end

function Word:akey(key)
  if self.status == 0 then
    if key == self.letters[self.current].str then
      self.letters[self.current].status = 1
    
      if self.letters[self.current + 1] == nil then
        self.status = 1
      end
    else
      self.status = -1
      for _,v in pairs(self.letters) do
        v.status = -1
      end
    end
  end

  self.current = self.current + 1
end
