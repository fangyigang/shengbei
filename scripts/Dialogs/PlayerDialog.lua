
local PlayerDialog = class("PlayerDialog", function()
	return display.newLayer("PlayerDialog")
end)

function PlayerDialog:ctor()
	CCLuaLog("playerDialog:ctor")

	self.bkg = display.newSprite("dialog_player_bkg.png")
	self.bkg:setAnchorPoint(CCPoint(0, 0))
	self.bkg:setPosition(0, 0)
	self:addChild(self.bkg) 

	self.closeButton = ui.newImageMenuItem({
		image = "dialog_close_button.png",
		-- imageSelected = "",
		x = 230,
		y = 300,
		listener = function()
			playerDialog:setVisible(false)
		end
	})

	self.buttonMenu = ui.newMenu({self.closeButton})
	self:addChild(self.buttonMenu)

	self:setVisible(false)
	self:setPosition(20, 20)
end

function PlayerDialog:onEnter()
end


function PlayerDialog:isGetTouch(x, y)
	if x > self.left and x < self.right and y > self.bottom and y < self.top then
		return true
	end
	return false
end

function PlayerDialog:onTouch(event, x, y)
	CCLuaLog("PlayerDialog:onTouch")
end

if playerDialog == nil then
	playerDialog = PlayerDialog:new()
	uiLayer:addChild(playerDialog)
end