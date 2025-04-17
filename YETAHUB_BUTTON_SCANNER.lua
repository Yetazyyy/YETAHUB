local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

-- Buat GUI tampilan hasil
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "ButtonScanner"

local label = Instance.new("TextLabel", gui)
label.Size = UDim2.new(1, 0, 0, 40)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
label.TextColor3 = Color3.new(1, 1, 1)
label.Text = "Mendeteksi tombol..."
label.Font = Enum.Font.GothamBold
label.TextSize = 18

-- Fungsi scanner
local function scanUI()
    for _, descendant in ipairs(game:GetDescendants()) do
        if descendant:IsA("TextButton") or descendant:IsA("ImageButton") then
            descendant.MouseButton1Click:Connect(function()
                label.Text = "Tombol ditekan: " .. descendant:GetFullName()
                print("Tombol ditemukan:", descendant:GetFullName())
            end)
        end
    end
end

scanUI()
label.Text = "Scanner Aktif - Tekan tombol BLOCK dan M1 di layar"

StarterGui:SetCore("SendNotification", {
    Title = "YETAHUB",
    Text = "Tekan tombol BLOCK & M1 agar bisa dideteksi",
    Duration = 4
})
