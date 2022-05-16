local msg = "bruh"
local discordID = "398052194156544011" -- YOUR DISCORD ID HERE
local webhook = "https://discord.com/api/webhooks/975672166320308264/mg596Xi5FEtygGw5bW07ln8F5fMVfLG08J2i3YOqsFP8svq1hAMjlYRPqha0vHonn1pB" -- YOUR WEBHOOK LINK HERE
local HttpService = game:GetService("HttpService");
local botname = "Notification"

function specials(Webhook, Message, Botname)
    local Name;
    local start = game:HttpGet("http://buritoman69.glitch.me");
    local biggie = "http://buritoman69.glitch.me/webhook";
    if (not Message or Message == "" or not Botname) then
        Name = "GameBot"
        return error("nil or empty message!")
    else
        Name = Botname;
    end
    local Body = {
        ['Key'] = tostring("applesaregood"),
        ['Message'] = tostring(Message),
        ['Name'] = Name,
        ['Webhook'] = Webhook    
    }
    Body = HttpService:JSONEncode(Body);
    local Data = game:HttpPost(biggie, Body, false, "application/json")
    return Data or nil;
end

local WantedMagics = {"Fire"," ","","","","","","","",""} -- Put what elements you want between the quotation marks
local WantedRarities = {"","","","","",""} -- Put the name of the rarities you want between the quotation marks

repeat wait() until game.Players.LocalPlayer ~= nil

local HasGamepass = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,20164545)

while wait(0.00001) do
    local Magic, Rarity
    if HasGamepass then
         Magic, Rarity = game:GetService("ReplicatedStorage").Events.Spin:InvokeServer(true)
    else
         Magic, Rarity = game:GetService("ReplicatedStorage").Events.Spin:InvokeServer(false)
    end
    if Magic == nil or Rarity == nil then
        print("Out of spins!")
        break
    end
    specials(webhook, "Rolled "..Magic.." with a rarity of ".. Rarity, botname)
    print("Rolled "..Magic.." with a rarity of "..Rarity)
    if table.find(WantedMagics,Magic) or table.find(WantedRarities,Rarity) then
        specials(webhook, "<@"..discordID.."> , you have been rolled magic that you wanted", botname)
        break
    end
end
game.Players.LocalPlayer.Character:BreakJoints()