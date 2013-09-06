
local PlayScene = class("PlayScene", function()
	return display.newScene("PlayScene")
end)

function PlayScene:ctor()

	-- local mapLayer = require("..layers.MapLayer").new()
	-- self:addChild(mapLayer, 1)

	-- local playerLayer = require("..layers.PlayerLayer").new()
	-- self:addChild(playerLayer, 2)


end

function PlayScene:onEnter()
	require("..layers.UILayer")
	self:addChild(uiLayer)
end


return PlayScene