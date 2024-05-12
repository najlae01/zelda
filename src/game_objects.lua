--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        breakable = false,
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
        -- TODO
        type = 'pot',
        texture = 'tiles',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        defaultState = 'onGround',
        breakable = false,
        liftable = true,
        states = {
            ['onGround'] = {
                frame = 14
            },

            ['lifted'] = {
                frame = 14
            }
        }
    },
    
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'collectable',
        breakable = false,
        states = {
            ['collectable'] = {
                frame = 5
            }
        }
    },
    ['projectile'] = {
		type = 'pot',
		width = 16,
		height = 16,
		texture = 'tiles',
		frame = 14,
		speed = 130
	}
}