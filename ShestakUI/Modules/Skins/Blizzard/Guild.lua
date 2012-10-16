local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	GuildUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	GuildFrame:StripTextures(true)
	GuildFrame:SetTemplate("Transparent")
	GuildLevelFrame:Kill()

	T.SkinCloseButton(GuildMemberDetailCloseButton)
	T.SkinCloseButton(GuildFrameCloseButton)

	local striptextures = {
		"GuildPerksToggleButton",
		"GuildNewPerksFrame",
		"GuildFrameInset",
		"GuildFrameBottomInset",
		"GuildAllPerksFrame",
		"GuildMemberDetailFrame",
		"GuildMemberNoteBackground",
		"GuildInfoFrameInfo",
		"GuildLogContainer",
		"GuildLogFrame",
		"GuildRewardsFrame",
		"GuildMemberOfficerNoteBackground",
		"GuildTextEditContainer",
		"GuildTextEditFrame",
		"GuildRecruitmentRolesFrame",
		"GuildRecruitmentAvailabilityFrame",
		"GuildRecruitmentInterestFrame",
		"GuildRecruitmentLevelFrame",
		"GuildRecruitmentCommentFrame",
		"GuildRecruitmentCommentInputFrame",
		"GuildInfoFrameApplicantsContainer",
		"GuildInfoFrameApplicants",
		"GuildNewsBossModel",
		"GuildNewsBossModelTextFrame"
	}

	GuildRewardsFrameVisitText:ClearAllPoints()
	GuildRewardsFrameVisitText:SetPoint("TOP", GuildRewardsFrame, "TOP", 0, 30)

	for _, frame in pairs(striptextures) do
		_G[frame]:StripTextures()
	end

	GuildNewsBossModel:CreateBackdrop("Transparent")
	GuildNewsBossModelTextFrame:CreateBackdrop("Overlay")
	GuildNewsBossModelTextFrame.backdrop:SetPoint("TOPLEFT", GuildNewsBossModel.backdrop, "BOTTOMLEFT", 0, -1)
	GuildNewsBossModel:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 5, -2)

	local buttons = {
		"GuildPerksToggleButton",
		"GuildMemberRemoveButton",
		"GuildMemberGroupInviteButton",
		"GuildAddMemberButton",
		"GuildViewLogButton",
		"GuildControlButton",
		"GuildRecruitmentListGuildButton",
		"GuildTextEditFrameAcceptButton",
		"GuildRecruitmentInviteButton",
		"GuildRecruitmentMessageButton",
		"GuildRecruitmentDeclineButton"
	}

	for i, button in pairs(buttons) do
		if i == 1 then
			_G[button]:StripTextures(true)
			_G[button]:SkinButton()
		else
			_G[button]:SkinButton(true)
		end
	end

	local checkbuttons = {
		"Quest",
		"Dungeon",
		"Raid",
		"PvP",
		"RP",
		"Weekdays",
		"Weekends",
		"LevelAny",
		"LevelMax"
	}

	for _, frame in pairs(checkbuttons) do
		T.SkinCheckBox(_G["GuildRecruitment"..frame.."Button"])
	end

	T.SkinCheckBox(GuildRecruitmentTankButton:GetChildren())
	T.SkinCheckBox(GuildRecruitmentHealerButton:GetChildren())
	T.SkinCheckBox(GuildRecruitmentDamagerButton:GetChildren())

	for i = 1, 5 do
		T.SkinTab(_G["GuildFrameTab"..i])
	end
	GuildXPFrame:ClearAllPoints()
	GuildXPFrame:SetPoint("TOP", GuildFrame, "TOP", 0, -40)

	T.SkinScrollBar(GuildPerksContainerScrollBar)

	GuildFactionBar:StripTextures()
	GuildFactionBar.progress:SetTexture(C.media.texture)
	GuildFactionBar:CreateBackdrop("Overlay")
	GuildFactionBar.backdrop:SetPoint("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -2, 2)
	GuildFactionBar.backdrop:SetPoint("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 0, 0)

	GuildXPBarLeft:Kill()
	GuildXPBarRight:Kill()
	GuildXPBarMiddle:Kill()
	GuildXPBarBG:Kill()
	GuildXPBarShadow:Kill()
	GuildXPBarCap:Kill()
	GuildXPBar.progress:SetTexture(C.media.texture)
	GuildXPBar:CreateBackdrop("Overlay")
	GuildXPBar.backdrop:SetPoint("TOPLEFT", GuildXPBar.progress, "TOPLEFT", -2, 2)
	GuildXPBar.backdrop:SetPoint("BOTTOMRIGHT", GuildXPBar, "BOTTOMRIGHT", 0, 0)

	GuildLatestPerkButton:StripTextures()
	GuildLatestPerkButtonIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	GuildLatestPerkButtonIconTexture:ClearAllPoints()
	GuildLatestPerkButtonIconTexture:SetPoint("TOPLEFT", 2, -2)
	GuildLatestPerkButton:CreateBackdrop("Default")
	GuildLatestPerkButton.backdrop:SetPoint("TOPLEFT", GuildLatestPerkButtonIconTexture, "TOPLEFT", -2, 2)
	GuildLatestPerkButton.backdrop:SetPoint("BOTTOMRIGHT", GuildLatestPerkButtonIconTexture, "BOTTOMRIGHT", 2, -2)

	GuildNextPerkButton:StripTextures()
	GuildNextPerkButtonIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	GuildNextPerkButtonIconTexture:ClearAllPoints()
	GuildNextPerkButtonIconTexture:SetPoint("TOPLEFT", 2, -2)
	GuildNextPerkButton:CreateBackdrop("Default")
	GuildNextPerkButton.backdrop:SetPoint("TOPLEFT", GuildNextPerkButtonIconTexture, "TOPLEFT", -2, 2)
	GuildNextPerkButton.backdrop:SetPoint("BOTTOMRIGHT", GuildNextPerkButtonIconTexture, "BOTTOMRIGHT", 2, -2)
	GuildNextPerkButtonLockTexture:SetTexture("Interface\\GuildFrame\\GuildFrame")

	-- Guild Perk buttons list
	for i = 1, 8 do
		local button = _G["GuildPerksContainerButton"..i]

		button:StripTextures()

		if button.icon then
			button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.icon:ClearAllPoints()
			button.icon:SetPoint("TOPLEFT", 2, -2)
			button:CreateBackdrop("Default")
			button.backdrop:SetPoint("TOPLEFT", button.icon, "TOPLEFT", -2, 2)
			button.backdrop:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 2, -2)
			button.icon:SetParent(button.backdrop)
			button.lock:SetTexture("Interface\\GuildFrame\\GuildFrame")
			button.lock:SetParent(button.backdrop)
		end
	end

	-- Roster
	T.SkinScrollBar(GuildRosterContainerScrollBar)
	T.SkinCheckBox(GuildRosterShowOfflineButton)

	for i = 1, 4 do
		_G["GuildRosterColumnButton"..i]:StripTextures(true)
	end

	T.SkinDropDownBox(GuildRosterViewDropdown, 200)

	for i = 1, 14 do
		_G["GuildRosterContainerButton"..i.."HeaderButton"]:SkinButton(true)
	end

	-- Detail Frame
	GuildMemberDetailFrame:SetTemplate("Transparent")
	GuildMemberDetailFrame:ClearAllPoints()
	GuildMemberDetailFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	GuildMemberNoteBackground:SetTemplate("Overlay")
	GuildMemberOfficerNoteBackground:SetTemplate("Overlay")
	GuildMemberRankDropdown:SetFrameLevel(GuildMemberRankDropdown:GetFrameLevel() + 5)
	T.SkinDropDownBox(GuildMemberRankDropdown, 160)

	GuildMemberRemoveButton:ClearAllPoints()
	GuildMemberRemoveButton:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame, "BOTTOMLEFT", 9, 4)

	-- News
	GuildNewsFrame:StripTextures()
	for i = 1, 17 do
		_G["GuildNewsContainerButton"..i].header:Kill()
	end

	GuildNewsFiltersFrame:StripTextures()
	GuildNewsFiltersFrame:SetTemplate("Transparent")
	T.SkinCloseButton(GuildNewsFiltersFrameCloseButton)

	for i = 1, 7 do
		T.SkinCheckBox(_G["GuildNewsFilterButton"..i])
	end

	GuildNewsFiltersFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	T.SkinScrollBar(GuildNewsContainerScrollBar)

	-- Info Frame
	T.SkinScrollBar(GuildInfoDetailsFrameScrollBar)
	T.SkinScrollBar(GuildInfoFrameApplicantsContainerScrollBar)

	for i = 1, 3 do
		_G["GuildInfoFrameTab"..i]:StripTextures()
	end

	local backdrop1 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop1:SetTemplate("Overlay")
	backdrop1:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop1:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -22)
	backdrop1:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 200)

	local backdrop2 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop2:SetTemplate("Overlay")
	backdrop2:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop2:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -158)
	backdrop2:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 118)

	local backdrop3 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop3:SetTemplate("Overlay")
	backdrop3:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop3:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -233)
	backdrop3:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 3)

	GuildRecruitmentCommentInputFrame:SetTemplate("Overlay")

	for _, button in next, GuildInfoFrameApplicantsContainer.buttons do
		button:SetBackdrop(nil)
	end

	-- Text Edit Frame
	GuildTextEditFrame:SetTemplate("Transparent")
	T.SkinScrollBar(GuildTextEditScrollFrameScrollBar)
	GuildTextEditContainer:SetTemplate("Transparent")
	T.SkinCloseButton(GuildTextEditFrameCloseButton, GuildTextEditFrame)
	for i = 1, GuildTextEditFrame:GetNumChildren() do
		local child = select(i, GuildTextEditFrame:GetChildren())
		if child:GetName() == "GuildTextEditFrameCloseButton" and child:GetWidth() > 50 then
			child:SkinButton(true)
		end
	end

	-- Guild Log
	T.SkinScrollBar(GuildLogScrollFrameScrollBar)
	GuildLogFrame:CreateBackdrop("Transparent")
	GuildLogFrame.backdrop:SetPoint("TOPLEFT", 0, 0)
	GuildLogFrame.backdrop:SetPoint("BOTTOMRIGHT", -15, 0)
	GuildLogFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	T.SkinCloseButton(GuildLogFrameCloseButton, GuildLogFrame.backdrop)

	for i = 1, GuildLogFrame:GetNumChildren() do
		local child = select(i, GuildLogFrame:GetChildren())
		if child:GetName() == "GuildLogFrameCloseButton" and child:GetWidth() > 50 then
			child:SkinButton(true)
		end
	end

	-- Rewards
	T.SkinScrollBar(GuildRewardsContainerScrollBar)

	for i = 1, 8 do
		local button = _G["GuildRewardsContainerButton"..i]
		button:StripTextures()

		if button.icon then
			button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.icon:ClearAllPoints()
			button.icon:SetPoint("TOPLEFT", 2, -2)
			button:CreateBackdrop("Default")
			button.backdrop:SetPoint("TOPLEFT", button.icon, "TOPLEFT", -2, 2)
			button.backdrop:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 2, -2)
			button.icon:SetParent(button.backdrop)
			button.lock:SetTexture("Interface\\GuildFrame\\GuildFrame")
			button.lock:SetParent(button.backdrop)
		end
	end
end

T.SkinFuncs["Blizzard_GuildUI"] = LoadSkin