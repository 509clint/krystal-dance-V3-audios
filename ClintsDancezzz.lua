--Clints Dancezzz V6.7

local OWNER_TAG_PLAYERS = {
    ["Passhihihi_456"] = true,
}

local function applyOwnerTag(character)
    local head = character:WaitForChild("Head")
    if head:FindFirstChild("OwnerTag") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "OwnerTag"
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Clint"
    label.TextColor3 = Color3.fromRGB(255, 215, 0)
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.Parent = billboard
end

local function addOwnerTag(player)
    if player.Character then applyOwnerTag(player.Character) end
    player.CharacterAdded:Connect(function(character)
        applyOwnerTag(character)
    end)
end

local ownerTagPlayers = game:GetService("Players")

for _, player in ipairs(ownerTagPlayers:GetPlayers()) do
    if OWNER_TAG_PLAYERS[player.Name] then
        task.spawn(addOwnerTag, player)
    end
end

ownerTagPlayers.PlayerAdded:Connect(function(player)
    if OWNER_TAG_PLAYERS[player.Name] then
        task.spawn(addOwnerTag, player)
    end
end)

task.spawn(function()
    while true do
        task.wait(5)
        for _, player in ipairs(ownerTagPlayers:GetPlayers()) do
            if OWNER_TAG_PLAYERS[player.Name] then
                local char = player.Character
                if char then
                    local head = char:FindFirstChild("Head")
                    if head and not head:FindFirstChild("OwnerTag") then
                        applyOwnerTag(char)
                    end
                end
            end
        end
    end
end)

local BLACKLIST = {
    ["agathaedavi24"] = true,
}

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

if BLACKLIST[lp.Name:lower()] or BLACKLIST[lp.Name] then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Clints Dancezzz",
            Text = "Blacklisted. Reason: clanker",
            Duration = 10
        })
    end)

    task.wait(2)

    while true do
        task.wait(9e9)
    end
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local changeLogData = {
    {
        date = "Current Version",
        items = {
            "Adjusted Changelog GUI Size"
        }
    },
    {
        date = "Previous Update",
        items = {
            "Added Slickback"
        }
    },
    {
        date = "Release",
        items = {
            "- Added Summer dance mapped to Page 3 (B Key)",
            "- Configured automated stop-motion frame lock",
            "- Linked GitHub audio repository pipeline"
        }
    }
}

--// Core ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChangeLogGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 460, 0, 320)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local headerTitle = Instance.new("TextLabel")
headerTitle.Name = "HeaderTitle"
headerTitle.Size = UDim2.new(1, 0, 0, 55)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = "Welcome To Clints Dancezzz!"
headerTitle.TextColor3 = Color3.new(1, 1, 1)
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 24
headerTitle.Parent = mainFrame

local headerDivider = Instance.new("Frame")
headerDivider.Name = "Divider"
headerDivider.Size = UDim2.new(1, 0, 0, 1)
headerDivider.Position = UDim2.new(0, 0, 0, 55)
headerDivider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
headerDivider.BorderSizePixel = 0
headerDivider.Parent = mainFrame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "LogScroller"
scrollFrame.Size = UDim2.new(1, -18, 1, -120)
scrollFrame.Position = UDim2.new(0, 12, 0, 65)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
scrollFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 20)
listLayout.Parent = scrollFrame

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

for i, logData in ipairs(changeLogData) do
    local entryFrame = Instance.new("Frame")
    entryFrame.Name = "Entry_" .. i
    entryFrame.Size = UDim2.new(1, -10, 0, 0)
    entryFrame.BackgroundTransparency = 1
    entryFrame.Parent = scrollFrame
    
    local entryLayout = Instance.new("UIListLayout")
    entryLayout.SortOrder = Enum.SortOrder.LayoutOrder
    entryLayout.Padding = UDim.new(0, 4)
    entryLayout.Parent = entryFrame
    
    entryLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        entryFrame.Size = UDim2.new(1, -10, 0, entryLayout.AbsoluteContentSize.Y)
    end)

    local dateLabel = Instance.new("TextLabel")
    dateLabel.Name = "Date"
    dateLabel.Size = UDim2.new(1, 0, 0, 26)
    dateLabel.BackgroundTransparency = 1
    dateLabel.Text = logData.date
    dateLabel.TextColor3 = Color3.new(1, 1, 1)
    dateLabel.Font = Enum.Font.GothamBold
    dateLabel.TextSize = 17 
    dateLabel.TextXAlignment = Enum.TextXAlignment.Left
    dateLabel.LayoutOrder = 1
    dateLabel.Parent = entryFrame

    for j, itemText in ipairs(logData.items) do
        local bulletLabel = Instance.new("TextLabel")
        bulletLabel.Name = "Bullet_" .. j
        bulletLabel.Size = UDim2.new(1, 0, 0, 18)
        bulletLabel.BackgroundTransparency = 1
        bulletLabel.Text = "  " .. itemText
        bulletLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
        bulletLabel.Font = Enum.Font.GothamMedium
        bulletLabel.TextSize = 13
        bulletLabel.TextXAlignment = Enum.TextXAlignment.Left
        bulletLabel.LayoutOrder = j + 1
        bulletLabel.Parent = entryFrame
    end
end

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(1, -24, 0, 45)
closeButton.Position = UDim2.new(0, 12, 1, -57)
closeButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
closeButton.Text = "Close"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.AutoButtonColor = false
closeButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = closeButton

local normalSize = closeButton.Size
local pressedSize = UDim2.new(normalSize.X.Scale, normalSize.X.Offset - 6, normalSize.Y.Scale, normalSize.Y.Offset - 3)

local tweenDown = TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenUp = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

closeButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        TweenService:Create(closeButton, tweenDown, {Size = pressedSize, BackgroundColor3 = Color3.fromRGB(42, 42, 42)}):Play()
    end
end)

closeButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        TweenService:Create(closeButton, tweenUp, {Size = normalSize, BackgroundColor3 = Color3.fromRGB(48, 48, 48)}):Play()
    end
end)

local guiIsActive = true

closeButton.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    
    closeTween:Play()
    closeTween.Completed:Connect(function()
        screenGui:Destroy()
        guiIsActive = false
    end)
end)

while guiIsActive do
    task.wait(0.1)
end

