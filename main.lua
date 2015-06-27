Gamestate = require "hump.gamestate"
require("menu")
require("game")
require("button")
require("smallbutton")

local sound = true

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
	Gamestate.registerEvents()
	Gamestate.switch(menu)

	love.window.setMode(1024, 768)
  love.window.setTitle("Aztec Words")
end

function loadImage(filename)
	return love.graphics.newImage("assets/images/" .. filename .. ".png")
end