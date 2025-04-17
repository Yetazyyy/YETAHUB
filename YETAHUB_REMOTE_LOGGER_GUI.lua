
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RS = game:GetService("RunService")

-- UI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "RemoteLogger"

local label = Instance.new("TextLabel", gui)
label.Size = UDim2.new(1, 0, 0, 40)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.Text = "Menunggu Remote..."
label.Font = Enum.Font.GothamBold
label.TextSize = 18

-- Hooking Remotes
local hooked = {}

for _, v in pairs(getgc(true)) do
    if typeof(v) == "Instance" and v:IsA("RemoteEvent") and not hooked[v] then
        hooked[v] = true
        local old
        old = hookfunction(v.FireServer, function(self, ...)
            label.Text = "Remote Terdeteksi: " .. self:GetFullName()
            print("Remote Fired:", self:GetFullName())
            return old(self, ...)
        end)
    end
end

label.Text = "Logger Aktif! Tekan tombol Block di game..."
