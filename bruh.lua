getgenv().autoFarm = false
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local X = Material.Load({
	Title = "CunnyWare",
	Style = 3,
	SizeX = 400,
	SizeY = 80,
	Theme = "Aqua",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(235,235,235)
	}
})

local Y = X.New({
	Title = "Main"
})

function equip()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
   if v:IsA("Tool") then
        v.Parent = game:GetService("Players").LocalPlayer.Character
   end
end
end

function unequip()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
     if v:IsA'Tool' then
          v.Parent = game.Players.LocalPlayer.Backpack
     end
end
end

function sell()
    local args = {
    [1] = "caik",
    [2] = false
}

game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
end

function moneh()
    while getgenv().autoFarm == true do 
        wait(0.00001)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-375.499, 7.10022, -238.314)
        wait(1)
        local vim = game:service'VirtualInputManager'
        vim:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        wait(10.5)
        equip()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380.704, 7.00021, -231.773)
        wait(7.5)
        unequip()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.0269, 20.9998, -5024.14)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.003, 7.31899, -240.95)
        wait(2)
        local vim = game:service'VirtualInputManager'
        vim:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        wait(10.5)
        sell()
        wait(1)
    end   
end

local B = Y.Toggle({
	Text = "Auto Farm Coins",
	Callback = function(Loop)
    getgenv().autoFarm = Loop
    if Loop then
        moneh()
    end
	end,
	Enabled = false
})