task.spawn(function()
    while true do
        pcall(function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local animate = character:FindFirstChild("Animate")
            if animate then
                animate.climb.ClimbAnim.AnimationId = "rbxassetid://119545916455209"
                animate.fall.FallAnim.AnimationId   = "rbxassetid://119545916455209"
                animate.idle.Animation1.AnimationId = "rbxassetid://98946450554814"
                animate.idle.Animation2.AnimationId = "rbxassetid://98946450554814"
                animate.jump.JumpAnim.AnimationId   = "rbxassetid://119545916455209"
                animate.run.RunAnim.AnimationId     = "rbxassetid://119545916455209"
                animate.walk.WalkAnim.AnimationId   = "rbxassetid://119545916455209"
            end
        end)
        task.wait(0.5)
    end
end)
local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/luxorious.lua")
if s and #content > 10 then
    writefile("luxorious.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/rat%20dance.lua")
if s and #content > 10 then
    writefile("rat dance.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/assumptions.lua")
if s and #content > 10 then
    writefile("assumptions.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/hit%20the%20griddy.lua")
if s and #content > 10 then
    writefile("hit the griddy.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/popipo%20thing.lua")
if s and #content > 10 then
    writefile("popipo thing.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/mesmerizer.lua")
if s and #content > 10 then
    writefile("mesmerizer.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/gangnam.lua")
if s and #content > 10 then
    writefile("gangnam.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/boppin.lua")
if s and #content > 10 then
    writefile("boppin.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/dance%20of%20nights.lua")
if s and #content > 10 then
    writefile("dance of nights.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/goopie.lua")
if s and #content > 10 then
    writefile("goopie.lua", content)
end

local s, content = pcall(game.HttpGet, game, "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/jaxy%20toy.lua")
if s and #content > 10 then
    writefile("jaxy toy.lua", content)
end
--[[local s, content = pcall(game.HttpGet, game, "")
if s and #content > 10 then
    writefile("", content)
end]]
-- https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/jaxy%20toy.lua
game.StarterGui:SetCore("SendNotification",{
        Title = "Clints Dancezzz";
        Text = "Discord Invite Copied!";
        Duration = 3;
    })
    game.StarterGui:SetCore("SendNotification",{
        Title = "Clints Dancezz";
        Text = "Join the discord For more help [its on ur clipboard]";
        Duration = 3;
    })
	    game.StarterGui:SetCore("SendNotification",{
        Title = "Clints Dancezz";
        Text = "Giveaway at 200 Members!";
        Duration = 5;
    })

local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local character
local humanoid
local head
local rootPart

local function setupCharacter(char)
	character = char
	humanoid = character:WaitForChild("Humanoid")
	head = character:WaitForChild("Head")
	rootPart = character:WaitForChild("HumanoidRootPart")

	camera.CameraSubject = humanoid
end

