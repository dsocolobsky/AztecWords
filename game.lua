require("background")
require("gameover")
require("obstacle")
require("player")
require("word")

Gamestate = require "lib/hump.gamestate"
game = {}

function game:init()
  self.background = Background(loadImage("back1"), loadImage("back2"), loadImage("back3"),
    loadImage("back4"))
  self.hud_image = loadImage("hud")
  
  self.pozo_image = loadImage("pozo")
  
  self.corazon = loadImage("corazon")
  
  self.font = love.graphics.newFont("assets/data/luximr.ttf", 48)
  love.graphics.setFont(self.font)
  
  -- Sonidos
  self.jumpsound = love.audio.newSource("assets/audio/jump.ogg", "static")
  self.diesound = love.audio.newSource("assets/audio/scream.ogg", "static")
  self.music = love.audio.newSource("assets/audio/music.ogg", "stream")
  
  self.obstacle_speed = 200
end

function game:enter()
  self.lines = load_file(1)
  self.word = get_word(self.lines)
  
  self.player = Player(40, 380, loadImage("player"))
  
  self.obstacle = spawn_obstacle()
  
  self.puntos = 0
  
  self.playedsound = false
end

function game:update(dt)
  self.player:update(dt)
  self.word:update(dt)
  
  if self.obstacle ~= nil then
    self.obstacle:update(dt)
    
    if self.obstacle:isNear() and self.player.state ~= "reset" then
      if self.word.status == 1 then
        self.player.state = "jumping"
        
        if soundactivated and not playedsound then
            game.jumpsound:play()
            playedsound = true
          end
      else
        if (self.obstacle.x - 40) <= self.player.x then
          if soundactivated and not playedsound then
            game.diesound:play()
            playedsound = true
          end
          self.player.state = "falling"
          self.obstacle:stop()
        end
      end
    end
    
    if self.player.state == "reset" then
      playedsound = false
      
      game.obstacle:continue()
      if self.obstacle.x < -190 then
        self.obstacle = spawn_obstacle()
        self.word = nil
        self.word = get_word(self.lines)
        self.player.state = "idle"
      end
    end
  end
  
  if self.player.state ~= "falling" then
    self.background:update(dt)
    
    self.puntos = self.puntos + dt
    
    local pt = math.floor(self.puntos)
    if pt == 20 then
      self.lines = load_file(2)
    elseif pt == 50 then
      self.lines = load_file(3)
    end
    
    if pt == 80 then
      self.obstacle_speed = 300
    elseif pt == 110 then
      self.obstacle_speed = 400
    elseif pt == 150 then
      self.obstacle_speed = 550
    elseif pt == 180 then
      self.obstacle_speed = 650
    end
  end
  
  if self.player.vidas <= 0 then
    Gamestate.switch(gameover)
  end
  
  if soundactivated then
    self.music:play()
  end
end

function game:draw()
  self.background:draw()
  
  self.player:draw()

  love.graphics.draw(self.hud_image, 0, 0)

  
  if self.obstacle ~= nil then
    self.obstacle:draw()
  end
  
  if self.player.vidas == 3 then
    love.graphics.draw(self.corazon, 940-140, 33)
    love.graphics.draw(self.corazon, 940-70, 33)
    love.graphics.draw(self.corazon, 940, 33)
  elseif self.player.vidas == 2 then
    love.graphics.draw(self.corazon, 940-70, 33)
    love.graphics.draw(self.corazon, 940, 33)
  else
    love.graphics.draw(self.corazon, 940, 33)
  end
  
  
  love.graphics.print(math.floor(self.puntos), 78, 20)

  self.word:draw()
end

function game:keypressed(key)
  self.word:akey(key)
end

function spawn_obstacle()
  return Obstacle(love.graphics.getWidth(), 486, game.obstacle_speed, game.pozo_image)
end

function load_file(level)
  local fname = ""
  
  if level == 1 then
    fname = "assets/data/facil.txt"
  elseif level == 2 then
    fname = "assets/data/medio.txt"
  elseif level == 3 then
    fname = "assets/data/dificil.txt"
  end
  
  local file = io.open(fname, "rb")
  if file == nil then print("File was nil") end

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