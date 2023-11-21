repeat wait() until game:IsLoaded()
local Table = {3475397644, 5391312853, 3752680052, 4174118306, 3475419198, 3475422608, 4601778915, 4869039553, 5777228223, 3623549100, 3737848045, 3487210751, 4728805070, 5777228223}
if not table.find(Table, game.PlaceId) then return end
repeat
    wait()
until game:IsLoaded()
local get_thread_context = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local get_thread_identity = get_thread_context
local set_thread_context = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
for i,v in next, getconnections(LogService.MessageOut) do
    v:Enable()
end
wait()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local wait = task.wait 
local spawn = task.spawn

Player.Idled:connect(
    function()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
repeat
    wait()
until Player.Character


local Settings = {}

local GetConnections = function(A, B)
    for i,v in pairs(getconnections(A[tostring(B)])) do
        v:Fire()
    end 
end 

Player.PlayerGui.NodeGui.BoostFrame.ChildAdded:Connect(
    function(v)
        if v:IsA("Frame") and v:FindFirstChild("ClickButton") then
            wait(0.5)
            GetConnections(v.ClickShadowButton,"MouseButton1Down") 
        end
    end
)


if Player.PlayerGui:FindFirstChild("IntroFrame") then
    local Eh = Player.PlayerGui.IntroGui.IntroFrame.PlayButton
    local VirtualUser = VirtualUser
    Eh.Size = UDim2.new(9e9, 9e9, 9e9, 9e9)
    wait(1)
    VirtualUser:ClickButton1(Vector2.new(9e9, 9e9))
    wait(1)
    Eh.Size = UDim2.new(0, 0, 0, 0)
end
local D = {"🕹️Player", "Guest"}

local function GetDragons()
    local Target
    for i, v in ipairs(Player.Character.Dragons:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
            Target = v
        end
    end
    return Target
end
if game.PlaceId ~= 5777228223 then
    pcall(
        function()
            ReplicatedStorage.Remotes.SpinWheelRemote:InvokeServer()
            ReplicatedStorage.Remotes.ClaimWheelRemote:FireServer()

            StarterGui:SetCoreGuiEnabled(1, true)
            StarterGui:SetCoreGuiEnabled(2, true)
            StarterGui:SetCoreGuiEnabled(3, true)
        end
    )
end
Worlds = {}
local Poop = require(ReplicatedStorage.Storage.Worlds.Worlds)
for i, v in pairs(Poop) do
    table.insert(Worlds, v.Name .. " " .. v.GameId)
end

function Invis()
    local Clone = Player.Character.LowerTorso.Root:Clone()
    Player.Character.LowerTorso.Root:remove()
    Clone.Parent = Player.Character.LowerTorso
end

getgenv().Text = Drawing.new("Text")
Text.Color = Color3.new(0, 1, 1)
Text.Font = 1
Text.Outline = true
Text.OutlineColor = Color3.new(0, 0, 0)
Text.Position = Vector2.new(30, Workspace.CurrentCamera.ViewportSize.Y - 100)
Text.Size = 25
Text.Text = ""
Text.Visible = true

Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(
    function()
        Text.Position = Vector2.new(20, Workspace.CurrentCamera.ViewportSize.Y - 100)
    end
)

spawn(
    function()
        while wait() do
            Text.Text = Player.Settings.CurrentFish.Value
        end
    end
)

function fuckyou()
    ServerHop()
end

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__newindex", function(...)
    local Self, Key = ...
    if not checkcaller() then
        if Self.Name == "WalkSpeed" then
            return Player.Character:FindFirstChildWhichIsA("Humanoid", true).WalkSpeed or 16 
        elseif Self.Name == "JumpPower" then
            return Player.Character:FindFirstChildWhichIsA("Humanoid", true).WalkSpeed or 50
        end
    end
    return OldNameCall(...)
end)

local RF, RE, SH, CE
for i,v in next, getgc() do
    if type(v) == "function" and islclosure(v) then
        if debug.getinfo(v).name == "GetRemoteFunction" then
            RF = v 
        elseif debug.getinfo(v).name == "GetRemoteEvent" then
            RE = v
        elseif debug.getinfo(v).name == "_startHarvest" then
            SH = v
        elseif debug.getinfo(v).name == "attemptToClaimEgg" then
            CE = v
        end
    end
end

local Tween = function(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).Magnitude / C 
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = TweenService:Create(A, Info, {CFrame = CFrame.new(B.Position)})
        Tween:Play()
        Tween.Completed:Wait()
    end
    return A, B, C
end

local Healing = {}
for i,v in next, ReplicatedStorage.Storage.Items.Items.Healing:GetChildren() do
    if v:IsA("ModuleScript") then
        local A = require(v)
        for i,v in next, A do
            table.insert(Healing, i)
        end
    end
end

local foods = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Food:GetChildren()) do
    if v.ClassName == "ModuleScript" then
        g = require(v)
        for i, v in pairs(g) do
            table.insert(foods, i)
        end
    end
