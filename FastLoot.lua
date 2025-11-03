-- Makes looting instant with no delay when auto loot is enabled

local lastLootTime = 0
local lootDelay = 0.025

local function lootAllSlots()
    local autoLootEnabled = GetCVarBool("autoLootDefault")
    local shiftPressed = IsModifiedClick("AUTOLOOTTOGGLE")
    
    if autoLootEnabled ~= shiftPressed then
        if (GetTime() - lastLootTime) >= lootDelay then
            for slotIndex = GetNumLootItems(), 1, -1 do
                LootSlot(slotIndex)
            end
            
            lastLootTime = GetTime()
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("LOOT_READY")
eventFrame:SetScript("OnEvent", lootAllSlots)
