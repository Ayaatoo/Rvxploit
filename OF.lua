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

    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Method",
        Values = {"Behind", "Front", "Over", "Under"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("Method")

    Dropdown:OnChanged(function(Value)
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


    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)


    
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
