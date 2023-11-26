repeat wait() until game:IsLoaded()
if game.PlaceId == 11445923563 or game.PlaceId == 13155198714 or game.PlaceId == 14862674911 then
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
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SmellLikeHacker/IDK/main/GUI56"))()
local Window = library:CreateWindow("SLH Hub | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." | V1.04")
local Tab1 = Window:CreateTab("Main")
local Sector1 = Tab1:CreateSector("Farm", "left")
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
local dd1 = Sector1:AddDropdown("SelectMob",Mob, false ,false , function(v)
    _G.Mob = v
end)
Sector1:AddButton("RefreshMob", function()
	for i, v in pairs(dd1:getList()) do
		dd1:Remove(tostring(v))
	end
	for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
		if string.find(v.Name,"Ilha_") then
			for _,vv in next, v:GetChildren() do
				if vv:FindFirstChild("NpcModel") and vv.NpcModel:FindFirstChild("HumanoidRootPart") then
					if not table.find(dd1:getList(), vv.NpcConfiguration:GetAttribute("Name")) then
						dd1:Add(vv.NpcConfiguration:GetAttribute("Name"))
					end
				end
			end
		end
	end
end)

Sector1:AddDropdown("Method",{"Behind" , "Front" , "Over" , "Under" }, "Over" ,false , function(v)
    _G.Method = v
end)
Sector1:AddTextbox("Distance (OnlyNumber)" , "20" , function(w)
    _G.Distance = tonumber(w)
end)
Sector1:AddToggle("AutoSelectMob(Level)", false, function(t)
    _G.AutoSelectMob = t
end)
Sector1:AddToggle("FarmWithQuest", false, function(t)
    _G.WithQuest = t
end)
Sector1:AddToggle("AutoFarm", false, function(t)
    _G.AutoFarm = t
end)

local Sector1 = Tab1:CreateSector("Attack", "left")
Sector1:AddDropdown("SelectType",{"Melee","Sword","Defence","Gun","Fruit"}, {"Melee"} ,true , function(v)
    _G.SelectType = v
end)
Sector1:AddToggle("EquipTool", false, function(v)
    _G.EquipTool = v
end)
Sector1:AddTextbox("CooldownAutoAttack" , "0.3" , function(w)
    _G.Cooldown = w
end)
Sector1:AddToggle("AutoAttack", false, function(v)
    _G.AutoAttack = v
end)
Sector1:AddToggle("INFGeppo", false, function(v)
    _G.INFGeppo = v
end)
Sector1:AddDropdown("HaoHaki With",{"Boss","Mob"}, {} ,true , function(v)
    _G.S = v
end)
Sector1:AddToggle("OpenHaoHaki", false, function(v)
	_G.HaoHaki = v
end)
Sector1:AddToggle("OpenKenHaki", false, function(v)
	_G.OpenKenHaki = v
end)
Sector1:AddToggle("OpenBusoHaki", false, function(v)
	_G.OpenBusoHaki = v
end)


local Sector1 = Tab1:CreateSector("AutoSkill", "Right")
Skill = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Skills.FruitBackground.Skills:GetChildren()) do
	if v.ClassName == "Frame" then
		table.insert(Skill,v.Name)
	end
end
Sector1:AddDropdown("MeleeSkill",Skill, {} ,true , function(v)
    _G.MeleeSkill = v
end)
Sector1:AddToggle("AutoSkillMelee", false, function(t)
	_G.AutoSkillMelee = t
end)
Sector1:AddDropdown("SwordSkill",Skill, {} ,true , function(v)
    _G.SwordSkill = v
end)
Sector1:AddToggle("AutoSkillSword", false, function(t)
	_G.AutoSkillSword = t
end)
Sector1:AddDropdown("GunSkill",Skill, {} ,true , function(v)
    _G.GunSkill = v
end)
Sector1:AddToggle("AutoSkillGun", false, function(t)
	_G.AutoSkillGun = t
end)
Sector1:AddDropdown("FruitSkill",Skill, {} ,true , function(v)
    _G.FruitSkill = v
end)
Sector1:AddToggle("AutoSkillFruit", false, function(t)
	_G.AutoSkillFruit = t
end)
Sector1:AddTextbox("Distance Skill" , "20" , function(w)
    _G.Dis = tonumber(w)
end)
Sector1:AddToggle("LimitDistance Mob Skill", false, function(t)
	_G.limitDis = t
end)
Sector1:AddToggle("Auto Ope Room", false, function(t)
	_G.AutoOpeRoom = t
end)
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")
Sector1:AddLabel("")

local Tab1 = Window:CreateTab("Misc")
local Sector1 = Tab1:CreateSector("Farm", "left")
local bs = {}
for _,v in pairs(workspace["__GAME"]["__Mobs"]:GetChildren()) do
	if not string.find(v.Name,"Ilha_") then
        table.insert(bs,v.Name)
    end
