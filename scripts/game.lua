
require("config")
require("framework.init")

-- define global module
game = {
}

playScene = nil

uiLayer = nil
bottomBar = nil

playerDialog = nil
packageDialog = nil
skillDialog = nil

function game.startup()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")

    game.enterPlayScene()
end

function game.exit()
    CCDirector:sharedDirector():endToLua()
end

function game.enterMainScene()
    display.replaceScene(require("scenes.MainScene").new(), "fade", 0.6, display.COLOR_WHITE)
end

function game.enterPlayScene()
	display.replaceScene(require("scenes.PlayScene").new(), "fade", 0.6, display.COLOR_WHITE)
end