setupCharacter(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(setupCharacter)

RunService.RenderStepped:Connect(function(dt)
	if not character or not humanoid or not head then
		return
	end

	if humanoid.Health <= 0 then
		return
	end

	local targetOffset = rootPart.CFrame:PointToObjectSpace(head.Position)
	targetOffset = targetOffset + Vector3.new(0, -1.5, 0)
	local alpha = math.clamp(dt * 12, 0, 1)

	humanoid.CameraOffset = humanoid.CameraOffset:Lerp(targetOffset, alpha)
end)

local bgMusicUrl = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/CreoSphere.mp3"
local bgMusicFile = "CreoSphere.mp3"
local discordLink = "https://discord.gg/UwcACBuJb5"
local page1Dances = {
    Q = {
        name = "Rat Dance", 
        id = "rbxassetid://126123959691270", 
        isRandom = true,
        audios = {
            {name = "Chess Type Beat", file = "ratdance.mp3", url = "https://raw.githubusercontent.com/HarcangiRobloxProjects/Songsformusicplayer/main/Chess%20Type%20Beat%20_%20joyful%20-%20chess%20(slowed).mp3"},
            {name = "Matchmaker", file = "matchmaker.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/matchmaker.mp3"}
        }
    },
    E = {name = "Boogie Down", musicName = "Boogie", id = "rbxassetid://115461522815450", file = "boogiedown.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/boogie.mp3", playbackSpeed = 2.0},
    R = {name = "Assumptions", musicName = "Assumptions", id = "rbxassetid://86800672185924", file = "assumptions.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/assumptions.mp3"},
    T = {name = "Hakari", musicName = "lonely remix", id = "rbxassetid://122147154162464", file = "Clint_Lonely.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Clint_Lonely.mp3"},
    Y = {name = "Doodle", musicName = "Doodle", id = "rbxassetid://93191191685066", file = "doodle.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/doodle.mp3"},
    U = {name = "Carmell", musicName = "Caramelldansen", id = "rbxassetid://92900132509399", file = "carmell.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/caramell.mp3"},
    P = {name = "Gangnam Style", musicName = "Gangnam Style", jsonFile = "gangnam.lua", file = " oppa gangnam styole.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/oppa%20gangnam%20styole.mp3"},
    F = {name = "Jumpstyle", musicName = "FALL FROM THE SKY PT2", id = "rbxassetid://85528043259864", file = "jumpstyle.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Jumpstyle.mp3"},
    G = {name = "Zacon Noob", musicName = "Zacon Noob", id = "rbxassetid://128361350157303", file = "bacon noob.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/bacon%20noob.MP3"},
    H = {name = "Monster Mash", musicName = "Monster Mash", id = "rbxassetid://107864975312860", file = "monstermash.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/monstermash.mp3"},
    J = {name = "Bang Bang Bang", musicName = "Bang Bang Bang", id = "rbxassetid://108637462377816", file = "bangbangbang.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/bangbangbang.MP3"},
    K = {name = "Criss Cross", musicName = "Criss Cross", id = "rbxassetid://119524559800928", file = "CrissCross.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/CrissCross.mp3"},
    L = {name = "Luxorious", jsonFile = "luxorious.lua", musicName = "e", id = "rbxassetid://132151459316300", file = "Lux.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Lux.mp3"},
    Z = {name = "Headlock", musicName = "Headlock", id = "rbxassetid://125201240575195", file = "headlock.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/headlock.MP3"},
    X = {name = "Egypt", musicName = "Prince Of Egypt", id = "rbxassetid://91860601534533", file = "Egypt.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Egypt.mp3"},
    C = {name = "Mannrobics", musicName = "Mannrobics", id = "rbxassetid://96207177690619", file = "trolled.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/trolled.mp3"},
    V = {name = "Jax Toy", musicName = "Jax Toy", jsonFile = "jaxy toy.lua", file = "Jax toy.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Jax%20toy.mp3"},
    B = {name = "Teto Thing", musicName = "None", id = "rbxassetid://131645522112785"},
    N = {name = "Bloodpop", musicName = "Bloodpop", id = "rbxassetid://107613144426609", file = "bloodpop.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/bloodpop.mp3"}
}

local page2Dances = {
    Q = {name = "Kai Cenat and Speed Jumping", musicName = "Speed Jumping", id = "rbxassetid://94039662497944", file = "speedjumping.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/speedjumping.mp3"},
    E = {name = "Default", musicName = "Default Dance / Dance Moves", id = "rbxassetid://99818263438846", file = "default.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/default.mp3"},
    R = {name = "Smug", musicName = "Smug", id = "rbxassetid://73509049289746", file = "Smug.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Smug.mp3"},
    T = {name = "Rat Dance 2", id = "rbxassetid://89132118681685", animSpeed = 1.6, isRandom = true, audios = {{name = "Chess Type Beat", file = "ratdance.mp3", url = "https://raw.githubusercontent.com/HarcangiRobloxProjects/Songsformusicplayer/main/Chess%20Type%20Beat%20_%20joyful%20-%20chess%20(slowed).mp3"}, {name = "Matchmaker", file = "matchmaker.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/matchmaker.mp3"}}},
    Y = {name = "DoD Gangnam Style", musicName = "Gangnam Style [Die of death]", id = "rbxassetid://118329687900633", file = "DODstyle.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/DODstyle.mp3"},
    U = {name = "Goopie", musicName = "Goopie", jsonFile = "goopie.lua", file = "Goopie.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Goopie.mp3"},
    P = {name = "Sponge Shuffle", musicName = "Sponge Shuffle", id = "rbxassetid://107899954696611", file = "spongeshuffle.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/spongeshuffle.mp3"},
    F = {name = "Low Quality", musicName = "Low Quality", id = "rbxassetid://98724385720280", file = "lowquality.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/LowQuality.mp3"},
    G = {name = "I Just Hit The JACKPOT!", musicName = "Jackpot", id = "rbxassetid://123907974136413", file = "jackpot.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/jackpot.mp3", animSpeed = 0.8},
    H = {name = "PoPiPo", jsonFile = "popipo thing.lua", musicName = "PoPiPo", id = "rbxassetid://134221936510464", file = "PoPiPo.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/PoPiPo.mp3"},
    J = {name = "Backflips", musicName = "Backflips", id = "rbxassetid://105695373357201", file = "Backflips.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Backflips.mp3"},
    K = {name = "Kazotsky Kick", musicName = "Kazotsky Kick", id = "rbxassetid://116194753625255", file = "kazotskykick.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/kazotskykick.mp3"},
    L = {name = "Birdbrain", id = "rbxassetid://105730788757021", isRandom = true, audios = {{name = "Birdbrain 2", file = "Birdbrain2.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Birdbrain2.mp3"}, {name = "Birdbrain Alt", file = "BirdbrainAlt.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/BirdbrainAlt.mp3"}}},
    Z = {name = "Rambunctious", musicName = "Rambunctious", id = "rbxassetid://108128682361404", file = "Rambunctious.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Rambunctious.mp3"},
    X = {name = "Distraction", musicName = "Distraction", id = "rbxassetid://128915952289810", file = "Distraction.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Distraction.mp3"},
    V = {name = "Rat Dance 3", jsonFile = "rat dance.lua", isRandom = true, audios = {{name = "Chess Type Beat", file = "ratdance.mp3", url = "https://raw.githubusercontent.com/HarcangiRobloxProjects/Songsformusicplayer/main/Chess%20Type%20Beat%20_%20joyful%20-%20chess%20(slowed).mp3"}, {name = "Matchmaker", file = "matchmaker.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/matchmaker.mp3"}}},
    C = {name = "Bumblebee", musicName = "Bumblebee", id = "rbxassetid://80250164135615", file = "Bumblebee.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Bumblebee.mp3"},
    N = {name = "California", musicName = "California", id = "rbxassetid://84430246447182", file = "California.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/California.mp3"}
}

local page3Dances = {
    Q = {name = "Civilian Yell", musicName = "Civilian Yell", id = "rbxassetid://126080612954274", file = "CivilianYell.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/CivillianYell.mp3"},
    E = {name = "Griddy", jsonFile = "hit the griddy.lua", musicName = "Griddy", id = "rbxassetid://75519433871034", file = "Griddy.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Griddy.mp3"},
    R = {name = "Torture Dance", musicName = "Torture Dance", id = "rbxassetid://76119197893969", file = "TortureDance.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/TortureDance.mp3"},
    T = {name = "Low Cortisol", musicName = "Low Cortisol", id = "rbxassetid://88446038474334", file = "LowCortisol.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/LowCortisol.mp3"},
    Y = {name = "Tenna", musicName = "Tenna", id = "rbxassetid://118637631357001", file = "Tenna.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Tenna.mp3", animSpeed = 2},
    U = {name = "Miss Me", musicName = "Miss Me", id = "rbxassetid://102114333368524", file = "MissMe.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/MissMe.mp3"},
    P = {name = "Headlock", musicName = "Headlock", id = "rbxassetid://121475803084040", file = "Headlock2.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Headlock2.mp3"},
    F = {name = "Sit", musicName = "Sit", id = "rbxassetid://86588737455577", file = "sit.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/sit.mp3"},
    G = {name = "Boombox", musicName = "Boombox", id = "rbxassetid://100233037365988", file = "boomin.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/boomin.mp3"},
    H = {name = "Take The L", musicName = "Take The L (Dubmood)", id = "rbxassetid://134996555170259", file = "TakeTheLDubmood.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/TakeTheLDubmood.mp3"},
    J = {name = "Tryna", musicName = "Tryna", id = "rbxassetid://97313703484279", file = "tryna.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/tryna.mp3", animSpeed = 0.8},
    K = {name = "C14", musicName = "C14", id = "rbxassetid://72178400904090", file = "C14.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/C14.mp3"},
    L = {name = "Metro", musicName = "Metro", id = "rbxassetid://136271269847411", file = "Metro.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Metro.mp3"},
    Z = {name = "Subject Three", musicName = "a", id = "rbxassetid://111993447655346", file = "SubjectThree.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/SubjectThree.mp3"},
    X = {name = "Checking", musicName = "Checking", id = "rbxassetid://120729591181174", file = "checking.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/checking.mp3"},
    C = {name = "Phibz", musicName = "Phibz", id = "rbxassetid://91723508442884", file = "phibz.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/phibz.mp3"},
    V = {name = "The Hero", musicName = "The Hero", id = "rbxassetid://71032247715580", file = "The Hero.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/The%20Hero.mp3"},
    B = {name = "Summer", musicName = "Summer", id = "rbxassetid://82461557511288", file = "Summer.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Summer.mp3"},
    N = {name = "Umamusume Jukebox", musicName = "None", id = "rbxassetid://79237232926594", file = "", url = ""},
}

local page4Dances = {
    Q = { name="Kwik Flip",  musicName="Kiwik Flip", id="rbxassetid://78225140245993",  animSpeed=1.38, file="kiwikflip.mp3",   url="https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/kiwikflip.MP3" },
    E = { name="Slickback",  musicName="Slickback",  id="rbxassetid://103789826265487",              file="Slickback.mp3",   url="https://raw.githubusercontent.com/509clint/krystal-dance-V3-audios/main/Slickback.mp3" },
    R = { name="Bille Jean", musicName="Billie Jean",id="rbxassetid://79081741493045",               file="Bjean.mp3",       url="https://github.com/Solary-3/Scripts/raw/refs/heads/Audios-1/Bjean.mp3" },
    T = { name="Mesmerizer", musicName="Mesmerizer", jsonFile = "mesmerizer.lua", file="Mesmerizer.mp3", url="https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/Mesmerizer.mp3" },
    Y = { name="Assumptions Shuffle", jsonFile = "assumptions.lua", musicName="idk man", file="assum.mp3", url="https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/assum.mp3" },
    U = { name="Boppin", jsonFile = "boppin.lua", musicName = "Boppin", file = "boppin.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/boppin.mp3" },
    P = { name="Dance of Nights", jsonFile = "dance of nights.lua", musicName = "Dance of Nights", file = "dance of nights.mp3", url = "https://github.com/509clint/krystal-dance-V3-audios/raw/refs/heads/main/dance%20of%20nights.mp3"},
}

local currentTrack, currentSound, backgroundSound = nil, nil, nil
local isPlaying = false
local savedTimestamp = 0
local activeDanceKey = nil
local currentPage = 1
local baseFOV = 70
local DANCE_WALKSPEEDS = {
    ["Griddy"] = 5,
    ["Mannrobics"] = 5,
    ["Sit"] = 0,
    ["Rat Dance"] = 5,
    ["Rat Dance 2"] = 10,
    ["Rat Dance 3"] = 5,
    ["Default"] = 5,
    ["Teto Thing"] = 5,
    ["Criss Cross"] = 5,
    ["Luxorious"] = 5,
    ["Gangnam Style"] = 5,
    ["Jax Toy"] = 5,
    ["Sponge Shuffle"] = 5,
    ["Rambunctious"] = 5,
    ["Miss Me"] = 5,
    ["The Hero"] = 10,
    ["Kwik Flip"] = 5,
    ["Bille Jean"] = 10,
    ["Assumptions Shuffle"] = 10,
}

RunService.RenderStepped:Connect(function()
    local targetFOV = baseFOV
    if isPlaying and currentSound then
        local loudness = currentSound.PlaybackLoudness
        local kick = (loudness / 100) * 1.5
        targetFOV = baseFOV - kick
    end

    camera.FieldOfView = camera.FieldOfView + (targetFOV - camera.FieldOfView) * 0.25
end)

if not isfile(bgMusicFile) then
    local s, content = pcall(game.HttpGet, game, bgMusicUrl)
    if s and #content > 1000 then writefile(bgMusicFile, content) end
end

backgroundSound = Instance.new("Sound")
backgroundSound.SoundId = (isfile(bgMusicFile) and getcustomasset(bgMusicFile)) or ""
backgroundSound.Volume = 0.5
backgroundSound.Looped = true
backgroundSound.Parent = SoundService
backgroundSound:Play()

local function notify(title, text)
    StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 3})
