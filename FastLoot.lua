-- Makes looting instant with no delay when auto loot is enabled

local lastTime = 0
local delay = 0.025

local function loot()
	local autoLoot = GetCVarBool("autoLootDefault")

	if autoLoot then
		if (GetTime() - lastTime) >= delay then
			for slot = GetNumLootItems(), 1, -1 do
				LootSlot(slot)
			end

			lastTime = GetTime()
		end
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("LOOT_READY")
frame:SetScript("OnEvent", loot)