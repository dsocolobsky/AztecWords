Gamestate = require "hump.gamestate"
menu = {}

function menu:init()
	-- Fondo del menu
	self.background = loadImage("menu")
  
  -- Logo del juego
  self.logo = loadImage("logo")

	-- Botones grandes
	self.botonjugar = Button(660, 400, loadImage("botonjugar"))
	self.botonsalir = Button(660, 560, loadImage("botonsalir"))
  
  -- Botones chicos
  self.botonsonido = SmallButton(40, 26, loadImage("soundon"), loadImage("soundoff"))
  self.botonventana = SmallButton(180, 26, loadImage("botonfullscreen"), loadImage("botonwindowed"))
end

function menu:update(dt)
	self.botonjugar:update(dt)
	self.botonsalir:update(dt)
  
  self.botonsonido:update(dt)
  self.botonventana:update(dt)
end

function menu:mousepressed(x, y, button)
  if button ~= 'l' then
    return
  end
  
  if self.botonjugar.hovered then
    Gamestate.switch(game)
  elseif self.botonsalir.hovered then
    love.event.quit()
  elseif self.botonsonido.hovered then
    self.botonsonido:activate()
    sound = not sound
  elseif self.botonventana.hovered then
    self.botonventana:activate()
    fullscreen, fstype = love.window.getFullscreen()
    love.window.setFullscreen(not fullscreen, "normal")
  end
end

function menu:draw()
	love.graphics.draw(self.background, 0, 0)
  love.graphics.draw(self.logo, 485, 16)

	self.botonjugar:draw()
	self.botonsalir:draw()
  
  self.botonsonido:draw()
  self.botonventana:draw()
end