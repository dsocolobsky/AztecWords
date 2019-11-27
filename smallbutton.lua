Class = require "lib/hump.class"
require("button")

SmallButton = Class { __includes = Button,
	init = function(self, x, y, img, alt)
    Button.init(self, x, y, img)
    self.alt = alt

		self.ex = x + 109
		self.ey = y + 109
	end,
  
  activated = false, -- 0 o 1 dependiendo que imagen mostrar
}

function SmallButton:draw()
	-- Si el boton esta seleccionado, hacerlo mas brillante
	if self.hovered then
		love.graphics.setColor(1, 1, 1, 1)
	else
		love.graphics.setColor(1-self.darken, 1-self.darken, 1-self.darken, 1)
	end

	-- Renderizar el boton dependiendo que boton mostrar
  if not self.activated then
    love.graphics.draw(self.img, self.x, self.y)
  else
    love.graphics.draw(self.alt, self.x, self.y)
  end
  
	-- Resetear el color
	love.graphics.setColor(1, 1, 1, 1)
end

function SmallButton:activate()
  self.activated = not self.activated
end