end
Sector1:AddDropdown("SelectBoss",bs, {} ,true , function(v)
    _G.SelectB = v
end)
Sector1:AddToggle("AutoBoss", false, function(t)
	_G.AutoBoss = t
end)
Sector1:AddToggle("HopBoss", false, function(t)
	_G.HopBoss = t
end)
local Sector1 = Tab1:CreateSector("Misc", "left")
Sector1:AddToggle("CollectChest", false, function(t)
	_G.CollectChest = t
end)
Sector1:AddToggle("HopChest", false, function(t)
	_G.HopChest = t
end)
local Sector1 = Tab1:CreateSector("Fruit", "Right")
SelFruit = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Game["__Assets"].FruitsModel:GetChildren()) do
	table.insert(SelFruit,v.Name)
end
Sector1:AddDropdown("SelectFruit",SelFruit, {} ,true , function(v)
    _G.SelectFruit = v
end)
Sector1:AddToggle("AutoStorageFruit", false, function(t)
	_G.StorageFruit = t
end)
SelsFruit = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Menu.FramesBackground.StockMarket.MainFrame.List:GetChildren()) do
	if v.Name ~= "FruitTemplate" and v.ClassName == "Frame" then
		table.insert(SelsFruit,v.Name)
	end
end
Sector1:AddDropdown("SelectBuyFruit",SelsFruit, {} ,false , function(v)
    _G.SelectsFruit = v
end)
Sector1:AddToggle("BuyFruit", false, function(t)
	_G.BuyFruit = t
end)
Sector1:AddToggle("AutoRandomFruit 1H", false, function(t)
	_G.RandomFruit = t
end)
Sector1:AddToggle("CollectFruit", false, function(t)
	_G.CollectFruit = t
end)
Sector1:AddToggle("HopFruit", false, function(t)
	_G.HopFruit = t
end)
Sector1:AddToggle("BringFruit", false, function(t)
	_G.BringFruit = t
end)




local Tab1 = Window:CreateTab("Teleport")
local Sector1 = Tab1:CreateSector("Islands", "left")
for i,v in pairs(workspace.__GAME.__SpawnPoints:GetChildren()) do
	Sector1:AddButton(v.Name , function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot
	end)
end
local Sector1 = Tab1:CreateSector("NPC", "Right")
for i,v in pairs(workspace.__GAME.__Interactions:GetChildren()) do
	if v:GetAttribute("ClosestIsland") then
	Sector1:AddButton(v.Name.."  ("..v:GetAttribute("ClosestIsland")..")", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot
	end)
	else
		Sector1:AddButton(v.Name, function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot
		end)
	end
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
						Notification(1, "SmellLikehacker Hub", "You will hopserver in 10 second if you want cancel turn off the hopboss", 10);
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



local TabSetting = Window:CreateTab("Setting/Misc")
local Setting1 = TabSetting:CreateSector("Section1", "left")
Setting1:AddTextbox("Speed" , "16" , function(w)
    _G.Speed = w
end)
Setting1:AddTextbox("Jump" , "50" , function(w)
    _G.Jump = w
end)
Setting1:AddToggle("WalkSpeed", false, function(t)
    _G.WalkSpeed = t
end)
Setting1:AddToggle("JumpPower", false, function(t)
    _G.JumpPower = t
end)
Setting1:AddToggle("Ctrl+ClickTP", false, function(t)
    _G.CtrlClickTP = t
end)
Setting1:AddToggle("CloseGuiAfterExecute", false, function(o)
    _G.CloseGuiAfterExecute = o
end)
Setting1:AddButton("Rejoin" , function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
end)
Setting1:AddButton("HopServer" , function()
    hopserver()
end)
Setting1:AddButton("FireProximityPrompt" , function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
        end
    end
end)
Setting1:AddButton("InstantProximityPrompt" , function()
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = 0
    end)
end)
spawn(function()
pcall(function()
    while task.wait() do
        pcall(function()
            if _G.WalkSpeed then
                pcall(function()
                    game.Players.LocalPlayer.character.Humanoid.WalkSpeed = tonumber(_G.Speed)
                end)
            end
        end)
    end
end)
end)
spawn(function()
pcall(function()
    while task.wait() do
        pcall(function()
            if _G.JumpPower then
                pcall(function()
                    game.Players.LocalPlayer.character.Humanoid.JumpPower = tonumber(_G.Jump)
                end)
            end
        end)
    end
end)
end)

local UIS = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
function GetCharacter()
    return game.Players.LocalPlayer.Character
    end
    function Teleport(pos)
    local Char = GetCharacter()
    if Char then
        Char:MoveTo(pos)
    end
end
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) and _G.CtrlClickTP == true then
        Teleport(Mouse.Hit.p)
    end