end



local function anim2track(asset_id)
    local success, objs = pcall(function() return game:GetObjects(asset_id) end)
    if success and objs and objs[1] then
        for i = 1, #objs do
            if objs[i]:IsA("Animation") then return objs[i].AnimationId end
        end
    end
    return asset_id
end
local HttpService = game:GetService("HttpService")
local activeJsonPlayback = false
local forceStopJsonPlayback = false
local jsonPlaybackConnection = nil

local function playJsonAnimation(jsonFile, animSpeedOverride, shouldLoop)
    if not isfile(jsonFile) then
        notify("Clints Dancezzz", "JSON file not found: " .. jsonFile)
        return
    end

    local success, decoded = pcall(function()
        return HttpService:JSONDecode(readfile(jsonFile))
    end)
    if not success or not decoded then
        notify("Clints Dancezzz", "Failed to read JSON: " .. jsonFile)
        return
    end

    local savedData = decoded
    local animSpeed = animSpeedOverride or 1.0
    local isLooping = (shouldLoop == nil) and true or shouldLoop

    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    -- Disable Animate and stop existing tracks
    if char:FindFirstChild("Animate") then
        char.Animate.Disabled = true
    end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    if animator then
        for _, t in pairs(animator:GetPlayingAnimationTracks()) do t:Stop(0) end
    end

    -- Build joint map
    local joints = {}
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("Motor6D") then joints[v.Name] = v end
    end

    -- Count total frames
    local totalFrames = 0
    for k, _ in pairs(savedData) do
        local n = tonumber(k) or 0
        if n > totalFrames then totalFrames = n end
    end
    if totalFrames == 0 then return end

    -- Build timeline
    local timelineMarks = {}
    local currentTotalTime = 0
    for i = 1, totalFrames do
        local frameData = savedData[tostring(i)]
        local fTime = frameData and frameData["_FrameTime"] or (1/60)
        timelineMarks[i] = currentTotalTime
        currentTotalTime = currentTotalTime + fTime
    end
    local totalAnimDuration = currentTotalTime

    activeJsonPlayback = true
    forceStopJsonPlayback = false

    local function tableToCf(t)
        return CFrame.new(table.unpack(t))
    end

    task.spawn(function()
        -- Detach animator so it doesn't fight us
        local animatorParent = animator and animator.Parent
        if animator then animator.Parent = nil end

        local initialPlaybackCF = root.CFrame

        repeat
            local elapsedTime = 0
            initialPlaybackCF = root.CFrame

            while elapsedTime < totalAnimDuration and not forceStopJsonPlayback do
                local dt = RunService.Heartbeat:Wait()
                elapsedTime = elapsedTime + (dt * animSpeed)

                local frameA_Index = 1
                local frameB_Index = 1
                for i = 1, totalFrames - 1 do
                    if elapsedTime >= timelineMarks[i] and elapsedTime <= timelineMarks[i+1] then
                        frameA_Index = i
                        frameB_Index = i + 1
                        break
                    end
                end
                if elapsedTime >= timelineMarks[totalFrames] then
                    frameA_Index = totalFrames
                    frameB_Index = totalFrames
                end

                local dataA = savedData[tostring(frameA_Index)]
                local dataB = savedData[tostring(frameB_Index)]

                if dataA and dataB then
                    local timeA = timelineMarks[frameA_Index]
                    local timeB = timelineMarks[frameB_Index]
                    local alpha = 0
                    if timeB - timeA > 0 then
                        alpha = (elapsedTime - timeA) / (timeB - timeA)
                    end
                    alpha = math.clamp(alpha, 0, 1)
                    for jName, jointInstance in pairs(joints) do
                        if jointInstance and jointInstance.Parent then
                            local tA = dataA[jName]
                            local tB = dataB[jName]
                            if tA and tB then
                                jointInstance.Transform = tableToCf(tA):Lerp(tableToCf(tB), alpha)
                            elseif tA then
                                jointInstance.Transform = tableToCf(tA)
                            end
                        end
                    end
                end
            end
        until not isLooping or forceStopJsonPlayback

        if animator then animator.Parent = animatorParent end
        activeJsonPlayback = false
        forceStopJsonPlayback = false
    end)
