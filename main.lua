local Messages = {
	"WHO WANTS A FREE TORPEDO",
	"--> ,gg/cezkot",
	"I NEED THIS WHOLE JAILBREAK TO COME JOIN THE GIVEAWAY HYPERSHIFT $15",
	"WE NEED MODS IN THE SERVER"
}

for i = 1, 30 do
	wait(1)
	pcall(function()
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(Messages[math.random(1, #Messages)], "All")
	end)
end

queue_on_teleport([[
   loadstring(game:HttpGet("https://raw.githubusercontent.com/itztemp/Fragrance/refs/heads/main/main.lua"))()
]])

local Player = game:GetService("Players").LocalPlayer
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

function ServerSwitch()
	local _place,_id = game.PlaceId, game.JobId
	local _servers = Api.._place.."/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100"
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Servers = ListServers()
	local Server = Servers.data[math.random(1,#Servers.data)]
	TPS:TeleportToPlaceInstance(_place, Server.id, Player)
end

while true do
	ServerSwitch()
	task.wait(1)
end
