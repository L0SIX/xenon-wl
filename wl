local whitelist = {
    123,
    123,
    123,
}

local blacklist = {
    123,
    123,
    123,
}


function check()
    local userid = game.Players.LocalPlayer.UserId    
    
    if userid == table.find(whitelist) then
        local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()

--[[SolarisLib:New({
  Name - Title of the UI <string>
  FolderToSave - Name of the folder where the UI files will be stored <string>
})]]
local win = SolarisLib:New({
  Name = "Xenon",
  FolderToSave = "SolarisLibStuff"
})

--win:Tab(title <string>)
local tab = win:Tab("Main")

--tab:Section(title <string>)
local sec = tab:Section("Xenon")

--sec:Button(title <string>, callback <function>)
sec:Button("Xenon", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/fnl"))()
  SolarisLib:Notification("Xenon Loaded", "Much love, losix#7795 <3")
end)

local toggle = sec:Toggle("Auto-Prediction", false,"Off", function(t)
  print(t)
end)
sec:Textbox("Prediction", true, function(t)
  print(t)
end)
local sec = tab:Section("Streamable")
sec:Button("Streamable", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/Streamable"))()
  SolarisLib:Notification("Streamable Loaded", "losix#7795 <3")
end)

local toggle = sec:Toggle("Auto-Prediction", false,"Off", function(t)
  print(t)
end)
sec:Textbox("Prediction", true, function(t)
  print(t)
end)
local sec = tab:Section("Extra")
sec:Button("Smooth Camlock", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/tenaki"))()
  SolarisLib:Notification("Camlock Loaded", "losix#7795 <3")
end)

local tab = win:Tab("Legit")
local sec2 = tab:Section("Legit")

sec2:Button("Anti-Lock (X)", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/underground%20v2"))()
  SolarisLib:Notification("Anit-Lock Loaded", "losix#7795 <3")
end)
sec2:Button("Desync", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/desync"))()
  SolarisLib:Notification("Desync Loaded", "losix#7795 <3")
end)
sec2:Button("Resolver", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/resolver"))()
  SolarisLib:Notification("Resolver Loaded", "losix#7795 <3")
end)
sec2:Button("Aim-Viewer", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/VinGUI"))()    
end)

local tab = win:Tab("Blatant")
local sec2 = tab:Section("Legit")

sec2:Button("Fake Macro (Z)", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/fake%20macro%20z"))()
  SolarisLib:Notification("Fake Macro Loaded", "losix#7795 <3")
end)
sec2:Button("God Mode", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/full%20god"))()
  SolarisLib:Notification("Desync Loaded", "losix#7795 <3")
end)
sec2:Button("No Jump Cooldown", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/L0SIX/xenon-wl/main/No%20Jump%20Cooldown"))()
  SolarisLib:Notification("Resolver Loaded", "losix#7795 <3")
end)
sec2:Button("Aim-Viewer", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/VinGUI"))()    
end)

function blacklist()
    local userid = game.Players.LocalPlayer
    
    if table.find(blacklist) then
        while true do
            local Players = game:GetService("Players")

local function onPlayerAdded(player)
    player.Chatted:Connect(function(message)
        if message:lower() == "/kick" then
            player:Kick("skiddddddd")
        end
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

        end
    end
end

check()
blacklist()
