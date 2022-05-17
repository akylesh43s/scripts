local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("evry bordr gam") -- Creates the window

local b = w:CreateFolder("AutoFarm") -- Creates the folder(U will put here your buttons,etc)

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
    while true do 
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

b:Toggle("Money",function(bool)
    getgenv().loop = bool
    if bool then
        moneh()
    end
end)


local d = w:CreateFolder("DestroyGui")
d:DestroyGui()