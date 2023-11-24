repeat wait() until game:IsLoaded()
if game.PlaceId == 11445923563 then
function hopserver()local v0=game.PlaceId;local v1={};local v2="";local v3=os.date("!*t").hour;local v4=false;local v5=pcall(function()v1=game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"));end);if  not v5 then table.insert(v1,v3);writefile("NotSameServers.json",game:GetService("HttpService"):JSONEncode(v1));end function TPReturner()local v6;if (v2=="") then v6=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v0   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v6=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v0   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v2 ));end local v7="";if (v6.nextPageCursor and (v6.nextPageCursor~="null") and (v6.nextPageCursor~=nil)) then v2=v6.nextPageCursor;end local v8=0;for v9,v10 in pairs(v6.data) do local v11=true;v7=tostring(v10.id);if (tonumber(v10.maxPlayers)>tonumber(v10.playing)) then for v13,v14 in pairs(v1) do if (v8~=0) then if (v7==tostring(v14)) then v11=false;end elseif (tonumber(v3)~=tonumber(v14)) then local v15=pcall(function()delfile("NotSameServers.json");v1={};table.insert(v1,v3);end);end v8=v8 + 1 ;end if (v11==true) then table.insert(v1,v7);wait();pcall(function()writefile("NotSameServers.json",game:GetService("HttpService"):JSONEncode(v1));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(v0,v7,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport()while wait() do pcall(function()TPReturner();if (v2~="") then TPReturner();end end);end end Teleport();end
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Skills")
spawn(function()
	pcall(function()
        repeat wait() until tostring(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Frame.LoadingBar.Position) == "{0.375999987, 0}, {1.5, 0}"
        wait(1)
        game:GetService("GuiService").SelectedObject = game.Players.LocalPlayer.PlayerGui.LoadingGui.Frame.Play
        wait(.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.1)
        game:GetService("GuiService").SelectedObject = nil
        wait(.1)
    end)
end)


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Rvxploit | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." | V1.",
    SubTitle = "by ayanokoji",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "bookmark" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "bar-chart-4" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "arrow-up-left-square" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Mob = {}
for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
	if string.find(v.Name,"Ilha_") then
		for _,vv in next, v:GetChildren() do
			if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
				if not table.find(Mob, vv.NpcConfiguration:GetAttribute("Name")) then
					table.insert(Mob,vv.NpcConfiguration:GetAttribute("Name"))
				end
			end
		end
	end
end

local Options = Fluent.Options

do
    --[[Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })]]--



    Tabs.Main:AddParagraph({
        Title = "Farm",
        Content = ""
    })


    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "SelectMob",
        Values = Mob,
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("mob")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
        _G.Mob = Value
    end)

    local Dropdown2 = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Method",
        Values = {"Behind", "Front", "Over", "Under"},
        Multi = false,
        Default = 1,
    })

    Dropdown2:SetValue("Over")

    Dropdown2:OnChanged(function(Value)
        print("Dropdown changed:", Value)
        _G.Method = Value
    end)

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Distance (OnlyNumber)",
        Default = 20,
        Placeholder = "Placeholder",
        Numeric = true, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
            _G.Distance = tonumber(Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
        _G.Distance = tonumber(Value)
    end)

    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoSelectMob(Level)", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
        _G.AutoSelectMob = Options.MyToggle.Value
    end)

    Options.MyToggle:SetValue(false)

    local Toggle2 = Tabs.Main:AddToggle("MyToggle2", {Title = "FarmWithQuest", Default = false })

    Toggle2:OnChanged(function()
        print("Toggle changed:", Options.MyToggle2.Value)
        _G.WithQuest = Options.MyToggle2.Value
    end)

    Options.MyToggle2:SetValue(false)


    local Toggle3 = Tabs.Main:AddToggle("MyToggle3", {Title = "AutoFarm", Default = false })

    Toggle3:OnChanged(function()
        print("Toggle changed:", Options.MyToggle3.Value)
        _G.AutoFarm = Options.MyToggle3.Value
    end)

    Options.MyToggle3:SetValue(false)


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)

    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("Rvxploit")
