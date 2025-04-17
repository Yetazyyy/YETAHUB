
local Player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteLog = {}

-- Listen for all remote events fired by the player
for _, v in pairs(getgc(true)) do
    if typeof(v) == "Instance" and v:IsA("RemoteEvent") then
        table.insert(RemoteLog, v)
    end
end

-- Hook FireServer to catch which remotes are being called
for _, remote in pairs(RemoteLog) do
    local old
    old = hookfunction(remote.FireServer, function(self, ...)
        print("Remote Fired:", self:GetFullName(), ...)
        return old(self, ...)
    end)
end

print("Remote Logger Aktif - Tekan block di game untuk lihat nama remote-nya.")