end

local function stopJsonAnimation()
    if activeJsonPlayback then
        forceStopJsonPlayback = true
    end
end
local function stopAll()
     if currentTrack then currentTrack:Stop() currentTrack:Destroy() currentTrack = nil end
    if currentSound then currentSound:Stop() currentSound:Destroy() currentSound = nil end
    if activeJsonPlayback then
        forceStopJsonPlayback = true
        local timeout = 0
        repeat task.wait(0.05) timeout += 0.05 until not activeJsonPlayback or timeout >= 0.1
    end
    stopJsonAnimation()
    isPlaying = false
    activeDanceKey = nil
    backgroundSound.TimePosition = savedTimestamp
    backgroundSound:Play()
    if lp.Character and lp.Character:FindFirstChild("Animate") then
        lp.Character.Animate.Disabled = false
    end
    local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = 16 end
end

local function playDance(data, key)
    if isPlaying and activeDanceKey == key then stopAll() return end
    local audioData = data
    if data.isRandom then audioData = data.audios[math.random(1, #data.audios)] end
    local songName = (data.isRandom and audioData.name) or data.musicName or "None"
    notify("Clints Dancezzz", data.name .. " - " .. songName .. " [" .. key .. "]")
    local char = lp.Character
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
     if currentTrack then currentTrack:Stop() currentTrack:Destroy() currentTrack = nil end
    if currentSound then currentSound:Stop() currentSound:Destroy() currentSound = nil end
    if activeJsonPlayback then
        forceStopJsonPlayback = true
        local timeout = 0
        repeat task.wait(0.05) timeout += 0.05 until not activeJsonPlayback or timeout >= 1
    end
    if char and char:FindFirstChild("Animate") then
        char.Animate.Disabled = true
        for _, t in pairs(animator:GetPlayingAnimationTracks()) do t:Stop(0) end
    end
    task.wait(0.1)

    if audioData.url then
        savedTimestamp = backgroundSound.TimePosition
        backgroundSound:Stop()
    end

    if data.jsonFile then
        playJsonAnimation(data.jsonFile, data.animSpeed, true)
    else
        local animId = anim2track(data.id)
        local animation = Instance.new("Animation")
        animation.AnimationId = animId
        currentTrack = animator:LoadAnimation(animation)
        currentTrack.Priority = Enum.AnimationPriority.Action
        currentTrack.Looped = true
        currentTrack:Play()

        if data.animSpeed then currentTrack:AdjustSpeed(data.animSpeed) end
    end
    if audioData.url then
        task.spawn(function()
            if not isfile(audioData.file) then
                local s, content = pcall(game.HttpGet, game, audioData.url:gsub(" ", "%%20"))
                if s and #content > 1000 then writefile(audioData.file, content) end
            end
            if isfile(audioData.file) then
                currentSound = Instance.new("Sound")
                currentSound.SoundId = getcustomasset(audioData.file)
                currentSound.Volume = 1
                currentSound.Looped = true
                currentSound.Parent = SoundService
                currentSound.PlaybackSpeed = data.playbackSpeed or 1.0
                currentSound:Play()
            end
        end)
    end
    local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = DANCE_WALKSPEEDS[data.name] or 16 end
    isPlaying = true
    activeDanceKey = key
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    local keyName = input.KeyCode.Name
    if keyName == "M" then
        currentPage = currentPage + 1
        if currentPage > 4 then currentPage = 1 end
        notify("Clints Dancezzz", "Switched to Page " .. tostring(currentPage))
        return
    end
    
    local list
    if currentPage == 1 then
        list = page1Dances
    elseif currentPage == 2 then
        list = page2Dances
    elseif currentPage == 3 then
        list = page3Dances
	elseif currentPage == 4 then
        list = page4Dances
    end
    
    if list and list[keyName] then 
        playDance(list[keyName], keyName) 
    end
end)

lp.CharacterAdded:Connect(function()
    task.wait(1)
    stopAll()
end)
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.F3 then
        isDancing = false
        if StopAllDanceMusic then 
            StopAllDanceMusic() 
        end
        if PlayBackgroundMusic then 
            PlayBackgroundMusic() 
        end
    end
end)

local scriptUIS = game:GetService("UserInputService")
local scriptRun = game:GetService("RunService")
local scriptPlayers = game:GetService("Players")

local localPlayer = scriptPlayers.LocalPlayer
while not localPlayer do
    task.wait()
    localPlayer = scriptPlayers.LocalPlayer
end

local lastKeyPressedTime = 0
local activeStopMotionKey = nil 
local isStopMotion = false
local targetFPS = 10
local updateInterval = 1 / targetFPS
local lastUpdateTime = 0
local frozenTransforms = {}

local danceKeys = {
    Q = true, E = true, R = true, T = true, Y = true, U = true, P = true,
    F = true, G = true, H = true, J = true, K = true, L = true,
    Z = true, X = true, C = true, V = true, B = true, N = true
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StopMotionOverlayGui"
screenGui.ResetOnSpawn = false
pcall(function() screenGui.Parent = game:GetService("CoreGui") end)
if not screenGui.Parent then screenGui.Parent = localPlayer:WaitForChild("PlayerGui") end

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 160, 0, 45)
toggleButton.Position = UDim2.new(1, -180, 0, 20)
toggleButton.BackgroundTransparency = 1
toggleButton.TextTransparency = 1
toggleButton.Active = true
toggleButton.Parent = screenGui

local function setStopMotion(enabled, fpsOverride)
    isStopMotion = enabled
    if isStopMotion then
        targetFPS = fpsOverride or 10
        updateInterval = 1 / targetFPS
    else
        targetFPS = 1000 
        updateInterval = 1 / targetFPS
        activeStopMotionKey = nil 
    end
