bodies = entities:new{
    canwalk =
    {
        up = true,
        down = false,
        left = true,
        right = true
    },
    life = nil,
    maxHealth = nil,
    jumpheight = nil,
    wasFacing = nil
}

function bodies:getHealth()
    return self.health
end

function bodies:getmaxHealth()
    return self.maxHealth
end
