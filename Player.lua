Player = {}

-- Constructor
function Player:new()
    -- define our parameters here
    local object = {
    x = 0,
    y = 0,
    width = 0,
    height = 0,
    xSpeed = 0,
    ySpeed = 0,
    state = "",
    jumpSpeed = 0,
    runSpeed = 0,
    canJump = false,
    map = ""
    }
    setmetatable(object, { __index = Player })
    return object
end

-- Movement functions
function Player:jump()
    if self.canJump then
        self.ySpeed = self.jumpSpeed
        self.canJump = false        
    end
end

function Player:moveRight()
    self.xSpeed = self.runSpeed
    self.state = "moveRight"
end

function Player:moveLeft()
    self.xSpeed = -1 * (self.runSpeed)
    self.state = "moveLeft"
end

function Player:stop()
    self.xSpeed = 0
end

function Player:hitFloor(maxY)
    self.y = maxY - self.height
    self.ySpeed = 0
    self.canJump = true
end

function Player:positionX()
    if self.x % self.width == 0 then
        return self.x / self.width, self.x / self.width
    else
        return math.floor(self.x / self.width),math.floor((self.x+self.width) / self.width)
    end
end

function Player:positionY()
    if self.y % self.width == 0 then
        return self.y / self.width, self.y / self.width
    else
        return math.floor(self.y / self.width),math.floor((self.y+self.width) / self.width)
    end
end

-- Update function
function Player:update(dt, gravity)
    -- update the player's position
    self.x = self.x + (self.xSpeed * dt)
    self.y = self.y + (self.ySpeed * dt)

    -- apply gravity
    self.ySpeed = self.ySpeed + (gravity * dt)

    -- update the player's state
    if not(self.canJump) then
        if self.ySpeed < 0 then
            self.state = "jump"
        elseif self.ySpeed > 0 then
            self.state = "fall"
        end
    else
        if self.xSpeed > 0 then
            self.state = "moveRight"
        elseif self.xSpeed < 0 then
            self.state = "moveLeft"
        else
            self.state = "stand"
        end
    end
end

function Player:updateState(state)
    self.state = state
end
