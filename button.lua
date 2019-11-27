Class = require "lib/hump.class"

Button = Class {
	init = function(self, x, y, img)
		self.x = x
		self.y = y
		self.img = img

		self.ex = x + 333
		self.ey = y + 115
	end,
	hovered = false, -- Pasamos el mouse arriba
	clicked = false, -- Hicimos click
	darken = 0.15 -- Cuanto oscurecemos el boton
}

function Button:update(dt)
	mx, my = love.mouse.getPosition()

	-- El mouse esta arriba del boton
	if mx > self.x and mx < self.ex and my > self.y and my < self.ey then
		print("Hovered")
		self.hovered = true
	else
		self.hovered = false
	end
end

function Button:draw()
	-- Si el boton esta seleccionado, hacerlo mas brillante
	if self.hovered then
		love.graphics.setColor(1, 1, 1, 1)
	else
		love.graphics.setColor(1-self.darken, 1-self.darken, 1-self.darken, 1)
	end

	-- Renderizar el boton
	love.graphics.draw(self.img, self.x, self.y)

	-- Resetear el color
	love.graphics.setColor(255, 255, 255, 255)
end
