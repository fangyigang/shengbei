
local MapLayer = class("MapLayer", function()
	return display.newLayer("MapLayer")
end)

function MapLayer:ctor()

	local bkg = display.newSprite("bkg.png")
	bkg:setAnchorPoint(CCPoint(0, 0))
	bkg:setPosition(0, 0)
	self:addChild(bkg)

end

function MapLayer:OnEnter()

end

return MapLayer