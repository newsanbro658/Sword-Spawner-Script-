-- Load Tora Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/library", true))()

-- Main Window
local window = library:CreateWindow("🔥NEWSAN SCRIPTS🔥")

-- ========================
-- ⚔️ Sword Spawner
-- ========================
local weaponFolder = window:AddFolder("⚔️ Sword Spawner")

weaponFolder:AddBox({
text = "Enter Weapon Name",
callback = function(value)
_G.weaponName = value
end
})

weaponFolder:AddButton({
text = "Spawn Sword",
callback = function()
local weapon = _G.weaponName or "Sword"
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddWeaponToBase")
pcall(function() remote:FireServer(weapon) end)
end
})

-- ========================
-- 🎁 Free Rare Sword
-- ========================
local freeRareFolder = window:AddFolder("🎁 Free Rare Sword")

freeRareFolder:AddButton({
text = "🔫Get Free Rare Sword🔥",
callback = function()
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("TakeFreeRare")
pcall(function() remote:InvokeServer() end)
end
})

-- ========================
-- 🏆 Get Best Sword
-- ========================
local bestWeaponFolder = window:AddFolder("🏆 Get Best Sword🔫")

bestWeaponFolder:AddButton({
text = "🔥GET BEST SWORD🔥",
callback = function()
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddWeaponToBase")
pcall(function() remote:FireServer("Heavens Halberd") end)
end
})

-- ========================
-- 🏃 Speed & NoClip 📌
-- ========================
local playerFolder = window:AddFolder("🏃 Speed & 📌 No Clip")

-- Speed Input
playerFolder:AddBox({
text = "Enter WalkSpeed",
callback = function(value)
_G.playerSpeed = tonumber(value) or 16
end
})

-- Apply WalkSpeed continuously
spawn(function()
local plr = game.Players.LocalPlayer
while task.wait(0.1) do
if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
plr.Character.Humanoid.WalkSpeed = _G.playerSpeed or 16
end
end
end)

-- NoClip Toggle
playerFolder:AddToggle({
text = "Enable NoClip",
callback = function(state)
_G.noClip = state
local plr = game.Players.LocalPlayer
spawn(function()
while _G.noClip do
if plr.Character then
for _, part in pairs(plr.Character:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
end
task.wait(0.1)
end
end)
end
})

-- ========================
-- Initialize GUI
-- ========================
library:Close()
library:Init()