end
local list = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Food:GetChildren()) do
    if v.ClassName == "ModuleScript" then
        f = require(v)
        for i, v in pairs(f) do
            table.insert(list, i)
        end
    end
end
local Dragons = {}
for i, v in pairs(Player.Data.Dragons:GetChildren()) do
    if v:FindFirstChild("Age") then
        table.insert(Dragons, v.Value)
    end
end
local ss1 = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Eggs:GetChildren()) do
          if v.ClassName == "ModuleScript" then
        f = require(v)
        for i,v in pairs(f) do
        table.insert(ss1, i)
        end
    end
end

local Noclip = function()
    if Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
        for i,v in next, Player.Character:GetChildren() do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Velocity = Vector3.new(0,0,0)
            end
        end
    end 
end 
local Teleport2 = function(A)
    Player.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(CFrame.new(A))
end
local GetEgg = function(A)
    local Target = nil
    local Max = math.huge 
    for i,v in next, Workspace.Interactions.Nodes.Harvest.Eggs.ActiveNodes:GetChildren() do
        if v:IsA("Model") then
            local Mag = Mag(v:GetModelCFrame(), Player.Character:GetModelCFrame())
            if Mag < Max then
                Max = Mag 
                Target = v 
            end
        end
    end
    return Target
end
local Teleport = function(A)
    Player.Character.HumanoidRootPart.CFrame = A 
end

local CollectEgg = function(A)
    VirtualInputManager:SendKeyEvent(true, "E", false, game)
end

local deku1 = {"SolsticeFlares", "SolsticeBoxes"}
local deku = {"Food", "Magic", "Resources"}
for i, v in pairs(Players:GetPlayers()) do
    if not table.find(D, tostring(v:GetRoleInGroup(2919215)))then
        Kick("Mod Detected")
        ServerHop()
    end
end
Players.PlayerAdded:Connect(function(v)
    if not table.find(D, tostring(v:GetRoleInGroup(2919215))) then
        Kick("Mod Detected")
        ServerHop()
    end
end)

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/GUI/PlayerLIB"))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    Title = MarketplaceService:GetProductInfo(game.PlaceId).Name,
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('')
local LeftGroupBox2 = Tabs.Main:AddRightGroupbox('')


local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

if game.PlaceId == 3475397644 then

for i, v in pairs(Workspace.Interactions:GetDescendants()) do
    if v:IsA("TextLabel") and v.Name:match("Player")  then
        if v.Text == Player.PlayerGui.WorkspaceGui[Player.Name .. "_DisplayGui"].ContainerFrame.NameLabel.Text then
             Player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.TeleportPart.CFrame
        end
    end
end


LeftGroupBox:AddButton('Clear Base', function() Workspace.Interactions.Plots.Plots[Player.Name.."_Plot"].DeleteAllRemote:FireServer() end)

LeftGroupBox:AddButton('Go To Base', function()
    for i, v in pairs(Workspace.Interactions:GetDescendants()) do
        if v:IsA("TextLabel") and v.Name:match("Player")  then
            if  v.Text == Player.PlayerGui.WorkspaceGui[Player.Name .. "_DisplayGui"].ContainerFrame.NameLabel.Text then
                firetouchinterest(Player.Character.HumanoidRootPart, v.Parent.Parent.Parent.TeleportPart, 0)
            end
        end
    end
end)
LeftGroupBox:AddButton('Sell All Food', function()
    for i, v in pairs(Player.Data.Resources:GetChildren()) do
        if table.find(foods,v.Name) and v.Value ~= 0 then wait(0.5)
            RE("SellItemRemote"):FireServer({["Amount"] = v.Value, ["ItemName"] = v.Name})
        end
    end
end)
LeftGroupBox:AddToggle('Alchemy', {Text = 'Auto Alchemy', Default = false,Tooltip = '', Callback = function(A)
    Alchemy = A
    spawn(function()
        while wait() and Alchemy do
            pcall(function()
                for i, v in pairs(Player.Data.Resources:GetChildren()) do
                    if v.Name == AlchemyFoods and v.Value ~= 0 then wait(5)
                        RF("RecycleResourceRemote"):InvokeServer({[AlchemyFoods] = 1})
                    end
                end
            end)
        end
    end)
end})
Toggles.Alchemy:OnChanged(function(State)
    Alchemy = Toggles.Alchemy.Value
end)


