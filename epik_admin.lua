--[[
	Epik admin by Nardo#4127 / NardoSusky20
	Changelog: [
		11/4/2020: [
			Added a loaded so its less confusing :smile:
		]
	]
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local ME = Players.LocalPlayer
local Connections = {}
local CommandApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nxrdo/Atlas/master/CommandApi.lua"))()
local RoLife = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nxrdo/Atlas/master/RoLife.lua"))()
local CMDs = {}
-- // Loader \\ --
local ScreenGui = Instance.new("ScreenGui")
local Loader = Instance.new("ImageLabel")
local TopBar = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local BHolder = Instance.new("Frame")
local StatusBar = Instance.new("Frame")
local CurrentStatus = Instance.new("TextLabel")

ScreenGui.Parent = CoreGui

Loader.Name = "Loader"
Loader.Parent = ScreenGui
Loader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loader.BackgroundTransparency = 1.000
Loader.Position = UDim2.new(0.5, -180, -0.25, -80)
Loader.Size = UDim2.new(0, 360, 0, 155)
Loader.Image = "rbxassetid://3570695787"
Loader.ImageColor3 = Color3.fromRGB(30, 30, 36)
Loader.ScaleType = Enum.ScaleType.Slice
Loader.SliceCenter = Rect.new(100, 100, 100, 100)
Loader.SliceScale = 0.050

TopBar.Name = "TopBar"
TopBar.Parent = Loader
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.Size = UDim2.new(1, 0, 0, 20)
TopBar.Image = "rbxassetid://3570695787"
TopBar.ImageColor3 = Color3.fromRGB(20, 20, 26)
TopBar.ScaleType = Enum.ScaleType.Slice
TopBar.SliceCenter = Rect.new(100, 100, 100, 100)
TopBar.SliceScale = 0.050

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.Code
Title.Text = "Nardo Admin - Loader"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

BHolder.Name = "BHolder"
BHolder.Parent = Loader
BHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
BHolder.BorderSizePixel = 0
BHolder.Position = UDim2.new(0.11, 0, 0.45, 0)
BHolder.Size = UDim2.new(0.8, 0, 0, 30)

StatusBar.Name = "StatusBar"
StatusBar.Parent = BHolder
StatusBar.BackgroundColor3 = Color3.fromRGB(85, 0, 255)
StatusBar.BorderSizePixel = 0
StatusBar.Size = UDim2.new(0, 0, 1, 0)

CurrentStatus.Name = "CurrentStatus"
CurrentStatus.Parent = Loader
CurrentStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CurrentStatus.BackgroundTransparency = 1.000
CurrentStatus.Position = UDim2.new(0.1, 0, 0.8, 0)
CurrentStatus.Size = UDim2.new(0.8, 0, 0.1, 0)
CurrentStatus.Font = Enum.Font.Code
CurrentStatus.Text = ""
CurrentStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
CurrentStatus.TextScaled = true
CurrentStatus.TextSize = 14.000
CurrentStatus.TextTransparency = 0.500
CurrentStatus.TextWrapped = true

wait(1)
Loader:TweenPosition(UDim2.new(0.5, -180, 0.5, -80), "Out", "Quart", 0.25)
wait(0.5)

while not game:IsLoaded() do
	CurrentStatus.Text = "Waiting for Roblox..."
	wait(0.01)
end

if not pcall(function()
	readfile("EpikAdmin/Theme.json")
end) then
	makefolder("EpikAdmin")
	writefile("EpikAdmin/Theme.json", game:HttpGet("https://raw.githubusercontent.com/Nxrdo/Atlas/master/Theme_Api.json"))
	TweenService:Create(StatusBar, TweenInfo.new(.25), {
		Size = UDim2.new(.33, 0, 1, 0)
	}):Play()
	CurrentStatus.Text = "Writing file(s)..."
	wait(1)
else
	local Colors = HttpService:JSONDecode(readfile("EpikAdmin/Theme.json"))
	Loader.ImageColor3 = Color3.fromRGB(Colors.Main.BGColor.R, Colors.Main.BGColor.G, Colors.Main.BGColor.B)
	TopBar.ImageColor3 = Color3.fromRGB(Colors.TopBar.BGColor.R, Colors.TopBar.BGColor.G, Colors.TopBar.BGColor.B)
	StatusBar.BackgroundColor3 = Color3.fromRGB(Colors.StatusBar.BGColor.R, Colors.StatusBar.BGColor.G, Colors.StatusBar.BGColor.B)
	TweenService:Create(StatusBar, TweenInfo.new(.25), {
		Size = UDim2.new(.67, 0, 1, 0)
	}):Play()
	CurrentStatus.Text = "Initializing..."
	wait(1)
end

TweenService:Create(StatusBar, TweenInfo.new(.25), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()
CurrentStatus.Text = "Initialized!"
wait(1)
CurrentStatus.Text = "Prefix is ,"
wait(1)
Loader:TweenPosition(UDim2.new(0.5, -180, 1.25, -80), "Out", "Quart", 0.25)
wait(0.5)
ScreenGui:Destroy()
-- // CommandBar \\ --
local ScreenGui = Instance.new("ScreenGui")
local cbh = Instance.new("Frame")
local circle = Instance.new("ImageLabel")
local cmdbar = Instance.new("TextBox")
local a = Instance.new("ImageLabel")
local CMDsH = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Example = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")

cbh.Name = "cbh"
cbh.Parent = ScreenGui
cbh.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
cbh.BorderSizePixel = 0
cbh.Position = UDim2.new(-1, 0, 0.32, 0)
cbh.Size = UDim2.new(0, 200, 0, 30)

circle.Name = "circle"
circle.Parent = cbh
circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
circle.BackgroundTransparency = 1.000
circle.Position = UDim2.new(0.915, 0, 0, 0)
circle.Size = UDim2.new(0, 30, 0, 30)
circle.Image = "rbxassetid://3570695787"
circle.ImageColor3 = Color3.fromRGB(24, 24, 24)
circle.ScaleType = Enum.ScaleType.Slice
circle.SliceCenter = Rect.new(100, 100, 100, 100)

cmdbar.Name = "cmdbar"
cmdbar.Parent = cbh
cmdbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cmdbar.BackgroundTransparency = 1.000
cmdbar.Position = UDim2.new(0.0149999997, 0, 0.150000006, 0)
cmdbar.Size = UDim2.new(1, 0, 0.689999998, 0)
cmdbar.Font = Enum.Font.SourceSans
cmdbar.Text = ""
cmdbar.TextColor3 = Color3.fromRGB(180, 180, 180)
cmdbar.TextScaled = true
cmdbar.TextSize = 14.000
cmdbar.TextWrapped = true
cmdbar.TextXAlignment = Enum.TextXAlignment.Left

a.Name = "yes"
a.Parent = cbh
a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
a.BackgroundTransparency = 1.000
a.BorderSizePixel = 0
a.Position = UDim2.new(0, 0, 1.15, 0)
a.Size = UDim2.new(1, 0, 0, 0)
a.Image = "rbxassetid://4901338000"
a.ImageColor3 = Color3.fromRGB(24, 24, 24)
a.ScaleType = Enum.ScaleType.Slice
a.SliceCenter = Rect.new(100, 100, 100, 100)
a.SliceScale = 0.150

CMDsH.Name = "CMDsH"
CMDsH.Parent = a
CMDsH.Active = true
CMDsH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CMDsH.BackgroundTransparency = 1.000
CMDsH.BorderSizePixel = 0
CMDsH.Size = UDim2.new(1, 0, 0.925, 0)
CMDsH.ScrollBarImageTransparency = 1

UIListLayout.Parent = CMDsH
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UIAspectRatioConstraint.Parent = UIListLayout
UIAspectRatioConstraint.AspectRatio = 1
UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize

Example.Name = "Example"
Example.Parent = a
Example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Example.BackgroundTransparency = 1.000
Example.Size = UDim2.new(1, 0, 0, 20)
Example.Font = Enum.Font.SourceSans
Example.Text = "EXAMPLE"
Example.TextColor3 = Color3.fromRGB(180, 180, 180)
Example.TextScaled = true
Example.TextSize = 14.000
Example.TextWrapped = true
Example.TextXAlignment = Enum.TextXAlignment.Left
Example.Visible = false
pcall(function()
	ME:GetMouse().KeyDown:Connect(function(key)
		if key == CommandApi.Prefix then
			cmdbar:CaptureFocus()
			wait()
			if string.sub(cmdbar.Text, 1, string.len(CommandApi.Prefix)):lower() == tostring(CommandApi.Prefix):lower() then
				cmdbar.Text = string.sub(cmdbar.Text, string.len(CommandApi.Prefix) + 1)
			end
			cbh:TweenPosition(UDim2.new(0.005, 0, 0.32, 0), "Out", "Quart", 0.25)
			wait(0.25)
			game:GetService("TweenService"):Create(a, TweenInfo.new(.25), {
				Size = UDim2.new(1, 0, 0, 200)
			}):Play()
		end
	end)
end)

CMDsH.Changed:Connect(function()
	CMDsH.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
end)

cmdbar.FocusLost:Connect(function()
	game:GetService("TweenService"):Create(a, TweenInfo.new(.25), {
		Size = UDim2.new(1, 0, 0, 0)
	}):Play()
	wait(0.25)
	cbh:TweenPosition(UDim2.new(-1, 0, 0.32, 0), "In", "Quart", 0.25)
	CommandApi:Parse(cmdbar.Text)
end)

CMDs[#CMDs + 1] = {Name = ' ~~~~~~~~ Players ~~~~~~~~'}
CMDs[#CMDs + 1] = {Name = ' ac <server | player, name>'}
CMDs[#CMDs + 1] = {Name = ' kill <player> / k <player>'}
CMDs[#CMDs + 1] = {Name = ' lkill <player> / lk <player>'}
CMDs[#CMDs + 1] = {Name = ' goto <player>'}
CMDs[#CMDs + 1] = {Name = ' ~~~~~~~~~ Local ~~~~~~~~~'}
CMDs[#CMDs + 1] = {Name = ' antjail <on | off>'}
CMDs[#CMDs + 1] = {Name = ' billboard'}
CMDs[#CMDs + 1] = {Name = ' mute / m'}
CMDs[#CMDs + 1] = {Name = ' reset / re'}
CMDs[#CMDs + 1] = {Name = ' bypass'}
CMDs[#CMDs + 1] = {Name = ' loadtool / ltool'}
CMDs[#CMDs + 1] = {Name = ' rejoin / rj'}
CMDs[#CMDs + 1] = {Name = ' unlkill / unlk'}
CMDs[#CMDs + 1] = {Name = ' unblind'}
CMDs[#CMDs + 1] = {Name = ' ~~~~~~ Visualizers ~~~~~~'}
CMDs[#CMDs + 1] = {Name = ' bbvis <on, id | off>'}
CMDs[#CMDs + 1] = {Name = ' ~~~~~~~~~ Gears ~~~~~~~~~'}
CMDs[#CMDs + 1] = {Name = ' cloud'}
CMDs[#CMDs + 1] = {Name = ' glock'}
wait()

for i = 1, #CMDs do
	local newcmd = Example:Clone()
	newcmd.Parent = CMDsH
	newcmd.Visible = true
	newcmd.Text = CMDs[i].Name
	newcmd.Name = 'CMD'
end

cmdbar:GetPropertyChangedSignal("Text"):Connect(function()
	for _, v in pairs(CMDsH:GetChildren()) do
		if v.Name == "CMD" then
			v:Destroy()
		end
	end

	for i = 1, #CMDs do
		if string.find(CMDs[i].Name, cmdbar.Text) then
			local newcmd = Example:Clone()
			newcmd.Parent = CMDsH
			newcmd.Visible = true
			newcmd.Text = CMDs[i].Name
			newcmd.Name = "CMD"
		end
	end
end)
-- // Main Script \\ --
CommandApi:Initialize(",")
game:GetService("ReplicatedStorage").ToggleStrollers:FireServer(false)
print("Strollers Disabled")

CommandApi:AddCommand("billboard", function()
	game:GetService("ReplicatedStorage"):FindFirstChild("AvatarEditor"):FindFirstChild("HatHandle"):FireServer(14129625)
	for _, v in pairs(ME.Character:WaitForChild("14129625").Handle:GetDescendants()) do
		if v:IsA("Weld") then
			RoLife:FireServer(v:Destroy())
		end
	end
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"], "Name", "Atlas Billboard")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"], "Anchored", true)
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"]["Mesh"], "MeshId", "rbxassetid://463255802")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"]["Mesh"], "TextureId", "rbxassetid://5685481040")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"]["Mesh"], "Scale", Vector3.new(0.095, 0.15, 0.001))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"], "Position", Vector3.new(-70.515, 3974.46, 394.958))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"], "Orientation", Vector3.new(0, -150, -90))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Atlas Billboard"], "Parent", workspace)
	ME.Character["PhantomMask"]:Destroy()
	ME.Character["14129625"]:Destroy()
	game:GetService("ReplicatedStorage"):FindFirstChild("AvatarEditor"):FindFirstChild("HatHandle"):FireServer(14129625)
	for _, v in pairs(ME.Character:WaitForChild("14129625").Handle:GetDescendants()) do
		if v:IsA("Weld") then
			RoLife:FireServer(v:Destroy())
		end
	end
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"], "Name", "Effect")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"], "Anchored", true)
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"]["Mesh"], "MeshId", "rbxassetid://463255802")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"]["Mesh"], "TextureId", "rbxassetid://5685481040")
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"]["Mesh"], "Scale", Vector3.new(0.095, 0.15, 0.001))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"], "Material", Enum.Material.ForceField)
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"], "Position", Vector3.new(-70.515, 3974.46, 394.958))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"], "Orientation", Vector3.new(0, -150, -90))
	RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Effect"], "Parent", workspace["Atlas Billboard"])
	ME.Character["PhantomMask"]:Destroy()
	ME.Character["14129625"]:Destroy()
end)

CommandApi:AddCommand("bbvis", function(args)
	if args[1] == "on" then
		local max = "1850"
		spawn(function()
			while true do
				for i = 0, 100 do
					RoLife:FireServer("PompousTheCloud", ME.Character:WaitForChild("14129625")["Handle"], "Color", Color3.fromHSV(i/100, 1, 1))
				end
				wait()
			end
		end)

		game:GetService("ReplicatedStorage"):FindFirstChild("AvatarEditor"):FindFirstChild("HatHandle"):FireServer(14129625)

		RoLife:FireServer("PompousTheCloud", ME.Character:WaitForChild("14129625")["Handle"]["FaceFrontAttachment"], "Position", Vector3.new(-0.76, 1.1, 1.5))
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"]["FaceFrontAttachment"], "Orientation", Vector3.new(0, -180, -30))
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"]["Mesh"], "MeshId", "rbxassetid://212302951")
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"]["Mesh"], "TextureId", "rbxassetid://212303049")
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"]["Mesh"], "Scale", Vector3.new(4, 4, 4))
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"], "Shape", "Ball")
		RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"], "Material", "ForceField")
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "MaxDistance", "10000")
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "PlaybackSpeed", "1")
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "Volume", "10")
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "EmitterSize", "1000")
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "SoundId", "rbxassetid://" .. tonumber(args[2]))
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "Playing", true)
		ME.Character["PhantomMask"]:Destroy()

		spawn(function()
			Connections['BoomboxVis'] = game:GetService("RunService").Heartbeat:Connect(function()
				local vol = math.floor(ME.Character.PompousTheCloud.Handle.Wind.PlaybackLoudness) / max
				RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"], "Size", Vector3.new(math.random(4, 10) * vol, math.random(4, 10) * vol, math.random(4, 10) * vol))
				RoLife:FireServer("PompousTheCloud", ME.Character["14129625"]["Handle"]["Mesh"], "Scale", ME.Character["14129625"].Handle.Size)
			end)
		end)
	elseif args[1] == "off" then
		Connections['BoomboxVis']:Disconnect()
		RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"]:Pause())
		ME.Character["14129625"]:Destroy()
	end
end)

CommandApi:AddCommand("mute", {"m"}, function()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Sound") then
			v.Playing = false
		end
	end
end)

CommandApi:AddCommand("reset", {"re"}, function()
	local Pos = ME.Character.HumanoidRootPart.CFrame
	ME.Character:BreakJoints()
	ME.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15)
	ME.Character:FindFirstChildOfClass("Humanoid").Health = 0
	ME.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Pos
end)

CommandApi:AddCommand("bypass", function()
	local chatbar = nil
	for _, v in pairs(ME.PlayerGui:GetDescendants()) do
		if v.Name == "ChatBar" then
			chatbar = v
		end
	end
	RoLife:FireServer("PompousTheCloud", ME.Character["Head"]["NametagTemplate"]["TagText"], "TextColor3", Color3.fromRGB(85, 0, 255))
	RoLife:FireServer("PompousTheCloud", ME.Character["Head"]["NametagTemplate"]["TagText"], "Font", "Code")
	RoLife:FireServer("PompousTheCloud", ME.Character["Head"]["NametagTemplate"], "Size", UDim2.new(10, 0, 1, 0))
	RoLife:FireServer("PompousTheCloud", ME.Character["Head"]["NametagTemplate"], "StudsOffset", Vector3.new(-2, 2.5, 0))
	Connections['ChatBypass'] = chatbar:GetPropertyChangedSignal("Text"):Connect(function()
		RoLife:FireServer("PompousTheCloud", ME.Character["Head"]["NametagTemplate"]["TagText"], "Text", chatbar.Text)
	end)
	ME.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
		Connections['ChatBypass']:Disconnect()
	end)
end)

CommandApi:AddCommand("loadtool", {"ltool"}, function()
	for _, v in next, ME.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
		if not string.find(v.Animation.AnimationId, "180426354") then
			v:Stop()
		end
	end
	RoLife:FireServer("PompousTheCloud", ME.Character:FindFirstChild("PompousTheCloud")["Handle"]["Mesh"], "MeshId", "rbxassetid://0")
end)

CommandApi:AddCommand("ac", function(args)
	if args[1] == "server" then
		workspace.GuiEvent:FireServer(".")
		RoLife:FireServer("PompousTheCloud", ME.Character:WaitForChild(".")["."], "Name", "StarterHumanoid")
		RoLife:FireServer("PompousTheCloud", ME.Character["."]["StarterHumanoid"], "Parent", game:GetService("StarterPlayer"))
		ME.Character["."]:Destroy()
	elseif args[1] == "player" then
		for _, v in pairs(RoLife:GetPlayers(args[2])) do
			workspace.GuiEvent:FireServer(v.Name)
			RoLife:FireServer("PompousTheCloud", ME.Character:WaitForChild(v.Name), "Parent", workspace)
			RoLife:FireServer("PompousTheCloud", ME.Character["Head"], "Transparency", 0)
		end
	end
end)

CommandApi:AddCommand("cloud", function()
	if not ME.Backpack:FindFirstChild("PompousTheCloud") then
		workspace.GiveTool:FireServer(getgenv().GamepassId, "PompousTheCloud")
	else
		ME.Backpack:FindFirstChild("PompousTheCloud").Parent = ME.Character
		ME.Character:WaitForChild("PompousTheCloud"):Destroy()
		workspace.GiveTool:FireServer(getgenv().GamepassId, "PompousTheCloud")
	end
end)

CommandApi:AddCommand("kill", {"k"}, function(args)
	for _, v in pairs(RoLife:GetPlayers(args[1])) do
		ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = true })
		if v.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "Torso")
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"]:FindFirstChild("Weld"):Destroy())
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "CanCollide", false)
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "Parent", v.Character)
			ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = false })
		else
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "UpperTorso")
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"]:FindFirstChild("Weld"):Destroy())
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"], "CanCollide", false)
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"], "Parent", v.Character)
			ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = false })
		end
	end
