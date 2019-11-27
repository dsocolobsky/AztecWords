Gamestate = require "lib/hump.gamestate"
gameover = {}

function gameover:init()
	-- Fondo del menu
	self.background = loadImage("menu")
  
  -- Logo del juego
  self.logo = loadImage("gameover")

	self.botonsalir = Button(660, 560, loadImage("botonsalir"))
end


function gameover:update(dt)
  self.botonsalir:update(dt)
end

function gameover:mousepressed(x, y, button)
  if button ~= 'l' then
    return
  end
  
  if self.botonsalir.hovered then
    Gamestate.switch(menu)
  end
end

function gameover:draw()
  love.graphics.draw(self.background, 0, 0)
  love.graphics.draw(self.logo, 485, 16)

	self.botonsalir:draw()
end