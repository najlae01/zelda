--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(x, y, dir, def)
    self.x = x
    self.y = y
    self.direction = dir

    self.type = def.type
    self.width = def.width
    self.height = def.height

    self.offsetX = def.offsetX or 0
    self.offsetY = def.offsetY or 0

    self.texture = def.texture
    self.frame = def.frame

    self.active = true

    if self.direction == 'left' then
    	self.dx = -def.speed
    	self.dy = 0
    elseif self.direction == 'right' then
    	self.dx = def.speed
    	self.dy = 0
    elseif self.direction == 'up' then
    	self.dx = 0
    	self.dy = -def.speed
    else
    	self.dx = 0
    	self.dy = def.speed
    end
end

function Projectile:update(dt)
    self.x = self.x + (self.dx * dt)
	self.y = self.y + (self.dy * dt)

    if self.active then
		if self:wallCollision() then
			self.active = false
            gSounds['hit-enemy']:stop()
			gSounds['hit-enemy']:play()
		end
	end
end

function Projectile:render()
    love.graphics.draw( 
        gTextures[self.texture], 
        gFrames[self.texture][self.frame], 
        math.floor(self.x - self.offsetX), 
        math.floor(self.y - self.offsetY) 
    )
end

function Projectile:wallCollision()
	if self.x <= MAP_RENDER_OFFSET_X  or self.x >= MAP_WIDTH * TILE_SIZE
		or self.y <= MAP_RENDER_OFFSET_Y or self.y >= MAP_HEIGHT * TILE_SIZE then
		return true
	else
		return false
	end
end