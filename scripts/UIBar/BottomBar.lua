
local BottomBar = class("BottomBar", function()
	return display.newLayer("BottomBar")
end)

function BottomBar:ctor()
	self.playerButton = ui.newImageMenuItem({
		image = "button_player_normal.png",
		-- imageSelected = "button_player_down.png",
		x = display.right - 150,
		y = display.bottom + 25,
		listener = function()
			require("..Dialogs.PlayerDialog")
			playerDialog:setVisible(not playerDialog:isVisible())
		end
	})

	self.packageButton = ui.newImageMenuItem({
		image = "button_package_normal.png",
		-- imageSelected = "button_package_down.png",
		x = display.right - 100,
		y = display.bottom + 25,
		listener = function()
			require("..Dialogs.PackageDialog")
			packageDialog:setVisible(not packageDialog:isVisible())
		end
	})

	self.skillButton = ui.newImageMenuItem({
		image = "button_skill_normal.png",
		-- imageSelected = "button_skill_down.png",
		x = display.right - 50,
		y = display.bottom + 25,
		listener = function()

		end
	})

	self.barMenu = ui.newMenu({self.playerButton, self.packageButton, self.skillButton})
end


if bottomBar == nil then
	bottomBar = BottomBar:new()
	uiLayer:addChild(bottomBar.barMenu)
end