SaveManager:SetFolder("Rvxploit/onefruit")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Rvxploit",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end




local function getClosestFruit()
	local dist, thing = math.huge
    for _,v in pairs(workspace:GetChildren()) do
		if v.ClassName == "Model" and v:FindFirstChild("Eat") and v:FindFirstChild("Handle") then
			local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.WorldPivot.Position).magnitude
			if mag < dist then
				dist = mag 
				thing = v
			end
		end
    end
return thing
end
local function getClosestChest()
	local dist, thing = math.huge
    if workspace:FindFirstChild("Rare") then
        for _,v in pairs(workspace:GetChildren()) do
            if v.ClassName == "Model" and v:FindFirstChild("ChestInteract") and v.Name == "Rare" then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.WorldPivot.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    elseif workspace:FindFirstChild("Uncommon") then
        for _,v in pairs(workspace:GetChildren()) do
            if v.ClassName == "Model" and v:FindFirstChild("ChestInteract") and v.Name == "Uncommon" then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.WorldPivot.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    elseif workspace:FindFirstChild("Common") then
        for _,v in pairs(workspace:GetChildren()) do
            if v.ClassName == "Model" and v:FindFirstChild("ChestInteract") and v.Name == "Common" then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.WorldPivot.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    end
return thing
end
local function getClosestMore()
	local dist, thing = math.huge
	for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
		if table.find(_G.SelectB,v.Name) then
			for _,vv in next, v:GetChildren() do
				if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
					local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vv.NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude
					if mag < dist then
						dist = mag 
						thing = vv
					end
				end
			end
		end
	end
return thing
end
local function getClosestMob()
	local dist, thing = math.huge
    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
        for _,vv in pairs(v:GetChildren()) do
            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vv.NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude
                 if mag < dist then
                    dist = mag 
                    thing = vv
                end
            end
		end
	end
return thing
end
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoAttack then
				pcall(function()
					for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.ClassName == "Tool" and table.find(_G.SelectType,v:GetAttribute("Type")) then
							if v:GetAttribute("Type") == "Gun" then
								game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","Combat",{getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position,getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position+Vector3.new(0,1,0)},true,v,tostring(v:GetAttribute("Type"))},{"\t",getClosestMob(),v}})
							else
								game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","Combat",1,true,v,tostring(v:GetAttribute("Type"))},{"\t",getClosestMob(),v}})
							end
							wait(_G.Cooldown)
						end
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.HaoHaki then
				pcall(function()
					if table.find(_G.S,"Boss") and getClosestMore() and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMore().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= 20 then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","HaoHaki",nil,true}})
					elseif table.find(_G.S,"Mob") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= 20 then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","HaoHaki",nil,true}})
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			pcall(function()
				if _G.BuyFruit then
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Menu.FramesBackground.StockMarket.MainFrame.List:GetChildren()) do
						if v.PreviewName.Price.Text ~= "OUT OF STOCK" and _G.SelectsFruit == v.Name and game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Fruit") ~= v.Name then
							local args = {
								[1] = {
									[1] = {
										[1] = "\3",
										[2] = "BuyFruitCoins",
										[3] = v.Name
									}
								}
							}
							game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
						end
					end
				end
			end)
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			pcall(function()
				if _G.RandomFruit then
					game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\3","RandomFruit"}})
				end
			end)
		end
	end)
end)
spawn(function()
	pcall(function()
		while task.wait() do
			pcall(function()
				if _G.INFGeppo then
					game.Players.LocalPlayer.Character:SetAttribute("Geppos",math.huge)
				end
			end)
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.EquipTool then
				eqf = false
				for a,b in pairs(_G.SelectType) do
					if a == 1 then
						if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
							for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
								if v.ClassName == "Tool" and v:GetAttribute("Type") == b then
									eqf = true
								elseif v.ClassName == "Tool" and v:GetAttribute("Type") ~= b and eqf == false then
									v.Parent = game.Players.LocalPlayer.Backpack
								end
							end
						else
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v.ClassName == "Tool" and v:GetAttribute("Type") == b then
									v.Parent = game.Players.LocalPlayer.Character
								end
							end
						end
					end
				end
				if eqf == true then
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.ClassName == "Tool" and table.find(_G.SelectType,v:GetAttribute("Type")) then
							v.Parent = game.Players.LocalPlayer.Character
						end
					end
				end
			end
		end
	end)
end)

spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoSkillFruit then
				pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Skills.CurrentMastery.Visible == true then
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:GetAttribute("Type") == "Fruit" then
                                v.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                    end
					for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Fruit" then
							for _,s in pairs(_G.FruitSkill) do
								if _G.limitDis == true and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= _G.Dis then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								elseif _G.limitDis == false then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								end
							end
						end
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoSkillMelee then
				pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Skills.CurrentMastery.Visible == true then
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:GetAttribute("Type") == "Melee" then
                                v.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                    end
					for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Melee" then
							for _,s in pairs(_G.MeleeSkill) do
								if _G.limitDis == true and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= _G.Dis then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								elseif _G.limitDis == false then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								end
							end
						end
					end
				end)
			end
		end
	end)
end)

spawn(function()
	pcall(function()
		while task.wait() do
			if _G.CollectFruit == true then
				pcall(function()
                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v.IsA(v, "BasePart") then
                            v.Velocity, v.RotVelocity = V3, V3
                        end
                    end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoSkillSword then
				pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Skills.CurrentMastery.Visible == true then
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:GetAttribute("Type") == "Sword" then
                                v.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                    end
					for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Sword" then
							for _,s in pairs(_G.SwordSkill) do
								if _G.limitDis == true and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= _G.Dis then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								elseif _G.limitDis == false then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								end
							end
						end
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoSkillGun then
				pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Skills.CurrentMastery.Visible == true then
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:GetAttribute("Type") == "Gun" then
                                v.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                    end
					for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Gun" then
							for _,s in pairs(_G.GunSkill) do
								if _G.limitDis == true and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position).magnitude <= _G.Dis then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								elseif _G.limitDis == false then
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Hold",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
									wait(.3)
									game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl",v.Name,s,"Release",getClosestMob().NpcModel:FindFirstChild("HumanoidRootPart").Position}})
								end
							end
						end
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.OpenKenHaki then
				pcall(function()
					if game.Players.LocalPlayer.Character:GetAttribute("Ken") == false then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","KenHaki","null",true}})
					elseif not game.Players.LocalPlayer.Character:GetAttribute("Ken") then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","KenHaki","null",true}})
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.OpenBusoHaki then
				pcall(function()
					if game.Players.LocalPlayer.Character:GetAttribute("Buso") == false then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","BusoHaki"}})
					elseif not game.Players.LocalPlayer.Character:GetAttribute("Buso") then
						game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","BusoHaki"}})
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
        wait(10)
		while wait() do
			if _G.CollectChest == true then
                if _G.AutoFarm ~= true then
                    if _G.CollectFruit ~= true and _G.AutoFarm ~= true then
                        if getClosestChest() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            getClosestChest().ChestInteract.HoldDuration = 0
                            fireproximityprompt(getClosestChest().ChestInteract)
                            wait(.5)
                        elseif not getClosestChest() and _G.HopChest == true then
                            Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the HopChest", 10)
                            wait(10)
                            hopserver()
                            wait(60)
                        end
                    end
                end
            end
		end
	end)
end)
spawn(function()
	pcall(function()
        wait(10)
		while wait() do
            if _G.CollectFruit == true then
                if _G.AutoFarm ~= true then
                    if _G.CollectChest == true then
                        if getClosestFruit() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            wait(2)
                            getClosestFruit().Eat.HoldDuration = 0
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            fireproximityprompt(getClosestFruit().Eat)
                            wait(.5)
                        elseif _G.CollectChest == true and not getClosestFruit() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            getClosestChest().ChestInteract.HoldDuration = 0
                            fireproximityprompt(getClosestChest().ChestInteract)
                            wait(.5)
                        end
                    else
                        if getClosestFruit() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            getClosestFruit().Eat.HoldDuration = 0
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            fireproximityprompt(getClosestFruit().Eat)
                            wait(.5)
                        elseif _G.HopFruit == true and not getClosestFruit() then
                            Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the HopFruit", 10)
                            wait(10)
                            hopserver()
                            wait(60)
                        end
                    end
                end
            end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.BringFruit then
				pcall(function()
					for _,v in pairs(workspace:GetChildren()) do
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Eat" then
							firetouchinterest(v.Handle.TouchInterest.Parent, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
							wait(.1)
							firetouchinterest(v.Handle.TouchInterest.Parent, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
						end
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait() do
			if _G.StorageFruit then
				for _,vv in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if table.find(_G.SelectFruit,vv.Name) then
						if vv.ClassName == "Tool" and vv:GetAttribute("Type") == "Eat" then
							vv.Parent = game.Players.LocalPlayer.Character
						end
					end
				end
				for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if table.find(_G.SelectFruit,v.Name) then
						if v.ClassName == "Tool" and v:GetAttribute("Type") == "Eat" then
							game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","EatFruit",v,"Storage"}})
						end
					end
				end
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoOpeRoom == true then
                if not workspace.Effects:FindFirstChild(game.Players.LocalPlayer.Name.."Room") then
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl","Ope","F","Hold",nil}})
                    wait(0.3)
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl","Ope","F","Release",nil}})
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Effects:FindFirstChild(game.Players.LocalPlayer.Name.."Room").Room.Position).magnitude > 200 then
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl","Ope","F","Hold",nil}})
                    wait(0.3)
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\4","skillsControl","Ope","F","Release",nil}})
                end
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while task.wait() do
			if _G.AutoSelectMob then
				pcall(function()
					l = game:GetService("Players").LocalPlayer.leaderstats.Level.Value
					if l < 10 then
						_G.Mob = "Bandit"
					elseif l < 20 then
						_G.Mob = "Strong Bandit"
					elseif l < 35 then
						_G.Mob = "Bandit Leader"
					elseif l < 50 then
						_G.Mob = "Monkey"
					elseif l < 60 then
						_G.Mob = "Gorilla"
					elseif l < 75 then
						_G.Mob = "King Gorilla"
					elseif l < 90 then
						_G.Mob = "Clown"
					elseif l < 100 then
						_G.Mob = "Killer Clown"
					elseif l < 120 then
						_G.Mob = "Clown King"
					elseif l < 135 then
						_G.Mob = "Marine"
					elseif l < 150 then
						_G.Mob = "Marine Official"
					elseif l < 170 then
						_G.Mob = "Lorgan"
					elseif l < 185 then
						_G.Mob = "Cat Pirate"
					elseif l < 200 then
						_G.Mob = "Mansion Guard"
					elseif l < 215 then
						_G.Mob = "Buros"
					elseif l < 230 then
						_G.Mob = "Don Pirate"
					elseif l < 250 then
						_G.Mob = "Gimbo"
					elseif l < 275 then
						_G.Mob = "Don Zig"
					elseif l < 305 then
						_G.Mob = "Marine Soldier"
					elseif l < 330 then
						_G.Mob = "Captain Rat"
					elseif l < 350 then
						_G.Mob = "Fishman"
					elseif l < 380 then
						_G.Mob = "Chewing"
					elseif l < 400 then
						_G.Mob = "Ar Longo"
					elseif l < 425 then
						_G.Mob = "Logue Bandit"
					elseif l < 460 then
						_G.Mob = "Alvidamace"
					elseif l < 490 then
						_G.Mob = "Logue Marine"
					elseif l < 530 then
						_G.Mob = "Bashigs"
					elseif l < 560 then
						_G.Mob = "White"
					elseif l < 600 then
						_G.Mob = "Bounty Hunter"
					elseif l < 640 then
						_G.Mob = "Miss Love"
					elseif l < 680 then
						_G.Mob = "Mister 55"
					elseif l < 720 then
						_G.Mob = "Drum Soldier"
					elseif l < 750 then
						_G.Mob = "Lattons"
					elseif l < 800 then
						_G.Mob = "Vapol"
					elseif l < 840 then
						_G.Mob = "Miss Silver"
					elseif l < 900 then
						_G.Mob = "Mister 33"
					elseif l < 950 then
						_G.Mob = "Zroggy"
					elseif l < 1000 then
						_G.Mob = "Kingdom Guard"
					elseif l < 1060 then
						_G.Mob = "Mister 44"
					elseif l < 1100 then
						_G.Mob = "Great Friend"
					elseif l < 1150 then
						_G.Mob = "Desert Rebel"
					elseif l < 1200 then
						_G.Mob = "Miss Finger"
					elseif l < 1350 then
						_G.Mob = "Alligator"
					elseif l < 1425 then
						_G.Mob = "Paya Monkeys"
					elseif l < 1500 then
						_G.Mob = "Berrami"
					elseif l < 1575 then
						_G.Mob = "Flamingo"
					elseif l < 1650 then
						_G.Mob = "Sky Soldiers"
					elseif l < 1725 then
						_G.Mob = "Bhura"
					elseif l < 1800 then
						_G.Mob = "Sky Rebels"
					elseif l < 1900 then
						_G.Mob = "Bisatsu"
					elseif l < 2000 then
						_G.Mob = "Emenim"
					elseif l < 2100 then
						_G.Mob = "G88 Marine"
					elseif l < 2200 then
						_G.Mob = "G88 Captain"
					elseif l < 2300 then
						_G.Mob = "G88 Admiral"
					elseif l < 2400 then
						_G.Mob = "Capote"
					elseif l < 2500 then
						_G.Mob = "Foxy Queen"
					elseif l < 2600 then
						_G.Mob = "Fox"
					elseif l < 2800 then
						_G.Mob = "Kiji"
					elseif l < 2975 then
						_G.Mob = "Brank Family"
					elseif l < 3100 then
						_G.Mob = "Brank Strongy"
					elseif l < 3225 then
						_G.Mob = "Branky"
					elseif l < 3500 then
						_G.Mob = "Cypher 5"
					elseif l < 3600 then
						_G.Mob = "Cypher 6"
					elseif l < 3800 then
						_G.Mob = "Bayku"
					elseif l < 4000 then
						_G.Mob = "Manze"
					elseif l < 4200 then
						_G.Mob = "Door Guy"
					elseif l < 4450 then
						_G.Mob = "Talifa"
					elseif l < 4750 then
						_G.Mob = "Pandam"
					elseif l < 5000 then
						_G.Mob = "Robim Gucci"
					elseif l < 5250 then
						_G.Mob = "Zombie"
					elseif l < 5500 then
						_G.Mob = "Rona"
					elseif l < 5750 then
						_G.Mob = "Shinzuma"
					elseif l < 6000 then
						_G.Mob = "Aiz"
					elseif l < 6250 then
						_G.Mob = "Gikko Morais"
					elseif l < 6500 then
						_G.Mob = "Bear"
					elseif l < 6800 then
						_G.Mob = "Bubble Pirates!"
					elseif l < 7000 then
						_G.Mob = "Noble Agents"
					elseif l < 7350 then
						_G.Mob = "World Noble"
					elseif l < 7700 then
						_G.Mob = "Drago"
					elseif l > 7700 then
						_G.Mob = "Blau"
					end
				end)
			end
		end
	end)
end)
spawn(function()
	pcall(function()
		while task.wait() do
			pcall(function()
				if _G.AutoFarm == true then
                    if _G.CollectFruit == true and _G.CollectChest == true then
                        if getClosestFruit() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            getClosestFruit().Eat.HoldDuration = 0
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            fireproximityprompt(getClosestFruit().Eat)
                            wait(.5)
                        elseif getClosestChest() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            getClosestChest().ChestInteract.HoldDuration = 0
                            fireproximityprompt(getClosestChest().ChestInteract)
                            wait(.5)
                        else
                            if _G.AutoBoss and getClosestMore() then
                                task.spawn(function()
                                    if _G.Method == "Behind" then
                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                    elseif _G.Method == "Front" then
                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                    elseif _G.Method == "Under" then
                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                    elseif _G.Method == "Over" then
                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                    else
                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                    end
                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                        if v.IsA(v, "BasePart") then
                                            v.Velocity, v.RotVelocity = V3, V3
                                        end
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                end)
                            elseif _G.AutoBoss and not getClosestMore() and _G.HopBoss then
                                Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
                                wait(10)
                                hopserver()
                                wait(60)
                            else
                                if _G.WithQuest == true then
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == tostring(_G.Mob) and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    if tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}" or not tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) ~= tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                        for _,i in pairs(workspace["__GAME"]["__Quests"]:GetChildren()) do
                                                            if tostring(i:GetAttribute("QuestID")) == tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.WorldPivot
                                                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\3","GetQuest",tostring(vv.NpcConfiguration:GetAttribute("QuestId"))}})
                                                            end
                                                        end
                                                    elseif tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) ~= "{1.5, 0}, {0.361999989, 0}" or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) == vv.NpcConfiguration:GetAttribute("QuestId") then
                                                        repeat task.wait()
                                                            task.spawn(function()
                                                                if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                    if _G.Method == "Behind" then
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                    elseif _G.Method == "Front" then
                                                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                    elseif _G.Method == "Under" then
                                                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                    elseif _G.Method == "Over" then
                                                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                    else
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                        if v.IsA(v, "BasePart") then
                                                                            v.Velocity, v.RotVelocity = V3, V3
                                                                        end
                                                                    end
                                                                    if _G.AutoBoss and getClosestMore() then
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    else
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                end
                                                            end)
                                                        until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0 or tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}"
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == _G.Mob and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    repeat task.wait()
                                                        task.spawn(function()
                                                            if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                if _G.Method == "Behind" then
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                elseif _G.Method == "Front" then
                                                                    MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                elseif _G.Method == "Under" then
                                                                    MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                elseif _G.Method == "Over" then
                                                                    MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                else
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                end
                                                                local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                    if v.IsA(v, "BasePart") then
                                                                        v.Velocity, v.RotVelocity = V3, V3
                                                                    end
                                                                end
                                                                if _G.AutoBoss and getClosestMore() then
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                else
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                end
                                                            end
                                                        end)
                                                    until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.CollectFruit == true and _G.CollectChest == false then
                        if getClosestFruit() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            getClosestFruit().Eat.HoldDuration = 0
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestFruit().Handle.CFrame
                            fireproximityprompt(getClosestFruit().Eat)
                            wait(.5)
                        else
                            if _G.AutoBoss and getClosestMore() then
                                task.spawn(function()
                                    if _G.Method == "Behind" then
                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                    elseif _G.Method == "Front" then
                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                    elseif _G.Method == "Under" then
                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                    elseif _G.Method == "Over" then
                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                    else
                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                    end
                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                        if v.IsA(v, "BasePart") then
                                            v.Velocity, v.RotVelocity = V3, V3
                                        end
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                end)
                            elseif _G.AutoBoss and not getClosestMore() and _G.HopBoss then
                                Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
                                wait(10)
                                hopserver()
                                wait(60)
                            else
                                if _G.WithQuest == true then
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == tostring(_G.Mob) and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    if tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}" or not tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) ~= tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                        for _,i in pairs(workspace["__GAME"]["__Quests"]:GetChildren()) do
                                                            if tostring(i:GetAttribute("QuestID")) == tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.WorldPivot
                                                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\3","GetQuest",tostring(vv.NpcConfiguration:GetAttribute("QuestId"))}})
                                                            end
                                                        end
                                                    elseif tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) ~= "{1.5, 0}, {0.361999989, 0}" or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) == vv.NpcConfiguration:GetAttribute("QuestId") then
                                                        repeat task.wait()
                                                            task.spawn(function()
                                                                if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                    if _G.Method == "Behind" then
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                    elseif _G.Method == "Front" then
                                                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                    elseif _G.Method == "Under" then
                                                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                    elseif _G.Method == "Over" then
                                                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                    else
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                        if v.IsA(v, "BasePart") then
                                                                            v.Velocity, v.RotVelocity = V3, V3
                                                                        end
                                                                    end
                                                                    if _G.AutoBoss and getClosestMore() then
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    else
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                end
                                                            end)
                                                        until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0 or tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}"
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == _G.Mob and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    repeat task.wait()
                                                        task.spawn(function()
                                                            if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                if _G.Method == "Behind" then
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                elseif _G.Method == "Front" then
                                                                    MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                elseif _G.Method == "Under" then
                                                                    MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                elseif _G.Method == "Over" then
                                                                    MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                else
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                end
                                                                local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                    if v.IsA(v, "BasePart") then
                                                                        v.Velocity, v.RotVelocity = V3, V3
                                                                    end
                                                                end
                                                                if _G.AutoBoss and getClosestMore() then
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                else
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                end
                                                            end
                                                        end)
                                                    until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.CollectFruit == false and _G.CollectChest == true then
                        if getClosestChest() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            wait(2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestChest().WorldPivot
                            getClosestChest().ChestInteract.HoldDuration = 0
                            fireproximityprompt(getClosestChest().ChestInteract)
                            wait(.5)
                        else
                            if _G.AutoBoss and getClosestMore() then
                                task.spawn(function()
                                    if _G.Method == "Behind" then
                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                    elseif _G.Method == "Front" then
                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                    elseif _G.Method == "Under" then
                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                    elseif _G.Method == "Over" then
                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                    else
                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                    end
                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                        if v.IsA(v, "BasePart") then
                                            v.Velocity, v.RotVelocity = V3, V3
                                        end
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                end)
                            elseif _G.AutoBoss and not getClosestMore() and _G.HopBoss then
                                Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
                                wait(10)
                                hopserver()
                                wait(60)
                            else
                                if _G.WithQuest == true then
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == tostring(_G.Mob) and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    if tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}" or not tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) ~= tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                        for _,i in pairs(workspace["__GAME"]["__Quests"]:GetChildren()) do
                                                            if tostring(i:GetAttribute("QuestID")) == tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.WorldPivot
                                                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\3","GetQuest",tostring(vv.NpcConfiguration:GetAttribute("QuestId"))}})
                                                            end
                                                        end
                                                    elseif tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) ~= "{1.5, 0}, {0.361999989, 0}" or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) == vv.NpcConfiguration:GetAttribute("QuestId") then
                                                        repeat task.wait()
                                                            task.spawn(function()
                                                                if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                    if _G.Method == "Behind" then
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                    elseif _G.Method == "Front" then
                                                                        MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                    elseif _G.Method == "Under" then
                                                                        MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                    elseif _G.Method == "Over" then
                                                                        MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                    else
                                                                        MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                        if v.IsA(v, "BasePart") then
                                                                            v.Velocity, v.RotVelocity = V3, V3
                                                                        end
                                                                    end
                                                                    if _G.AutoBoss and getClosestMore() then
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    else
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                    end
                                                                end
                                                            end)
                                                        until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0 or tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}"
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                        for _,vv in next, v:GetChildren() do
                                            if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                                if vv.NpcConfiguration:GetAttribute("Name") == _G.Mob and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                    repeat task.wait()
                                                        task.spawn(function()
                                                            if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                if _G.Method == "Behind" then
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                elseif _G.Method == "Front" then
                                                                    MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                elseif _G.Method == "Under" then
                                                                    MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                elseif _G.Method == "Over" then
                                                                    MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                else
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                end
                                                                local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                    if v.IsA(v, "BasePart") then
                                                                        v.Velocity, v.RotVelocity = V3, V3
                                                                    end
                                                                end
                                                                if _G.AutoBoss and getClosestMore() then
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                else
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                end
                                                            end
                                                        end)
                                                    until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    else
                        if _G.AutoBoss and getClosestMore() then
                            task.spawn(function()
                                if _G.Method == "Behind" then
                                    MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                elseif _G.Method == "Front" then
                                    MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                elseif _G.Method == "Under" then
                                    MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                elseif _G.Method == "Over" then
                                    MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                else
                                    MethodFarm = CFrame.new(0,0,_G.Distance)
                                end
                                local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                    if v.IsA(v, "BasePart") then
                                        v.Velocity, v.RotVelocity = V3, V3
                                    end
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                            end)
                        elseif _G.AutoBoss and not getClosestMore() and _G.HopBoss then
                            Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
                            wait(10)
                            hopserver()
                            wait(60)
                        else
                            if _G.WithQuest == true then
                                for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                    for _,vv in next, v:GetChildren() do
                                        if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                            if vv.NpcConfiguration:GetAttribute("Name") == tostring(_G.Mob) and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                if tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}" or not tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) ~= tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                    for _,i in pairs(workspace["__GAME"]["__Quests"]:GetChildren()) do
                                                        if tostring(i:GetAttribute("QuestID")) == tostring(vv.NpcConfiguration:GetAttribute("QuestId")) then
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.WorldPivot
                                                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer({{"\3","GetQuest",tostring(vv.NpcConfiguration:GetAttribute("QuestId"))}})
                                                        end
                                                    end
                                                elseif tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) ~= "{1.5, 0}, {0.361999989, 0}" or tostring(game:GetService("Players").LocalPlayer.leaderstats.Currents:GetAttribute("Quest")) == vv.NpcConfiguration:GetAttribute("QuestId") then
                                                    repeat task.wait()
                                                        task.spawn(function()
                                                            if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                                if _G.Method == "Behind" then
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                                elseif _G.Method == "Front" then
                                                                    MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                                elseif _G.Method == "Under" then
                                                                    MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                                elseif _G.Method == "Over" then
                                                                    MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                                else
                                                                    MethodFarm = CFrame.new(0,0,_G.Distance)
                                                                end
                                                                local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                    if v.IsA(v, "BasePart") then
                                                                        v.Velocity, v.RotVelocity = V3, V3
                                                                    end
                                                                end
                                                                if _G.AutoBoss and getClosestMore() then
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                else
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                                end
                                                            end
                                                        end)
                                                    until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0 or tostring(game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.Position) == "{1.5, 0}, {0.361999989, 0}"
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
                                    for _,vv in next, v:GetChildren() do
                                        if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
                                            if vv.NpcConfiguration:GetAttribute("Name") == _G.Mob and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                repeat task.wait()
                                                    task.spawn(function()
                                                        if _G.AutoFarm == true and vv.NpcModel.HumanoidRootPart.CFrame.Y > 0 then
                                                            if _G.Method == "Behind" then
                                                                MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                                                            elseif _G.Method == "Front" then
                                                                MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                                                            elseif _G.Method == "Under" then
                                                                MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                                                            elseif _G.Method == "Over" then
                                                                MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                                                            else
                                                                MethodFarm = CFrame.new(0,0,_G.Distance)
                                                            end
                                                            local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                                                            for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                                                if v.IsA(v, "BasePart") then
                                                                    v.Velocity, v.RotVelocity = V3, V3
                                                                end
                                                            end
                                                            if _G.AutoBoss and getClosestMore() then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                            else
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vv.NpcModel.HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance)
                                                            end
                                                        end
                                                    end)
                                                until not v.Parent or _G.AutoFarm == false or vv.NpcModel.HumanoidRootPart.CFrame.Y < 0
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
				elseif _G.AutoFarm == false and _G.AutoBoss == true then
					if getClosestMore() then
						task.spawn(function()
							if _G.Method == "Behind" then
								MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
							elseif _G.Method == "Front" then
								MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
							elseif _G.Method == "Under" then
								MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
							elseif _G.Method == "Over" then
								MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
							else
								MethodFarm = CFrame.new(0,0,_G.Distance)
							end
							local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
							for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
								if v.IsA(v, "BasePart") then
									v.Velocity, v.RotVelocity = V3, V3
								end
							end
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestMore().WorldPivot * MethodFarm or CFrame.new(0,0,_G.Distance)
						end)
					elseif not getClosestMore() and _G.HopBoss then
						--Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
						wait(10)
						if _G.HopBoss == true and not getClosestMore() then
							hopserver()
                            wait(1)
						end
					end
				end
			end)
		end
	end)
end)
