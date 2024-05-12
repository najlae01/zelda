--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)
    
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('swing-sword')
    end

    if love.keyboard.wasPressed('return') then
        local obj = PlayerIdleState:getObjectInFront(self.entity, self.dungeon.currentRoom.objects)
        if obj ~= nil then
            self.entity.carrying = obj
            obj.carriedBy = self.entity
            obj.solid = false

            self.entity:changeState('carry-pot')
        end
    end
end


function PlayerIdleState:getObjectInFront(entity, objects)

    local x, y, w, h
    local offset = math.floor(TILE_SIZE/4)
    if entity.direction == 'left' then
        x = entity.x - offset
        y = entity.y
    elseif entity.direction == 'right' then
        x = entity.x + offset
        y = entity.y
    elseif entity.direction == 'up' then
        x = entity.x
        y = entity.y - offset
        print(entity.direction)
    else
        x = entity.x
        y = entity.y + offset
        print(entity.direction)
    end

    local pickupBox = Hitbox(x, y, entity.width, entity.height)

    for k, object in pairs(objects) do
        if object:collides(pickupBox) and object.isActive and object.liftable then
            return object
        end
    end

    return nil
end