end

toggleButton.MouseButton1Click:Connect(function()
    lastKeyPressedTime = os.clock()
end)

scriptUIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    
    local keyCode = input.KeyCode
    local keyName = keyCode.Name
    
    local isValidPage1Key = (currentPage == 1 and (keyCode == Enum.KeyCode.G or keyCode == Enum.KeyCode.V or keyCode == Enum.KeyCode.J))
    local isValidPage2Key = (currentPage == 2 and (keyCode == Enum.KeyCode.H or keyCode == Enum.KeyCode.L or keyCode == Enum.KeyCode.X or keyCode == Enum.KeyCode.Y))
    local isValidPage3Key = (currentPage == 3 and (keyCode == Enum.KeyCode.R or keyCode == Enum.KeyCode.U or keyCode == Enum.KeyCode.K or keyCode == Enum.KeyCode.V or keyCode == Enum.KeyCode.B or keyCode == Enum.KeyCode.N))
    local isValidPage4Key = (currentPage == 4 and (keyCode == Enum.KeyCode.Q))

    if isValidPage1Key or isValidPage2Key or isValidPage3Key or isValidPage4Key then
        lastKeyPressedTime = os.clock()
        activeStopMotionKey = keyCode
    elseif isStopMotion and danceKeys[keyName] then
        setStopMotion(false)
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        
        local char = localPlayer and localPlayer.Character
        if char and char.Parent then
            if isPlaying then
                local timeSinceKey = os.clock() - lastKeyPressedTime
                if timeSinceKey <= 0.5 and activeStopMotionKey then
                    if not isStopMotion then 
                        local chosenFPS = 10
                        if currentPage == 3 and activeStopMotionKey == Enum.KeyCode.N then
                            chosenFPS = 30
                        end
                        setStopMotion(true, chosenFPS) 
                    end
                end
            else
                if isStopMotion then setStopMotion(false) end
            end
        else
            if isStopMotion then setStopMotion(false) end
        end
    end
end)

scriptRun.RenderStepped:Connect(function(deltaTime)
    local char = localPlayer and localPlayer.Character
    if not char or not char.Parent then return end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end


    for _, desc in ipairs(char:GetDescendants()) do
        if desc:IsA("Motor6D") then
            if shouldUpdate or not isStopMotion then
                frozenTransforms[desc] = desc.Transform
            else
                if frozenTransforms[desc] then
                    desc.Transform = frozenTransforms[desc]
                end
            end
        end
    end
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local selectedMode = nil

local chooserGui = Instance.new("ScreenGui")
chooserGui.Name = "PlatformChooser"
chooserGui.ResetOnSpawn = false

pcall(function()
    chooserGui.Parent = game:GetService("CoreGui")
end)

if not chooserGui.Parent then
    chooserGui.Parent = lp:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Parent = chooserGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "Choose Your Controls"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

local pcButton = Instance.new("TextButton")
pcButton.Size = UDim2.new(0,120,0,50)
pcButton.Position = UDim2.new(0,25,0,95)
pcButton.Text = "PC"
pcButton.Font = Enum.Font.GothamBold
pcButton.TextScaled = true
pcButton.BackgroundColor3 = Color3.fromRGB(45,45,45)
pcButton.TextColor3 = Color3.new(1,1,1)
pcButton.Parent = frame

local pcCorner = Instance.new("UICorner")
pcCorner.CornerRadius = UDim.new(0,10)
pcCorner.Parent = pcButton

local mobileButton = Instance.new("TextButton")
mobileButton.Size = UDim2.new(0,120,0,50)
mobileButton.Position = UDim2.new(1,-145,0,95)
mobileButton.Text = "Mobile"
mobileButton.Font = Enum.Font.GothamBold
mobileButton.TextScaled = true
mobileButton.BackgroundColor3 = Color3.fromRGB(45,45,45)
mobileButton.TextColor3 = Color3.new(1,1,1)
mobileButton.Parent = frame

local mobileCorner = Instance.new("UICorner")
mobileCorner.CornerRadius = UDim.new(0,10)
mobileCorner.Parent = mobileButton

pcButton.MouseButton1Click:Connect(function()
    selectedMode = "PC"
    chooserGui:Destroy()
end)

mobileButton.MouseButton1Click:Connect(function()
    selectedMode = "Mobile"
    chooserGui:Destroy()
end)

repeat task.wait() until selectedMode

if selectedMode == "Mobile" then

local dancePages = {
    [1] = page1Dances,
    [2] = page2Dances,
    [3] = page3Dances,
   	[4] = page4Dances
}

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DanceMobileUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = lp.PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 420, 0, 320)
    mainFrame.Position = UDim2.new(0.5, -210, 1, -340)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0,12)
    uiCorner.Parent = mainFrame

    local title2 = Instance.new("TextLabel")
    title2.Size = UDim2.new(1,0,0,35)
    title2.BackgroundTransparency = 1
    title2.Text = "Clints Dancezzz"
    title2.TextScaled = true
    title2.Font = Enum.Font.GothamBold
    title2.TextColor3 = Color3.new(1,1,1)
    title2.Parent = mainFrame

    local pageLabel = Instance.new("TextLabel")
    pageLabel.Size = UDim2.new(0,120,0,25)
    pageLabel.Position = UDim2.new(0.5,-60,0,38)
    pageLabel.BackgroundTransparency = 1
    pageLabel.Text = "Page 1"
    pageLabel.TextScaled = true
    pageLabel.Font = Enum.Font.GothamBold
    pageLabel.TextColor3 = Color3.new(1,1,1)
    pageLabel.Parent = mainFrame

    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1,-20,1,-90)
    scrollingFrame.Position = UDim2.new(0,10,0,70)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.Parent = mainFrame

    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0,120,0,45)
    grid.CellPadding = UDim2.new(0,8,0,8)
    grid.Parent = scrollingFrame

    local currentPageMobile = 1

local dragging = false
local dragInput
local dragStart
local startPos

mainFrame.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()

            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end

        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseMovement then

        dragInput = input

    end
end)

