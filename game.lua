require("background")
require("obstacle")
require("player")
require("word")

Gamestate = require "hump.gamestate"
game = {}

function game:init()
  self.background = Background(loadImage("background"))
  self.hud_image = loadImage("hud")
  
  self.pozo_image = loadImage("pozo")
  
  self.font = love.graphics.newFont("assets/data/consolas.ttf", 48)
  love.graphics.setFont(self.font)
  
  self.lines = load_file(1)
  self.word = get_word(self.lines)
  
  self.player = Player(40, 380, loadImage("player"))
  
  self.obstacle = spawn_obstacle()
end

function game:update(dt)
  self.player:update(dt)
  self.word:update(dt)
  
  if self.obstacle ~= nil then
    self.obstacle:update(dt)
    
    if self.obstacle:isNear() and self.player.state ~= "reset" then
      if self.word.status == 1 then
        self.player.state = "jumping"
      else
        if (self.obstacle.x - 40) <= self.player.x then
          self.player.state = "falling"
          self.obstacle:stop()
        end
      end
    end
    
    if self.player.state == "reset" then
      game.obstacle:continue()
      if self.obstacle.x+175 < 0 then
        self.obstacle = spawn_obstacle()
        self.word = nil
        self.word = get_word(self.lines)
        self.player.state = "idle"
      end
    end
  end
  
  if self.player.state ~= "falling" then
    self.background:update(dt)
  end
end

function game:draw()
  self.background:draw()
  
  self.player:draw()
  
  love.graphics.draw(self.hud_image, 0, 0)
  
  self.word:draw()
  
  if self.obstacle ~= nil then
    self.obstacle:draw()
  end
end

function game:keypressed(key)
  self.word:akey(key)
end

function spawn_obstacle()
  return Obstacle(love.graphics.getWidth()+100, 483, game.pozo_image)
end

function load_file(level)
  local fname = ""
  if level == 1 then
    fname = "assets/data/facil.txt"
  end
  
  local file = io.open(fname, "rb")
  local ln = {}
  
  for line in io.lines(fname) do
    ln[#ln + 1] = line
  end
  
  return ln
end

function get_word(list)
  local n = math.random(1, table.maxn(game.lines))
  return Word(list[n])
end