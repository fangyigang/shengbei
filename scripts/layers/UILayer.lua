
local UILayer = class("UILayer", function()
	return display.newLayer("UILayer")
end)

function UILayer:createBottomBar()
	
end

function UILayer:ctor()
	self:setNodeEventEnabled(true)
end

function UILayer:onEnter()


	require("..UIBar.BottomBar")
		
	local function onTouch(event, x, y)
		if package.itemsActiveMenu ~= nil then
			CCLuaLog("delete itemsActiveMenu")
			packageDialog:removeChild(package.itemsActiveMenu)
			package.itemsActiveMenu = nil
		end
		if packageDialog ~= nil then
			if packageDialog:isVisible() == true and packageDialog:isGetTouch(x, y) == true then 
				return packageDialog:onTouch(event, x, y)
			end
		end
		if playerDialog ~= nil then
			if playerDialog:isVisible() == true and playerDialog:isGetTouch(x, y) == true then 
				return playerDialog:onTouch(event, x, y)
			end
		end
	end

	self:addTouchEventListener(onTouch)
	self:setTouchEnabled(true)
	self:setTouchPriority(0)


end

if uiLayer == nil then
	uiLayer = UILayer:new()
end