LeftGroupBox:AddDropdown('AlchemyFoods', {Values = foods, Default = 1, Multi = false, Text = 'Alchemy Foods', Tooltip = '', Callback = function(A)
    AlchemyFoods = A
end})
Options.AlchemyFoods:OnChanged(function(String)
    AlchemyFoods = Options.AlchemyFoods.Value
end)
end

if game.PlaceId == 5777228223 then
--[[
LeftGroupBox:AddToggle('dsa', {Text = 'Auto Sun Event', Default = false,Tooltip = 'N', Callback = function(A)
    ForSho = A
    Stepped:Connect(function()
        if ForSho then
            pcall(function()
                NoCliper()
            end)
        end
    end)

    spawn(function()
        while wait() and ForSho do
            pcall(function()
                if Player.Settings.Minigame.Value then
                    for i,v in next, workspace.Interactions.SolsticeEvent.CatchObject:GetChildren() do
                        if v:IsA("Model") and Mag(Player.Character:GetModelCFrame(), v:GetModelCFrame()) < math.huge then
                            Tween(Player.Character.HumanoidRootPart, v:GetModelCFrame(), 500)
                            RE("GetCatchObjectRemote"):FireServer(v)
                        end
                    end
                elseif not Player.Settings.Minigame.Value and Player.Settings.Minigame.Queue.Value ~= "CatchObject" then
                    Player.Character:FindFirstChild("HumanoidRootPart").CFrame = Workspace.Interactions.SolsticeEvent.CatchObject.StartZone.NoticeBeams:GetModelCFrame()
                elseif Player.PlayerGui.MinigamesGui.RewardFrame.RewardsFrame.Visible then
                    for i=1, 2 do
                        RF("GetMinigameRewardRemote"):InvokeServer(i)
                    end
                    for i,v in next, Player.PlayerGui.MinigamesGui.RewardFrame.RewardsFrame:GetChildren() do
                        if i ~= 1 or i ~= 2 then
                            v:Destroy()
                        end
                    end
                end 
            end)
        end
    end)
end})

Toggles.dsa:OnChanged(function()
    ForSho = Toggles.dsa.Value 
end)


LeftGroupBox:AddToggle('fffg', {Text = 'Auto Help Plants', Default = false,Tooltip = 'Need to ride your dragon'})
Toggles.fffg:OnChanged(function()
	G = Toggles.fffg.Value
	spawn(function()
		while wait() and G do
			pcall(function()
				local Tar = nil
				for i,v in next, game.Workspace.Terrain:GetChildren() do
					if v.Name == "SolsticeFlower" and v.StepsCompleted.Value ~= v.StepsCompleted.MaxSteps.Value then
						Tar = v
						break
					end
				end
				for i,v in next, game.Workspace.Terrain:GetChildren() do
					local String = string.split(v.Name, "Item")[1]
					if string.find(Tar.RequiredItem.Value, String) and v.Active.Value then
						for i=1, 50 do wait()
							Teleport2(v.CFrame.Position)
						end
						wait(3)
						RE("GrabItemRemote"):FireServer(v)
						break
					end
				end
				for i=1, 50 do wait()
					Teleport2(Tar.CFrame.Position + Vector3.new(0,10,0))
				end
				wait(3)
				RF("UseItemOnFlowerRemote"):InvokeServer(Tar)
				wait(3)
			end)
		end
	end)
end)
]]--
end
LeftGroupBox:AddToggle('sdfg', {Text = 'Auto Collect', Default = false,Tooltip = '', Callback = function(A)
    AutoCollect = A
        RunService.Stepped:connect(function()
        if AutoCollect then
            pcall(function()
                Noclip()
            end)
        end
    end)
    spawn(function()
        while AutoCollect do wait()
            pcall(function()
                for i, v in pairs(Workspace.Interactions.Nodes.Harvest[CollectionItem].ActiveNodes:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") and AutoCollect then
                        if v.CurrentPlayer.Value ~= Player.Name and wait(3) then
                            Player.Character.HumanoidRootPart.CFrame = v:FindFirstChildWhichIsA("BasePart").CFrame * CFrame.new(40, -40, 0)
                            Tween(Player.Character:FindFirstChild("HumanoidRootPart"), v:FindFirstChildWhichIsA("BasePart").CFrame, 16)
                        end
                        wait(1)
                        if not v:FindFirstChild("Harvested").Value then
                            SH(v)
                        end
                        wait(6)
                    end
                end
            end)
        end
    end)
end})
Toggles.sdfg:OnChanged(function(State)
    AutoCollect = Toggles.sdfg.Value
end)

LeftGroupBox:AddDropdown('Drops', {Values = deku, Default = 1, Multi = false, Text = 'Collectables', Tooltip = '', Callback = function(A)
    CollectionItem = A
end})
Options.Drops:OnChanged(function(String)
    CollectionItem = Options.Drops.Value
end)

LeftGroupBox:AddToggle('Egg3', {Text = 'Auto Egg', Default = false,Tooltip = '', Callback = function(A)
    AutoEgg = A
    RunService.Stepped:connect(function()
        if AutoEgg then
            pcall(function()
                Noclip()
            end)
        end
    end)
    spawn(function()
        while AutoEgg do wait()
            pcall(function()
                local Egg = GetEgg()
                local H = Egg:FindFirstChild("Harvested", true)
                if Egg and H and not H.Value then
                    Teleport(CFrame.new(Egg:GetModelCFrame().Position + Vector3.new(0, -50, 50)))
                    Tween(Player.Character:FindFirstChild("HumanoidRootPart"), Egg:GetModelCFrame(), 16)
                    wait(3)
                    CollectEgg(Egg)
                    if not H.Value and wait(15) then
                        wait()
                    end
                end
            end)
        end
    end)
end})
Toggles.Egg3:OnChanged(function(State)
    AutoEgg = Toggles.Egg3.Value
end)

LeftGroupBox:AddToggle('Fish', {Text = 'Auto Fish', Default = false,Tooltip = '', Callback = function(A)
    AutoFish = A
    spawn(function()
        while AutoFish do wait()
            pcall(function()
                local Fish = require(ReplicatedStorage["_replicationFolder"].FishingClient)
                local StartCasting = Fish.StartCasting
                local Click = Fish.Click
                StartCasting(Fish, StartCasting)
                if Fish.Snagged == true then
                    Fish.ReelSignal:Fire()
                    if Player.PlayerGui.FishingGui.ContainerFrame.ReelingFrame.BarLabel.InnerLabel.PointerLabel.Position.X.Scale <= Player.PlayerGui.FishingGui.ContainerFrame.ReelingFrame.BarLabel.InnerLabel.SafeBarLabel.Position.X.Scale + .02 then
                        Click(Fish, Fish.Click)
                    end
                end
            end)
        end
    end)
end})
Toggles.Fish:OnChanged(function(State)
    AutoFish = Toggles.Fish.Value
end)
LeftGroupBox:AddButton('Equip Dragon', function() 
    for i,v in pairs(Player.Data.Dragons:GetDescendants()) do
        if  v.ClassName == 'StringValue' and  v.Value == DragonW and v:FindFirstChild("Stats") then 
            RF("EquipDragonRemote"):InvokeServer(v.Name)
            break
        end 
    end
end)

LeftGroupBox:AddDropdown('f', {Values = Dragons, Default = 1, Multi = false, Text = 'Dragons To Equip', Tooltip = '', Callback = function(A)
    DragonW = A
end})
Options.f:OnChanged(function(String)
    DragonW = Options.f.Value
end)

LeftGroupBox:AddButton('Premantly Delete Equipped Dragons', function() 
    for i, v in pairs(Player.Character.Dragons:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("ID") then
            RF("UnequipDragonRemote"):InvokeServer(v.Name)
        end
    end
end)

LeftGroupBox:AddToggle('Fd', {Text = 'Auto Feed', Default = false,Tooltip = '', Callback = function(A)
    AutoFeed = A
    spawn(function()
        while AutoFeed do wait()
            if AutoFeed then
                pcall(function()
                    for i, v in pairs(Player.Character.Dragons:GetChildren()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then wait(5)
                            RF("FeedDragonRemote"):InvokeServer(v.Name, {["Amount"] = 1, ["ItemName"] = Num})
                        end
                    end
                end)
            end
        end
    end)
end})
Toggles.Fd:OnChanged(function(State)
    AutoFeed = Toggles.Fd.Value
end)

LeftGroupBox:AddDropdown('Dros', {Values = list, Default = 1, Multi = false, Text = 'Feedable Foods', Tooltip = ''})
Options.Dros:OnChanged(function(String)
    Num = Options.Dros.Value
end)

LeftGroupBox2:AddToggle('Ffd', {Text = 'Auto Grow', Default = false,Tooltip = '', Callback = function(A)
    AutoGrow = A
    spawn(function()
        while AutoGrow do wait()
            if AutoGrow then
                pcall(function()
                    for i, v in pairs(Player.Character.Dragons:GetDescendants()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then wait(5)
                            RF("GrowDragonRemote"):InvokeServer(tostring(v.Name))
                        end
                    end
                end)
            end
        end
    end)
end})
Toggles.Ffd:OnChanged(function(State)
    AutoGrow = Toggles.Ffd.Value
end)
LeftGroupBox2:AddToggle('Ffdd', {Text = 'Auto Heal', Default = false,Tooltip = '', Callback = function(A)
    AutoHeal = A
    spawn(function()
        while AutoHeal do wait(0.1)
            if AutoHeal then
                pcall(function()
                    for i, v in pairs(Player.Character.Dragons:GetChildren()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then wait(1)
                            RF("HealDragonRemote"):InvokeServer(tostring(v.Name),HealingItem)
                        end
                    end
                end)
            end
        end
    end)
end})
Toggles.Ffdd:OnChanged(function(State)
    AutoHeal = Toggles.Ffdd.Value
end)
LeftGroupBox2:AddDropdown('Dross', {Values = Healing, Default = 1, Multi = false, Text = 'Useable Healing Items', Tooltip = '', Callback = function(A)
    HealingItem = A
end})
Options.Dross:OnChanged(function(String)
    HealingItem = Options.Dross.Value
end)

LeftGroupBox2:AddButton('Teleport to Selected World', function()
    for i,v in pairs(Poop) do
        if string.find(Type,v.GameId) then
            RF("WorldTeleportRemote"):InvokeServer(v.GameId,{})
        end 
    end 
end)
 
LeftGroupBox2:AddDropdown('e3333', {Values = Worlds, Default = 1, Multi = false, Text = 'Useable Healing Items', Tooltip = '', Callback = function(A)
    Type = A
end})
Options.e3333:OnChanged(function(String)
    Type = Options.e3333.Value
end)
 
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
LeftGroupBox2:AddToggle('ESP1', {Text = 'Esp Toggle', Default = false,Tooltip = '', Callback = function(A)
    ESP:Toggle(A)
end})
Toggles.ESP1:OnChanged(function(State)
    ESP:Toggle(Toggles.ESP1.Value)
end)

LeftGroupBox2:AddToggle('ESP2', {Text = 'Esp Players', Default = false,Tooltip = '', Callback = function(A)
    ESP.Players = A
end})
Toggles.ESP2:OnChanged(function(State)
    ESP.Players = Toggles.ESP2.Value
end)

LeftGroupBox2:AddToggle('ESP3', {Text = 'Esp Tracers', Default = false,Tooltip = '', Callback = function(A)
    ESP.Tracers = A
end})
Toggles.ESP3:OnChanged(function(State)
    ESP.Tracers = Toggles.ESP3.Value
end)

LeftGroupBox2:AddToggle('ESP4', {Text = 'Esp Names', Default = false,Tooltip = '', Callback = function(A)
    ESP.EspNames = A
end})
Toggles.ESP4:OnChanged(function(State)
    ESP.EspNames = Toggles.ESP4.Value
end)

LeftGroupBox2:AddToggle('ESP5', {Text = 'Esp Boxes', Default = false,Tooltip = '', Callback = function(A)
    ESP.Boxes = A
end})
Toggles.ESP5:OnChanged(function(State)
    ESP.Boxes = Toggles.ESP5.Value
end)

LeftGroupBox2:AddToggle('SSS', {Text = 'WalkSpeed Toggle',Default = false,Tooltip = '', Callback = function(A)
WS = A 
    RunService.Stepped:Connect(function()
        if WS then
            pcall(function()
                Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = WalkSpeed or 16
            end)
        end
    end)
end})
Toggles.SSS:OnChanged(function(State)
    Foe = Toggles.SSS.Value 
end)
LeftGroupBox2:AddInput('SSF3', {Default = 'WalkSpeed',Numeric = true,Finished = false,Text = 'WalkSpeed',Tooltip = 'Numbers Only',Placeholder = 'WalkSpeed'})
Options.SSF3:OnChanged(function(State)
    WalkSpeed = Options.SSF3.Value
end)

LeftGroupBox2:AddToggle('EEE', {Text = 'JumpPower Toggle',Default = false,Tooltip = '', Callback = function(A)
JP = A 
    RunService.Stepped:Connect(function()
        if JP then
            pcall(function()
                local H = Player.Character:FindFirstChildWhichIsA("Humanoid")
                if H.UseJumpPower then
                    H.JumpPower = JumpPower or 50
                else
                    H.JumpHeight = JumpPower or 50
                end
            end)
        end
    end)
end})
Toggles.EEE:OnChanged(function(State)
    JP = Toggles.EEE.Value 
end)
LeftGroupBox2:AddInput('SSF1', {Default = 'JumpPower',Numeric = true,Finished = false,Text = 'JumpPower',Tooltip = 'Numbers Only',Placeholder = 'JumpPower'})

Options.SSF1:OnChanged(function(State)
    JumpPower = Options.SSF1.Value 
end)


LeftGroupBox2:AddToggle('vvS', {Text = 'Infinite Jump',Default =  InfiniteJump,Tooltip = '', Callback = function(A)
InfiniteJump = A
    UserInputService.JumpRequest:connect(function()
        if InfiniteJump then
            Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
        end
    end)
end})

Toggles.vvS:OnChanged(function()
    InfiniteJump = Toggles.vvS.Value 
end)

LeftGroupBox2:AddToggle('eeS', {Text = 'NoClip',Default =  Sex2,Tooltip = '', Callback = function(A)
noclips = A
    RunService.Stepped:connect(function(v)
        if noclips then
            pcall(function()
                NoClip2(Player.Character)
            end)
        end
    end)
end})
Toggles.eeS:OnChanged(function()
    noclips = Toggles.eeS.Value 
end)

LeftGroupBox2:AddToggle('aaS', {Text = 'H Fly',Default =  Sex,Tooltip = 'Fly By Pressing H', Callback = function(A)
Sex = A
local Max = 0
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" and Sex then
            Max = Max + 1
            getgenv().Fly = false
            if Sex then
                local T = LP.Character:FindFirstChild("UpperTorso",true) or LP.Character:FindFirstChild("HumanoidRootPart",true)
                local S = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local S2 = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local SPEED = 5
                local function FLY()
                    getgenv().Fly = true
                    local BodyGyro = Instance.new("BodyGyro", T)
                    local BodyVelocity = Instance.new("BodyVelocity", T)
                    BodyGyro.P = 9e4
                    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BodyGyro.cframe = T.CFrame
                    BodyVelocity.velocity = Vector3.new(0, 0, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(function()
                        repeat wait()
                            LP.Character.Humanoid.PlatformStand = true
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 500
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = Workspace.CurrentCamera.CoordinateFrame
                            until not getgenv().Fly
                            S = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            S2 = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            SPEED = 0
                            BodyGyro:destroy()
                            BodyVelocity:destroy()
                            LP.Character.Humanoid.PlatformStand = false
                        end
                    )
                end
                Mouse.KeyDown:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 1
                        elseif k:lower() == "s" then
                            S.B = -1
                        elseif k:lower() == "a" then
                            S.L = -1
                        elseif k:lower() == "d" then
                            S.R = 1
                        end
                    end
                )
                Mouse.KeyUp:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 0
                        elseif k:lower() == "s" then
                            S.B = 0
                        elseif k:lower() == "a" then
                            S.L = 0
                        elseif k:lower() == "d" then
                            S.R = 0
                        end
                    end
                )
                FLY()
                if Max == 2 then
                    getgenv().Fly = false
                    Max = 0
                end
            end
        end
    end
)
end})
Toggles.aaS:OnChanged(function()
    Sex = Toggles.aaS.Value 
end)


LeftGroupBox2:AddButton('ServerHop', function() ServerHop() end)
LeftGroupBox2:AddButton('Rejoin', function() 
    local Success, ErrorMessage = pcall(function()
        Rejoin()
    end)
    if ErrorMessage and not Success then
        warn(ErrorMessage)
    elseif Success and not ErrorMessage then
        print(Success)
    end
end)
-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = "RightControl", NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('V.G Hub')
SaveManager:SetFolder("V.G Hub/" .. game.PlaceId)
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
