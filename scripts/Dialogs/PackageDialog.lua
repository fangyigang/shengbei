require("..models.package")
require("..models.player")
local PackageDialog = class("PackageDialog", function()
	return display.newLayer("PackageDialog")
end)

function PackageDialog:ctor()
	CCLuaLog("PackageDialog:ctor")

	self.bkg = display.newSprite("dialog_package_bkg.png")
	self.bkg:setAnchorPoint(CCPoint(0, 0))
	self.bkg:setPosition(0, 0)
	--self.bkg:setScale(0.7)
	self:addChild(self.bkg) 

	self.closeButton = ui.newImageMenuItem({
		image = "dialog_close_button.png",
		-- imageSelected = "",
		x = 180,
		y = 290,
		listener = function()
			packageDialog:setVisible(false)
		end
	})
	
	self.buttonMenu = ui.newMenu({self.closeButton})
	self:addChild(self.buttonMenu)

	self:initItems()

	self:setVisible(false)
	self:setPosition(300, 20)
 
	local rect = self.bkg:getTextureRect()
	self.left, self.bottom = self:getPosition()
	self.right = self.left + rect:getMaxX()
	self.top = self.bottom + rect:getMaxY()

end

function PackageDialog:onEnter()
end

function PackageDialog:initItems()
	for k, v in pairs(package.items) do
		v.imageItem = display.newSprite(v.image)
		v.imageItem:setAnchorPoint(CCPoint(0, 0))
		v.imageItem:setScale(0.7)
		v.imageItem:setPosition(package.itemsRect.left + (v.index-1) * 36.6, package.itemsRect.top-36.6)
		self:addChild(v.imageItem) 
	end
end

function PackageDialog:initItemActiveMenu(index)
	package.itemsActiveMenu = display.newLayer()

	if package.items[index] ~= nil then
		if package.items[index].itemType == kEquipment then
			local equipItem = ui.newTTFLabelMenuItem({
				tag = index,
				x = 0,
				y = 0 + 3*20,
				text = "装备",
				listener = function(tag)
					CCLuaLog("装备")
					
					if package.items[tag].equipType == kWeapon then
						player[player.curSel].equipments.weapon = clone(package.items[tag])
						packageDialog:removeChild(package.items[tag].imageItem)
						package.items[tag] = nil
						CCLuaLog(tostring(player[player.curSel].equipments.weapon.imageItem))
						playerDialog:addChild(player[player.curSel].equipments.weapon.imageItem)
					end
				end
			})
			local showItem = ui.newTTFLabelMenuItem({
				tag = index,
				x = 0,
				y = 0 + 2*20,
				text = "展示",
				listener = function(tag)
					CCLuaLog("展示")
				end
			})
			local abandomItem = ui.newTTFLabelMenuItem({
				tag = index,
				x = 0,
				y = 0 + 1*20,
				text = "丢弃",
				listener = function(tag)
					CCLuaLog("丢弃")
				end
			})
			local menuItem = ui.newMenu({equipItem, showItem, abandomItem})
			package.itemsActiveMenu:addChild(menuItem)
			package.itemsActiveMenu:setPosition(36.6*(index-1) + 18, 272-18-50)
			self:addChild(package.itemsActiveMenu)
		end
	end
end

function PackageDialog:isGetTouch(x, y)
	if x > self.left and x < self.right and y > self.bottom and y < self.top then
		return true
	end
	return false
end

function PackageDialog:onTouchBegan(x, y)
	local relX = x - self.left 
	local relY = y - self.bottom
	self.touchBeginPoint = {x = relX, y = relY}
	return true
end

function PackageDialog:onTouchMoved(x, y)

end

function PackageDialog:onTouchEnded(x, y)
	local relX = x - self.left 
	local relY = y - self.bottom
	CCLuaLog(relX.." "..relY)
	if relX == self.touchBeginPoint.x and relY == self.touchBeginPoint.y then
		if relX > 10 and relX < 193 and relY > 27 and relY < 272 then
			-- 物品栏
			local index = math.floor((relX-10) / 36.6) + math.floor((272 - relY) / 36.6) * 5 + 1
			CCLuaLog("index:"..index) 
			self:initItemActiveMenu(index)
		end
	end
end

function PackageDialog:onTouch(event, x, y)
	if event == "began" then
		return self:onTouchBegan(x, y)
	elseif eventType == "moved" then
		return self:onTouchMoved(x, y)
	else
		return self:onTouchEnded(x, y)
	end
end

if packageDialog == nil then
	packageDialog = PackageDialog:new()
	uiLayer:addChild(packageDialog)
end