Gamestate = require "hump.gamestate"
menu = {}

soundactivated = true

function menu:init()
	self.background = loadImage("menuback")  
  self.logo = loadImage("logo")

	self.botonjugar = Button(660, 400, loadImage("botonjugar"))
  self.botonsalir = Button(660, 560, loadImage("botonsalir"))
  
  self.botonsonido = SmallButton(40, 26, loadImage("sonido-on"), loadImage("sonido-off"))
  self.botonventana = SmallButton(180, 26, loadImage("pantalla-completa"), loadImage("pantalla-ventana"))
end

function menu:update(dt)
	self.botonjugar:update(dt)
  self.botonsalir:update(dt)
  self.botonsonido:update(dt)
  self.botonventana:update(dt)
end

function menu:mousereleased(x, y, button)
  print(string.format("button: %d\n", button))

  -- if right click ignore
  if button ~= 1 then
    return
  end
  
  if self.botonjugar.hovered then
    Gamestate.switch(game)
  elseif self.botonsalir.hovered then
    love.event.quit()
  elseif self.botonsonido.hovered then
    self.botonsonido:activate()
    soundactivated = not soundactivated
  elseif self.botonventana.hovered then
    self.botonventana:activate()
    fullscreen, fstype = love.window.getFullscreen()
    love.window.setFullscreen(not fullscreen, "exclusive")
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