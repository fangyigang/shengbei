
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    self.startButton = ui.newImageMenuItem({
        image = "button_entergame_normal.png",
        imageSelected = "button_entergame_down.png",
        x = display.left + 150,
        y = display.bottom + 300,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        listener = function()
            game.enterPlayScene()
        end,
    })
    self.menu = ui.newMenu({self.startButton})
    self:addChild(self.menu)
end

function MainScene:onEnterFrame(dt)
end

function MainScene:onEnter()
    -- self:scheduleUpdate(handler(self, self.onEnterFrame))

end

return MainScene