end)

CommandApi:AddCommand("lkill", "lk", function(args)
	for _, v in pairs(RoLife:GetPlayers(args[1])) do
		Connections.lkill = true
		while Connections.lkill do
			ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = true })
			if v.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "Torso")
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"]:FindFirstChild("Weld"):Destroy())
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "CanCollide", false)
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "Parent", v.Character)
			else
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "UpperTorso")
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"]:FindFirstChild("Weld"):Destroy())
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"], "CanCollide", false)
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"], "Parent", v.Character)
			end
			wait()
		end
	end
end)

CommandApi:AddCommand("unlkill", {"unlk"}, function()
	Connections.lkill = false
	ME.Character:FindFirstChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = false })
end)

CommandApi:AddCommand("goto", function(args)
	for _, v in pairs(RoLife:GetPlayers(args[1])) do
		ME.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Character.HumanoidRootPart.CFrame
	end
end)

CommandApi:AddCommand("unblind", function()
	for _, v in pairs(ME.PlayerGui:GetDescendants()) do
		if v:IsA("TextLabel") then
			v:Destroy()
		end
	end
end)

CommandApi:AddCommand("glock", function()
	ME.Backpack:FindFirstChild("PompousTheCloud").Parent = ME.Character
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Mesh"], "MeshId", "rbxassetid://5082833624")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Mesh"], "TextureId", "rbxassetid://5082836430")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Mesh"], "Scale", Vector3.new(1, 1, 1))
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Mesh"], "Offset", Vector3.new(0, 0, 0))
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["LocalScript"], "Disabled", true)

	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "GripForward", Vector3.new(0, 0, 1))
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "GripPos", Vector3.new(0, -0.25, -0.07))
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "GripRight", Vector3.new(-1, 0, 0))
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "GripUp", Vector3.new(0, 1, 0))

	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "MaxDistance", "100000")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "PlaybackSpeed", "1")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "Volume", "1")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "EmitterSize", "1000")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Wind"], "SoundId", "rbxassetid://240718012")

	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "ToolTip", "Glock-18")
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "CanBeDropped", true)
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"], "Name", "Glock-18")
	wait()
	local Mouse = ME:GetMouse()

	ME:GetMouse().Button1Down:Connect(function()
		if ME.Character:FindFirstChild("Glock-18") then
			if Mouse.Target.Parent:FindFirstChild("Head") or Mouse.Target.Parent:FindFirstChild("HumanoidRootPart") then
				local Anim = Instance.new("Animation")
				Anim.AnimationId = "rbxassetid://95383980"
				local AnimLoader = ME.Character:FindFirstChild("Humanoid"):LoadAnimation(Anim)
				AnimLoader:Play()
				AnimLoader:AdjustSpeed(1)
				game:GetService("ReplicatedStorage"):FindFirstChild("AvatarEditor"):FindFirstChild("HatHandle"):FireServer(14129625)
				if Mouse.Target.Parent.Humanoid.RigType == Enum.HumanoidRigType.R6 then
					RoLife:FireServer("Glock-18", ME.Character:WaitForChild("14129625")["Handle"]["Mesh"], "MeshId", "0")
					RoLife:FireServer("Glock-18", ME.Character["14129625"]["Handle"], "Name", "Torso")
					RoLife:FireServer("Glock-18", ME.Character["14129625"]["Torso"], "Parent", Mouse.Target.Parent)
					ME.Character["14129625"]:Destroy()
					ME.Character["PhantomMask"]:Destroy()
					RoLife:FireServer("Glock-18", ME.Character["Glock-18"]["Handle"]["Wind"], "Playing", true)
					wait(1)
					RoLife:FireServer("Glock-18", ME.Character["Glock-18"]["Handle"]["Wind"]:Pause())
				else
					RoLife:FireServer("Glock-18", ME.Character:WaitForChild("14129625")["Handle"]["Mesh"], "MeshId", "0")
					RoLife:FireServer("Glock-18", ME.Character["14129625"]["Handle"], "Name", "UpperTorso")
					RoLife:FireServer("Glock-18", ME.Character["14129625"]["UpperTorso"], "Parent", Mouse.Target.Parent)
					ME.Character["14129625"]:Destroy()
					ME.Character["PhantomMask"]:Destroy()
					RoLife:FireServer("Glock-18", ME.Character["Glock-18"]["Handle"]["Wind"], "Playing", true)
					wait(1)
					RoLife:FireServer("Glock-18", ME.Character["Glock-18"]["Handle"]["Wind"]:Pause())
				end
			end
		end
	end)
end)

CommandApi:AddCommand("antijail", function(args)
	if args[1] == "on" then
		function Antijail()
			local Hats = {}
			for _, v in pairs(ME.Charater:GetDescendants()) do
				if v:IsA("Accessory") then
					Hats[v.Name] = true
				end
			end
			Connections['Antijail'] = ME.Character.DescendantAdded:Connect(function(v)
				for _, v in pairs(ME.Character:GetDescendants()) do
					if v:IsA("Accessory") and not Hats[v.Name] then
						v:Destroy()
					end
				end
			end)
		end

		Antijail()
	elseif args[1] == "off" then
		Connections['Antijail']:Disconnect()
		Connections['Antijail'] = nil
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Font = Enum.Font.SourceSans,
			Text = "Antijail Inactive",
			Color = Color3.fromRGB(255, 255, 255)
		})
	end
end)

CommandApi:AddCommand("rejoin", {"rj"}, function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
