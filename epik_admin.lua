--[[
	Epik admin by Nardo#4127 / NardoSusky20
	Changelog: [
		Nothing to see here :smile:
	]
]]

local Players = game:GetService("Players")
local ME = Players.LocalPlayer
local Connections = {}
local CommandApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nxrdo/Atlas/master/CommandApi.lua"))()
local RoLife = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nxrdo/Atlas/master/RoLife.lua"))()
local CMDs = {}
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

CMDs[#CMDs + 1] = {Name = ' billboard'}
CMDs[#CMDs + 1] = {Name = ' bbvis <on, id | off>'}
CMDs[#CMDs + 1] = {Name = ' mute / m'}
CMDs[#CMDs + 1] = {Name = ' reset / re'}
CMDs[#CMDs + 1] = {Name = ' bypass'}
CMDs[#CMDs + 1] = {Name = ' loadtool / ltool'}
CMDs[#CMDs + 1] = {Name = ' ac <server | player, name>'}
CMDs[#CMDs + 1] = {Name = ' cloud'}
CMDs[#CMDs + 1] = {Name = ' kill <player> / k <player>'}
CMDs[#CMDs + 1] = {Name = ' rejoin / rj'}
CMDs[#CMDs + 1] = {Name = ' lkill <player> / lk <player>'}
CMDs[#CMDs + 1] = {Name = ' unlkill / unlk'}
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
	RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Handle"]["Mesh"], "MeshId", "rbxassetid://0")
end)

CommandApi:AddCommand("ac", function(args)
	if args[1] == "server" then
		workspace.GuiEvent:FireServer(".")
		RoLife:FireServer("PompousTheCloud", ME.Character:WaitForChild(".")["."], "Name", "StarterHumanoid")
		RoLife:FireServer("PompousTheCloud", ME.Character["."]["StarterHumanoid"], "Parent", game:GetService("StarterPlayer"))
	end
end)

CommandApi:AddCommand("cloud", function()
	ME.Backpack:FindFirstChild("PompousTheCloud").Parent = ME.Character
	ME.Character:WaitForChild("PompousTheCloud"):Destroy()
	workspace.GiveTool:FireServer(1798417, "PompousTheCloud")
end)

CommandApi:AddCommand("kill", {"k"}, function(args)
	for _, v in pairs(RoLife:GetPlayers(args[1])) do
		ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = true })
		if v.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "Torso")
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"]:FindFirstChild("Weld"):Destroy())
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "Parent", v.Character)
			ME.Character:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", { Flying = false })
		else
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "UpperTorso")
			RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"]:FindFirstChild("Weld"):Destroy())
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
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["Torso"], "Parent", v.Character)
			else
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]:WaitForChild("EffectCloud"), "Name", "UpperTorso")
				RoLife:FireServer("PompousTheCloud", ME.Character["PompousTheCloud"]["UpperTorso"]:FindFirstChild("Weld"):Destroy())
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

CommandApi:AddCommand("rejoin", {"rj"}, function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
