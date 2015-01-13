local FRAME_SIZE = 140
local TEXTURE_SIZE = FRAME_SIZE * 2 ^ 0.5 -- Make texture widget bigger to keep original texture size (suggested by Wowpedia page for Texture:SetRotation)

local frame = CreateFrame("Frame", "CompassFrame", UIParent)
frame:SetSize(140, 140)
frame:SetPoint("CENTER")

frame:EnableMouse(true)
frame:SetMovable(true)
frame:SetUserPlaced(true)
frame:RegisterForDrag("LeftButton")

frame:SetScript("OnDragStart", function(self)
	if IsControlKeyDown() then
		self:StartMoving()
	end
end)

frame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

local texture = frame:CreateTexture()
texture:SetSize(TEXTURE_SIZE, TEXTURE_SIZE)
texture:SetTexture("Interface\\AddOns\\Compass\\Compass")
texture:SetPoint("CENTER")

frame:SetScript("OnUpdate", function(self, elapsed)
	texture:SetRotation(-GetPlayerFacing())
end)