end)
spawn(function()
    pcall(function()
        while task.wait() do
            pcall(function()
                game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
                game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 100000
            end)
        end
    end)
end)
local Setting2 = TabSetting:CreateSector("Section2", "Right")
Setting2:AddDropdown("StatGuiPosition", {"Center","Left","Right"}, "Right", false, function(h)
    game:GetService("CoreGui").StatBySmell.Frame.UIListLayout.HorizontalAlignment = h
end)
Setting2:AddDropdown("CreditGuiPosition", {"Center","Left","Right"}, "Left", false, function(h)
    game:GetService("CoreGui").Credit.FRame.UIListLayout.HorizontalAlignment = h
end)
Setting2:AddToggle("StatGui", true, function(o)
    game:GetService("CoreGui").StatBySmell.Enabled = o
end)
Setting2:AddToggle("CreditGui", true, function(o)
    game:GetService("CoreGui").Credit.Enabled = o
end)
Setting2:AddToggle("RejoinIfGotKick", false, function(o)
    _G.rejoinKick = o
end)
spawn(function()
    getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
        if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
            if _G.rejoinKick == true then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end
    end)
end)
Setting2:AddToggle("BootsWhitescreen", false, function(o)
    _G.BootsWhitescreen = o
end)
Setting2:AddButton("infiniteyield" , function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
Setting2:AddButton("ResetCamera" , function()
    game:GetService("Workspace").CurrentCamera:Destroy()
    wait(.1)
    game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
    game:GetService("Players").LocalPlayer.CameraMinZoomDistance = .5
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 100000
    game:GetService("Players").LocalPlayer.CameraMode = "Classic"
end)
Setting2:AddButton("CopyDiscordLink" , function()
    setclipboard("https://discord.gg/48geaWzacy")
end)
Setting2:AddButton("JoinDiscord" , function()
    request = http_request or request or HttpPost or syn.request
    request({Url = "http://127.0.0.1:6463/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["origin"] = "https://discord.com",},Body = game:GetService("HttpService"):JSONEncode({["args"] = {["code"] = "48geaWzacy",},["cmd"] = "INVITE_BROWSER",["nonce"] = "."})})
end)
spawn(function()
pcall(function()
    while wait() do
        pcall(function()
            if _G.CloseGuiAfterExecute then
                pcall(function()
                    wait()
                    for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
                        if v:FindFirstChild("main") then
                            v.main.Visible = not v.main.Visible
                        end
                    end
                    wait(99999999999999999999999)
                end)
            end
        end)
    end
end)
end)
spawn(function()
pcall(function()
    while wait() do
        if _G.BootsWhitescreen then
            wait()
            local v0;local v1=game;local v2=v1.Workspace;local v3=v1.Lighting;local v4=v2.Terrain;v4.WaterWaveSize=0;v4.WaterWaveSpeed=0;v4.WaterReflectance=0;v4.WaterTransparency=0;v3.GlobalShadows=false;v3.FogEnd=8999999488;v3.Brightness=0;settings().Rendering.QualityLevel="Level01";for v18,v19 in pairs(v1:GetDescendants()) do if (v19:IsA("Part") or v19:IsA("Union") or v19:IsA("CornerWedgePart") or v19:IsA("TrussPart")) then v19.Material="Plastic";v19.Reflectance=0;elseif (v19:IsA("Decal") or (v19:IsA("Texture") and v0)) then v19.Transparency=1;elseif (v19:IsA("ParticleEmitter") or v19:IsA("Trail")) then v19.Lifetime=NumberRange.new(0);elseif v19:IsA("Explosion") then v19.BlastPressure=1;v19.BlastRadius=1;elseif (v19:IsA("Fire") or v19:IsA("SpotLight") or v19:IsA("Smoke")) then v19.Enabled=false;elseif v19:IsA("MeshPart") then v19.Material="Plastic";v19.Reflectance=0;v19.TextureID=10385902758728956;end end for v20,v21 in pairs(v3:GetChildren()) do if (v21:IsA("BlurEffect") or v21:IsA("SunRaysEffect") or v21:IsA("ColorCorrectionEffect") or v21:IsA("BloomEffect") or v21:IsA("DepthOfFieldEffect")) then v21.Enabled=false;end end local v13=game:GetService("UserInputService");local v14=game:GetService("RunService");local v15=function()v14:Set3dRenderingEnabled(false);return;end;local v16=function()v14:Set3dRenderingEnabled(true);return;end;local v17=function()v13.WindowFocusReleased:Connect(v15);v13.WindowFocused:Connect(v16);return;end;v17();
            wait(99999999999999999999999)
        end
    end
end)
end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local config = library:ConfigSystem("OneFruit")
config:Load()
while wait(1) do
    pcall(function()
        local config = library:ConfigSystem("OneFruit")
        config:Save()
	end)
end
end