UserInputService.InputChanged:Connect(function(input)

    if input == dragInput and dragging then

        local delta = input.Position - dragStart

        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local mobileStopMotionDances = {
    ["Bacon Noob"] = true,
    ["Bang Bang Bang"] = true,
    ["PoPiPo"] = true,
    ["Birdbrain"] = true,
    ["Torture Dance"] = true,
    ["Miss Me"] = true,
    ["C14"] = true,
    ["The Hero"] = true,
	["Distraction"] = true,
	["Jax Toy"] = true,
	["Kwik Flip"] = true
}

local mobileStopMotionEnabled = false
local frozenTransforms = {}
local stopMotionFPS = 10
local stopMotionInterval = 1 / stopMotionFPS
local lastStopMotionUpdate = 0

local function setMobileStopMotion(enabled)
    mobileStopMotionEnabled = enabled
end

RunService.Stepped:Connect(function(time)

    if not mobileStopMotionEnabled then
        return
    end

    local char = lp.Character
    if not char then
        return
    end

    local shouldUpdate = false

    if time - lastStopMotionUpdate >= stopMotionInterval then
        shouldUpdate = true
        lastStopMotionUpdate = time
    end

    for _,desc in ipairs(char:GetDescendants()) do

        if desc:IsA("Motor6D") then

            if shouldUpdate then
                frozenTransforms[desc] = desc.Transform
            else
                if frozenTransforms[desc] then
                    desc.Transform = frozenTransforms[desc]
                end
            end
        end
    end
end)

    local function clearButtons()
        for _,v in pairs(scrollingFrame:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
    end

    local function createButton(key,data)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0,120,0,45)
        btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextScaled = true
        btn.Font = Enum.Font.GothamBold
        btn.Text = data.name
        btn.Parent = scrollingFrame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0,10)
        btnCorner.Parent = btn

btn.MouseButton1Click:Connect(function()

    playDance(data,key)

    if mobileStopMotionDances[data.name] then
        setMobileStopMotion(true)
    else
        setMobileStopMotion(false)
    end

end)

end

    local function loadPage(page)

        clearButtons()

        pageLabel.Text = "Page " .. tostring(page)

        local danceTable = dancePages[page]

        for key,data in pairs(danceTable) do
            createButton(key,data)
        end

        task.wait()

        scrollingFrame.CanvasSize = UDim2.new(
            0,
            0,
            0,
            grid.AbsoluteContentSize.Y + 10
        )
    end

    local prevButton = Instance.new("TextButton")
    prevButton.Size = UDim2.new(0,45,0,30)
    prevButton.Position = UDim2.new(0,10,0,35)
    prevButton.Text = "<"
    prevButton.TextScaled = true
    prevButton.Font = Enum.Font.GothamBold
    prevButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
    prevButton.TextColor3 = Color3.new(1,1,1)
    prevButton.Parent = mainFrame

    local nextButton = Instance.new("TextButton")
    nextButton.Size = UDim2.new(0,45,0,30)
    nextButton.Position = UDim2.new(1,-55,0,35)
    nextButton.Text = ">"
    nextButton.TextScaled = true
    nextButton.Font = Enum.Font.GothamBold
    nextButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
    nextButton.TextColor3 = Color3.new(1,1,1)
    nextButton.Parent = mainFrame

    prevButton.MouseButton1Click:Connect(function()

        currentPageMobile -= 1

        if currentPageMobile > 4 then
    	currentPageMobile = 1
end

        loadPage(currentPageMobile)

    end)

    nextButton.MouseButton1Click:Connect(function()

        currentPageMobile += 1

        if currentPageMobile > 4 then
    	currentPageMobile = 1
	end

        loadPage(currentPageMobile)

    end)

    loadPage(1)

end

if setclipboard then setclipboard(discordLink) end

local TweenService = game:GetService("TweenService")

local lp = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local env = (getgenv and getgenv()) or _G
env.ReanimateCooldown = env.ReanimateCooldown or 0

local function setupReanimateButton()
    local mobileGui = lp:WaitForChild("PlayerGui"):WaitForChild("DanceMobileUI", 5)
    if not mobileGui then return end
    
    local mainFrame = mobileGui:FindFirstChildOfClass("Frame")
    if not mainFrame then return end
    if mobileGui:FindFirstChild("Reanimate") then
        return
    end
    if os.time() < env.ReanimateCooldown then
        warn("Reanimate button blocked: 10-second cooldown is still active.")
        return
    end

    local reanimateBtn = Instance.new("TextButton")
    reanimateBtn.Name = "Reanimate"
    reanimateBtn.Size = UDim2.new(0, 170, 0, 35)
    reanimateBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    reanimateBtn.TextColor3 = Color3.new(1,1,1)
    reanimateBtn.Text = "Reanimate"
    reanimateBtn.TextScaled = true
    reanimateBtn.Font = Enum.Font.GothamBold
    reanimateBtn.AnchorPoint = Vector2.new(0.5, 1)
    reanimateBtn.Parent = mobileGui
    reanimateBtn.ZIndex = 10

    local mobileCorner = Instance.new("UICorner")
    mobileCorner.CornerRadius = UDim.new(0,10)
    mobileCorner.Parent = reanimateBtn

    local renderConnection
    renderConnection = RunService.RenderStepped:Connect(function()
        if mainFrame and mainFrame.Parent and reanimateBtn and reanimateBtn.Parent then
            local pos = mainFrame.AbsolutePosition
            local size = mainFrame.AbsoluteSize
            reanimateBtn.Position = UDim2.new(0, pos.X + (size.X / 2), 0, pos.Y - 10)
        else
            if renderConnection then renderConnection:Disconnect() end
        end
    end)

    local normalSize = reanimateBtn.Size
    local pressedSize = UDim2.new(normalSize.X.Scale, normalSize.X.Offset - 6, normalSize.Y.Scale, normalSize.Y.Offset - 3)
    local tweenInfoDown = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoUp = TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    local function tweenSize(size, info)
        if reanimateBtn and reanimateBtn.Parent then
            TweenService:Create(reanimateBtn, info, {Size = size}):Play()
        end
    end

    reanimateBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            tweenSize(pressedSize, tweenInfoDown)
        end
    end)

    reanimateBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            tweenSize(normalSize, tweenInfoUp)
        end
    end)

    reanimateBtn.MouseButton1Click:Connect(function()
        if os.time() < env.ReanimateCooldown then return end
        env.ReanimateCooldown = os.time() + 10
        reanimateBtn:Destroy()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/509clint/krystal-dance-V3-audios/main/reanimation.lua"))()
        end)
        if not success then
            warn("Reanimate failed:", err)
        end
    end)
end

if env.RespawnConnection then
    env.RespawnConnection:Disconnect()
end

env.RespawnConnection = lp.CharacterAdded:Connect(function()
    task.wait(0.5)
    setupReanimateButton()
end)

setupReanimateButton()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()

local syncGui = Instance.new("ScreenGui")
syncGui.Name = "SyncStatusGui"
syncGui.ResetOnSpawn = false
syncGui.Parent = lp:WaitForChild("PlayerGui")

