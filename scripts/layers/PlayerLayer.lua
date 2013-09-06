
local PlayerLayer = class("PlayerLayer", function()
	return display.newLayer("PlayerLayer")
end)

function PlayerLayer:ctor()

	local player = display.newSprite("player.png")
	player:setAnchorPoint(CCPoint(0, 0))
	player:setPosition(0, 0)
	self:addChild(player)

	self:addTouchEventListener(handler(self, self.onTouch))
end

function PlayerLayer:OnEnter()
	self:setTouchEnabled(true)
	
end

function PlayerLayer:onTouch(event, x, y)
	CCLuaLog("onTouch")
end

return PlayerLayer

