local char = game.Players.LocalPlayer.Character
local client = require(char:WaitForChild("CharacterHandler"):WaitForChild("Client"))

for k, v in pairs(client) do
    print(k, v)
end