local syncContainer = Instance.new("Frame")
syncContainer.Name = "SyncContainer"
syncContainer.Size = UDim2.new(0, 300, 0, 80)
syncContainer.Position = UDim2.new(0.5, 0, 1, 95)
syncContainer.AnchorPoint = Vector2.new(0.5, 1)
syncContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
syncContainer.BorderSizePixel = 0
syncContainer.ZIndex = 9999
syncContainer.Parent = syncGui

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 10)
containerCorner.Parent = syncContainer

local desyncBtn = Instance.new("TextButton")
desyncBtn.Name = "DesyncButton"
desyncBtn.Size = UDim2.new(1, -20, 0, 30)
desyncBtn.Position = UDim2.new(0, 10, 0, 10)
desyncBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
desyncBtn.Text = "Desync"
desyncBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
desyncBtn.Font = Enum.Font.GothamBold
desyncBtn.TextSize = 13
desyncBtn.AutoButtonColor = false
desyncBtn.ZIndex = 10000
desyncBtn.Parent = syncContainer

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = desyncBtn

local syncTextLabel = Instance.new("TextLabel")
syncTextLabel.Name = "SyncStatusText"
syncTextLabel.Size = UDim2.new(1, -20, 0, 25)
syncTextLabel.Position = UDim2.new(0, 10, 0, 45)
syncTextLabel.BackgroundTransparency = 1
syncTextLabel.Text = "Syncing With Anonymous"
syncTextLabel.TextColor3 = Color3.new(1, 1, 1)
syncTextLabel.Font = Enum.Font.GothamMedium
syncTextLabel.TextSize = 13
syncTextLabel.ZIndex = 10000
syncTextLabel.Parent = syncContainer


local function showSyncBanner(displayName)
    syncTextLabel.Text = "Syncing With " .. displayName
    TweenService:Create(syncContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 1, -25) 
    }):Play()
end

local function hideSyncBanner()
    TweenService:Create(syncContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, 0, 1, 95)
    }):Play()
end

local CROSS_RIG_MAP = {
    ["UpperTorso"] = "Torso", ["LowerTorso"] = "Torso",
    ["LeftUpperArm"] = "Left Arm", ["LeftLowerArm"] = "Left Arm", ["LeftHand"] = "Left Arm",
    ["RightUpperArm"] = "Right Arm", ["RightLowerArm"] = "Right Arm", ["RightHand"] = "Right Arm",
    ["LeftUpperLeg"] = "Left Leg", ["LeftLowerLeg"] = "Left Leg", ["LeftFoot"] = "Left Leg",
    ["RightUpperLeg"] = "Right Leg", ["RightLowerLeg"] = "Right Leg", ["RightFoot"] = "Right Leg",
    ["Torso"] = "UpperTorso",
    ["Left Arm"] = "LeftUpperArm",
    ["Right Arm"] = "RightUpperArm",
    ["Left Leg"] = "LeftUpperLeg",
    ["Right Leg"] = "RightUpperLeg",
    ["Head"] = "Head"
}

local ALL_SYNCABLE_PARTS = {
    "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Head",
    "UpperTorso", "LowerTorso", 
    "LeftUpperArm", "LeftLowerArm", "LeftHand",
    "RightUpperArm", "RightLowerArm", "RightHand",
    "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
    "RightUpperLeg", "RightLowerLeg", "RightFoot"
}
local syncLoopConnection = nil

local function stopSyncing()
    if syncLoopConnection then
        syncLoopConnection:Disconnect()
        syncLoopConnection = nil
    end
    hideSyncBanner()
    
    local myCharacter = lp.Character
    if myCharacter then
        local myHumanoid = myCharacter:FindFirstChildOfClass("Humanoid")
        if myHumanoid then myHumanoid.PlatformStand = false end
        
        for _, part in ipairs(myCharacter:GetChildren()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.CanCollide = true
                part.Velocity = Vector3.new(0,0,0)
                part.RotVelocity = Vector3.new(0,0,0)
            end
        end
    end
end

local function beginSyncing(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local myCharacter = lp.Character
    local targetCharacter = targetPlayer.Character
    if not myCharacter or not targetCharacter then return end
    
    local myHumanoid = myCharacter:FindFirstChildOfClass("Humanoid")
    if myHumanoid then myHumanoid.PlatformStand = true end 
    
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
    if not targetRoot or not myRoot then return end
    
    local initialRootOffset = targetRoot.CFrame:ToObjectSpace(myRoot.CFrame)
    
    if syncLoopConnection then 
        syncLoopConnection:Disconnect() 
        syncLoopConnection = nil
    end
    
    showSyncBanner(targetPlayer.DisplayName)
    
    syncLoopConnection = RunService.RenderStepped:Connect(function()
        if not targetCharacter.Parent or not myCharacter.Parent then
            stopSyncing()
            return
        end
        
        if targetRoot.Parent and myRoot.Parent then
syncLoopConnection = RunService.RenderStepped:Connect(function()
    if not targetCharacter.Parent or not myCharacter.Parent then
        stopSyncing()
        return
    end

    -- Build a Motor6D map for my character once per frame
    local myMotorMap = {}
    for _, desc in ipairs(myCharacter:GetDescendants()) do
        if desc:IsA("Motor6D") then
            myMotorMap[desc.Name] = desc
        end
    end

    -- Mirror every Motor6D transform from the target
    for _, desc in ipairs(targetCharacter:GetDescendants()) do
        if desc:IsA("Motor6D") then
            local myMotor = myMotorMap[desc.Name]
            if myMotor then
                myMotor.Transform = desc.Transform
            end
        end
    end
end)

mouse.Button1Down:Connect(function()
    local targetObj = mouse.Target
    if not targetObj then return end

    local characterModel = targetObj:FindFirstAncestorOfClass("Model")
    if characterModel then
        local foundPlayer = Players:GetPlayerFromCharacter(characterModel)
        if foundPlayer and foundPlayer ~= lp then
            beginSyncing(foundPlayer)
            return
        end
    end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if p.Character:FindFirstChild(targetObj.Name) or CROSS_RIG_MAP[targetObj.Name] then
                beginSyncing(p)
                return
            end
            for _, child in ipairs(workspace:GetChildren()) do
                if child:IsA("Model") and string.find(string.lower(child.Name), string.lower(p.Name)) then
                    if targetObj:IsDescendantOf(child) then
                        beginSyncing(p)
                        return
                    end
                end
            end
        end
    end
end)

desyncBtn.MouseButton1Click:Connect(function()
    stopSyncing()
end)
