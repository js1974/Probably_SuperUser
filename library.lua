local su = { }

su.items = { }
su.flagged = GetTime()
su.unflagged = GetTime()
su.tempNum = 0
su.chiButton = true
su.queueSpell = nil
su.queueTime = 0

su.buttons = 
  ProbablyEngine.toggle.create(
    'chistacker',
    'Interface\\Icons\\ability_monk_expelharm',
    'Stack Chi',
    'Keep Chi at full even OoC...')
    
SLASH_ECAST1 = "/su"
function SlashCmdList.ECAST(msg, editbox)		
local command = msg:match("^(.*)$")

  if command == 'toggle' then
    if ProbablyEngine.config.read('button_states', 'MasterToggle', false) then
        ProbablyEngine.buttons.toggle('MasterToggle')
        --ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        itb:message("|cFFB30000SuperUser Windwalker off")
    else
        ProbablyEngine.buttons.toggle('MasterToggle')
        --ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        itb:message("|cFF00B34ASuperUser Windwalker on")
    end
  end
    if command == 'interrupt' then
    if ProbablyEngine.config.read('button_states', 'interrupt', false) then
      ProbablyEngine.buttons.toggle('interrupt')
      --ProbablyEngine.buttons.buttons['interrupt']:Click()
      itb:message("|cFFB30000Interrupts off")
    else
      ProbablyEngine.buttons.toggle('interrupt')
      --ProbablyEngine.buttons.buttons['interrupt']:Click()
      itb:message("|cFF00B34AInterrupts on")
    end
  end

  if command == 'cooldowns' then
    if ProbablyEngine.config.read('button_states', 'cooldowns', false) then
      ProbablyEngine.buttons.toggle('cooldowns')
      --ProbablyEngine.buttons.buttons['cooldowns']:Click()
      itb:message("|cFFB30000Cooldowns off")
    else
      ProbablyEngine.buttons.toggle('cooldowns')
      --ProbablyEngine.buttons.buttons['cooldowns']:Click()
      itb:message("|cFF00B34ACooldowns on")
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.config.read('button_states', 'multitarget', false) then
      ProbablyEngine.buttons.toggle('multitarget')
      --ProbablyEngine.buttons.buttons['multitarget']:Click()
      itb:message("|cFFB30000AoE off")
    else
      ProbablyEngine.buttons.toggle('multitarget')
      --ProbablyEngine.buttons.buttons['multitarget']:Click()
      itb:message("|cFF00B34AAoE on")
    end
  end
  
  if command == 'chistacker' then
    if ProbablyEngine.config.read('button_states', 'chistacker', false) then
      ProbablyEngine.buttons.toggle('chistacker')
      --ProbablyEngine.buttons.buttons['chistacker']:Click()
      itb:message("|cFFB30000CChi Cap off")
    else
      ProbablyEngine.buttons.toggle('chistacker')
      --ProbablyEngine.buttons.buttons['chistacker']:Click()
      itb:message("|cFF00B34AChi Cap on")
    end
  end

  if command == 'macros' then
    su.createAllMacros()
  end

  if command == 'help' then
    su.macroHelp()
  end


