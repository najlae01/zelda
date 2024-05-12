--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    self.isActive = true

    self.liftable = def.liftable or false

    self.breakable = def.breakable

    self.carriedBy = nil

    -- default empty collision callback
    self.onCollide = function() end

    self.onBreak = function() end
end

function GameObject:update(dt)

end

function GameObject:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    if self.isActive then    
        love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
            self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    end
    if self.carriedBy then
        self.x = self.carriedBy.x
        self.y = self.carriedBy.y - self.height + self.carriedBy.offsetY + 3
    end
end


function GameObject:throw()

    if not self.carriedBy then
        return nil
    end

    -- instantiate a projectile
    local projectile = Projectile(self.x, self.y, self.carriedBy.direction,
        GAME_OBJECT_DEFS['projectile'])
    projectile.frameOffset = self.frameOffset
    self.carriedBy.carrying = nil
    self.carriedBy = nil
    self.isActive = false

    return projectile
end