-- Tier Four Talents
    if command == "tfour" then
    if select(2,GetTalentRowSelectionInfo(4)) == 10 then
        su.queueSpell = 116844
        ecn:message("Ring of Peace queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 11 then
        su.queueSpell = 119392
        ecn:message("Charging Ox Wave queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 12 then
        su.queueSpell = 119381
        ecn:message("Leg Sweep queued") 
    end
	
-- Tier Five Talents
    elseif command == "tfive" then
    if select(2,GetTalentRowSelectionInfo(5)) == 13 then
        su.queueSpell = 122280
        ecn:message("Healing Elixirs queued") 
    elseif select(2,GetTalentRowSelectionInfo(5)) == 14 then
        su.queueSpell = 122278
        ecn:message("Dampen Harm queued") 
    elseif select(2,GetTalentRowSelectionInfo(5)) == 15 then
        su.queueSpell = 122783
        ecn:message("Diffuse Magic queued") 
    end
	
  elseif command == "tok" or command == 122470 then
    su.queueSpell = 122470
        ecn:message("Touch of Karma queued")	
  elseif command == "gw" or command == 117368 then
    su.queueSpell = 117368
        ecn:message("Grapple Weapon queued")	
  elseif command == "nb" or command == 137562 then
    su.queueSpell = 137562
        ecn:message("Nimble Brew queued")	
  elseif command == "trans" or command == 101643 then
    su.queueSpell = 101643
        ecn:message("Transcendence queued")	
  elseif command == "transfer" or command == 119996 then
    su.queueSpell = 119996
        ecn:message("Transcendence: Transfer queued")	
  elseif command == "fof" or command == 113656 then
    su.queueSpell = 113656
        ecn:message("Fists of Fury queued")	
  elseif command == "disable" or command == 116095 then
    su.queueSpell = 116095
        ecn:message("Disable queued")	
  elseif command == "fb" or command == 115203 then
    su.queueSpell = 115203
        ecn:message("Fortifying Brew queued")	
  elseif command == "fsk" or command == 101545 then
    su.queueSpell = 101545
        ecn:message("Flying Serpent Kick queued")
  elseif command == "teb" or command == 116740 then
    su.queueSpell = 116740
        ecn:message("Tigereye Brew queued")
  elseif command == "para" or command == 115078 then
    su.queueSpell = 115078
        ecn:message("Paralyis queued")
  elseif command == "sef" or command == 137639 then
    su.queueSpell = 137639
        ecn:message("Storm, Earth & Fire queued")
  elseif command == "hs" or command == 115460 then
    su.queueSpell = 115460
        ecn:message("Healing Sphere queued")	
  elseif command == "tl" or command == 116841 then
    su.queueSpell = 116841
        ecn:message("Tiger's Lust queued")	
  else
    su.queueSpell = nil
  end
  if su.queueSpell ~= nil then su.queueTime = GetTime() end
end

su.checkQueue = function (spellId)
  if (GetTime() - su.queueTime) > 4 then
    su.queueTime = 0
    su.queueSpell = nil
    return false
  else
    if su.queueSpell then
      if su.queueSpell == spellId then
        if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
          su.queueSpell = nil
          su.queueTime = 0
        end
        return true
      end
    end
  end
  return false
end

-----------------------------------------------------------------------------------------------------------------------------
-- Notify Frame -- (c)xrn overlay for pqr -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    ecn = CreateFrame("Frame",nil,ChatFrame1) 
    ecn:SetSize(ChatFrame1:GetWidth(),30)
    ecn:Hide()
    ecn:SetScript("OnUpdate",onUpdate)
    ecn:SetPoint("TOPLEFT",0,150)
    ecn.text = ecn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    ecn.text:SetAllPoints()
    ecn.texture = ecn:CreateTexture()
    ecn.texture:SetAllPoints()
    ecn.texture:SetTexture(0,0,0,.50) 
    ecn.time = 0
    function ecn:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
    
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    ecn = CreateFrame("Frame",nil,ChatFrame1) 
    ecn:SetSize(ChatFrame1:GetWidth(),30)
    ecn:Hide()
    ecn:SetScript("OnUpdate",onUpdate)
    ecn:SetPoint("TOP",0,0)
    ecn.text = ecn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    ecn.text:SetAllPoints()
    ecn.texture = ecn:CreateTexture()
    ecn.texture:SetAllPoints()
    ecn.texture:SetTexture(0,0,0,.50) 
    ecn.time = 0
    function ecn:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end

su.setFlagged = function (self, ...)
  su.flagged = GetTime()
end

su.setUnflagged = function (self, ...)
  su.unflagged = GetTime()
  if su.items[77589] then
    su.items[77589].exp = su.unflagged + 60
  end
end

su.eventHandler = function(self, ...)
  local subEvent		= select(1, ...)
  local source		= select(4, ...)
  local destGUID		= select(7, ...)
  local spellID		= select(11, ...)
  local failedType = select(14, ...)
  
  if UnitName("player") == source then
    if subEvent == "SPELL_CAST_SUCCESS" then
      if spellID == 6262 then -- Healthstone
        su.items[6262] = { lastCast = GetTime() }
      end
      if spellID == 124199 then -- Landshark (itemId 77589)
        su.items[77589] = { lastCast = GetTime(), exp = 0 }
      end
    end
  end
end

ProbablyEngine.listener.register("su", "COMBAT_LOG_EVENT_UNFILTERED", su.eventHandler)
ProbablyEngine.listener.register("su", "PLAYER_REGEN_DISABLED", su.setFlagged)
ProbablyEngine.listener.register("su", "PLAYER_REGEN_DISABLED", su.resetLists)
ProbablyEngine.listener.register("su", "PLAYER_REGEN_DISABLED", su.setUnflagged)
ProbablyEngine.listener.register("su", "PLAYER_REGEN_ENABLED", su.resetLists)

function su.spellCooldown(spell)
  local spellName = GetSpellInfo(spell)
  if spellName then
    local spellCDstart,spellCDduration,_ = GetSpellCooldown(spellName)
    if spellCDduration == 0 then
      return 0
    elseif spellCDduration > 0 then
      local spellCD = spellCDstart + spellCDduration - GetTime()
      return spellCD
    end
  end
  return 0
end

function su.fillBlackout()
  local energy = UnitPower("player")
  local regen = select(2, GetPowerRegen("player"))
  local start, duration, enabled = GetSpellCooldown(107428)
  if not start then return false end
  if start ~= 0 then
    local remains = start + duration - GetTime()
    return (energy + regen * remains) >= 40
  end
  return 0
  
end

function su.usePot(target)
	if not (UnitBuff("player", 2825) or
			UnitBuff("player", 32182) or 
			UnitBuff("player", 80353) or
			UnitBuff("player", 90355)) then
		return false
	end
	if GetItemCount(76089) < 1 then return false end
	if GetItemCooldown(76089) ~= 0 then return false end
	if not ProbablyEngine.condition["modifier.cooldowns"] then return false end
	if UnitLevel(target) ~= -1 then return false end
  if su.t2d(target) > 30 then return false end
	return true 
end

function su.t2d(target)
  if ProbablyEngine.condition["deathin"](target) then
    return ProbablyEngine.condition["deathin"](target)
	end
  return 600
end

function su.validTarget(unit)
  if not UnitIsVisible(unit) then return false end
  if not UnitExists(unit) then return false end
  if not (UnitCanAttack("player", unit) == 1) then return false end
  if UnitIsDeadOrGhost(unit) then return false end
  local inRange = IsSpellInRange(GetSpellInfo(116), unit) -- Frostbolt
  if not inRange then return false end
  if inRange == 0 then return false end
  if not su.immuneEvents(unit) then return false end
  return true
end


function su.itemCooldown(itemID)
  return GetItemCooldown(itemID)
end

function su.createAllMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 3 then
    CreateMacro("su_toggle", "monk_stance_whitetiger", "/su toggle", 1, 1)
    CreateMacro("su_interrupt", "ability_monk_spearhand", "#showtooltip Spear Hand Strike\n/su kick", 1, 1)
    CreateMacro("su_cooldowns", "ability_monk_summontigerstatue", "/su cooldowns", 1, 1)
	CreateMacro("su_chicap", "ability_monk_expelharm", "/su chistacker", 1, 1)
    CreateMacro("su_aoe", "ability_monk_cranekick_new", "/su aoe", 1, 1)
	CreateMacro("su_sef", "spell_sandstorm", "/su sef", 1, 1)
	CreateMacro("su_tfour", "ability_monk_legsweep", "/su tfour", 1, 1)
	CreateMacro("su_tfive", "spell_monk_diffusemagic", "/su tfive", 1, 1)
    CreateMacro("su_gw", "ability_warrior_disarm", "#showtooltip Grapple Weapon\n/su gw", 1, 1)
    CreateMacro("su_disable", "ability_shockwave", "#showtooltip Disable\n/su disable", 1, 1)
    CreateMacro("su_fb", "ability_monk_fortifyingale_new", "#showtooltip Fortifying Brew\n/su fb", 1, 1)
    CreateMacro("su_Transcendence", "monk_ability_transcendence", "#showtooltip Transcendence\n/su Trans", 1, 1)
    CreateMacro("su_Transfer", "spell_shaman_spectraltransformation", "#showtooltip Transcendence: Transfer\n/su Transfer", 1, 1)
	CreateMacro("su_fof", "monk_ability_fistoffury", "#showtooltip Fists of Fury\n/su fof", 1, 1)
	CreateMacro("su_tl", "ability_monk_tigerslust", "/su tl", 1, 1)
   	CreateMacro("su_nb", "spell_monk_nimblebrew", "/su nb", 1, 1)
	CreateMacro("su_hs", "ability_monk_healthsphere", "/su fsk", 1, 1)
	CreateMacro("su_fsk", "ability_monk_flyingdragonkick", "/su fsk", 1, 1)
	CreateMacro("su_teb", "ability_monk_tigereyebrandy", "/su teb", 1, 1)
	CreateMacro("su_para", "ability_monk_paralysis", "/su para", 1, 1)
	

    

  else
    print("You don't have enough free Macroslots")
  end
end  

function su.macroHelp( ... )
  print("|cFF32ff84SuperUser WW |1.0")
  print("|cFF32ff84Commands:|r\n/su macros - Create all Toggle / Spellqueue Macros")
  print("|cFF32ff84Toggle Macros:|r\n/su toggle - Rotation on/off\n/su interrupt - Interrupt on/off\n/su cooldowns - Offensive Cooldowns on/off\n/su aoe - Multitarget-Rotation on/off\n/su chistacker - Stack chi ooc\n")
  print("|cFF32ff84Queue Macros:|r\n/su sef | tfour | tfive | gw | disable | fb | trans | transfer | fof | nb | hs | fsk | teb | para")
  print("|cFF32ff84Additional Help:|r\https://probablyengine.com/forum/topic1135-superuser-windwalker.html")
end  

function su.immuneEvents(unit)
  if not UnitAffectingCombat(unit) then return false end
  -- Crowd Control
  local cc = {
    49203, -- Hungering Cold
     6770, -- Sap
     1776, -- Gouge
    51514, -- Hex
     9484, -- Shackle Undead
      118, -- Polymorph
    28272, -- Polymorph (pig)
    28271, -- Polymorph (turtle)
    61305, -- Polymorph (black cat)
    61025, -- Polymorph (serpent) -- FIXME: gone ?
    61721, -- Polymorph (rabbit)
    61780, -- Polymorph (turkey)
     3355, -- Freezing Trap
    19386, -- Wyvern Sting
    20066, -- Repentance
    90337, -- Bad Manner (Monkey) -- FIXME: to check
     2637, -- Hibernate
    82676, -- Ring of Frost
   115078, -- Paralysis
    76780, -- Bind Elemental
     9484, -- Shackle Undead
     1513, -- Scare Beast
   115268, -- Mesmerize
  }
  if su.hasDebuffTable(unit, cc) then return false end
  if UnitAura(unit,GetSpellInfo(116994))
		or UnitAura(unit,GetSpellInfo(122540))
		or UnitAura(unit,GetSpellInfo(123250))
		or UnitAura(unit,GetSpellInfo(106062))
		or UnitAura(unit,GetSpellInfo(110945))
		or UnitAura(unit,GetSpellInfo(143593)) -- General Nazgrim: Defensive Stance
    or UnitAura(unit,GetSpellInfo(143574)) -- Heroic Immerseus: Swelling Corruption
		then return false end
  return true
end

function su.hasDebuffTable(target, spells)
  for i = 1, 40 do
    local _,_,_,_,_,_,_,_,_,_,spellId = _G['UnitDebuff'](target, i)
    for k,v in pairs(spells) do
      if spellId == v then return true end
    end
  end
end

function su.checkShark(target)
  if GetItemCount(77589, false, false) > 0 then
    if not su.items[77589] then return true end
    if su.items[77589].exp ~= 0 and
      su.items[77589].exp < GetTime() then return true end
  end
end

function su.touchOfDeath(target)
  return UnitHealth(target) < UnitHealth("player")
end

function su.detox(target)
  local debuffType
  for i = 1, 40 do
    debuffType = select(5, UnitDebuff("player", i))
    if debuffType == "Poison" or debuffType == "Disease" then
      return true
    end
  end
end

ProbablyEngine.library.register("su", su)
