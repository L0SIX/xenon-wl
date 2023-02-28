--[[

██╗░░░░░░█████╗░░██████╗██╗██╗░░██╗
██║░░░░░██╔══██╗██╔════╝██║╚██╗██╔╝
██║░░░░░██║░░██║╚█████╗░██║░╚███╔╝░
██║░░░░░██║░░██║░╚═══██╗██║░██╔██╗░
███████╗╚█████╔╝██████╔╝██║██╔╝╚██╗
╚══════╝░╚════╝░╚═════╝░╚═╝╚═╝░░╚═╝

presents

██╗░░██╗███████╗███╗░░██╗░█████╗░███╗░░██╗
╚██╗██╔╝██╔════╝████╗░██║██╔══██╗████╗░██║
░╚███╔╝░█████╗░░██╔██╗██║██║░░██║██╔██╗██║
░██╔██╗░██╔══╝░░██║╚████║██║░░██║██║╚████║
██╔╝╚██╗███████╗██║░╚███║╚█████╔╝██║░╚███║
╚═╝░░╚═╝╚══════╝╚═╝░░╚══╝░╚════╝░╚═╝░░╚══╝

]]
-- rolves
-- color corection
-- breakes jump pred
-- inf jump, no slow
-- PREDICTION IS VERY IMPORTANT
local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
local new = {
   main = {
      losix = true,
      Prediction = 0.1211,
      Part = "HumanoidRootPart", -- Use Head, UpperTorso, HumanoidRootPart, LowerTorso, RightFoot, LeftFoot, RightArm, LeftArm
      Key = "q",
      Notifications = true,
      AirshotFunc = true
   },
   Tracer = {
      TracerThickness = 2.7,
      TracerTransparency = 1.1,
      TracerColor = Color3.fromRGB(255, 255, 255)
   }
} -- Settings by Thusky
local CurrentCamera = game:GetService "Workspace".CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer
local Line = Drawing.new("Line")
local Inset = game:GetService("GuiService"):GetGuiInset().Y
-- loads workspace for variable/locals
Mouse.KeyDown:Connect(function(KeyPressed)
if KeyPressed == (new.main.Key) then
   if new.main.losix == true then
      new.main.losix = false
      if new.main.Notifications == true then
         Plr = FindClosestUser()
         game.StarterGui:SetCore("SendNotification", {
            Title = "Off",
            Text = "Toggled Off"
         })
      end
   else
      Plr = FindClosestUser()
      new.main.losix = true
      if new.main.Notifications == true then
         game.StarterGui:SetCore("SendNotification", {
            Title = "On",
            Text = "Target: " .. tostring(Plr.Character.Humanoid.DisplayName)
         })
      end
   end
end
end)
-- notifications
function FindClosestUser()
   local closestPlayer
   local shortestDistance = math.huge

   for i, v in pairs(game.Players:GetPlayers()) do
      if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
      v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
         local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
         local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
         if magnitude < shortestDistance then
            closestPlayer = v
            shortestDistance = magnitude
         end
      end
   end
   return closestPlayer
end
-- find closest player into local closestPlayer
local BOX_SIZE = Vector3.new(2.6, 5.5, 3)  -- Size of the hitbox

local function createBoxHighlight(part)
    local highlight = Instance.new("SelectionBox")
    highlight.Color3 = Color3.new(0, 255, 225)
    highlight.LineThickness = 0.020
    highlight.Adornee = part
    highlight.Parent = part
end
-- Box settings/highlight
local function removeBoxHighlight(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("SelectionBox") then
            child:Destroy()
        end
    end
end

RunService.Stepped:connect(function()
    if new.main.losix == true then
        local Character = Plr.Character
        local Part = Character[new.main.Part]
        local Velocity = Character.HumanoidRootPart.Velocity * new.main.Prediction
        local EndPoint = Part.Position + Velocity
        local EndPointScreen = CurrentCamera:WorldToViewportPoint(EndPoint)

        Line.Color = new.Tracer.TracerColor
        Line.Thickness = new.Tracer.TracerThickness
        Line.Transparency = new.Tracer.TracerTransparency
        Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Line.To = Vector2.new(EndPointScreen.X, EndPointScreen.Y)
        Line.Visible = true

        local HitBox = workspace.Terrain:FindFirstChild("HitBox")
        if not HitBox then
            HitBox = Instance.new("Part")
            HitBox.Name = "HitBox"
            HitBox.Anchored = true
            HitBox.CanCollide = false
            HitBox.Transparency = 0.85
            HitBox.Color = Color3.new(1, 1, 1)
            HitBox.Size = BOX_SIZE
            HitBox.CFrame = CFrame.new(EndPoint, EndPoint + Vector3.new(0, 0, -1))  -- Offset the hitbox slightly to avoid z-fighting
            HitBox.Parent = workspace.Terrain  -- Parent to Terrain to avoid physics issues with other parts
            
            createBoxHighlight(HitBox)
        else
            HitBox.CFrame = CFrame.new(EndPoint, EndPoint + Vector3.new(0, 0, -1))
        end
    else
        Line.Visible = false

        local HitBox = workspace.Terrain:FindFirstChild("HitBox")
        if HitBox then
            removeBoxHighlight(HitBox)
            HitBox:Destroy()
        end
    end
end)
-- Hitbox and tracer
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
local args = {...}
if new.main.losix and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
   args[3] = Plr.Character[new.main.Part].Position +
   (Plr.Character[new.main.Part].Velocity * new.main.Prediction)
   return old(unpack(args))
end
return old(...)
end)
if new.main.AirshotFunc == true then
   if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
      settings.main.Part = "RightFoot"
   else
      Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
      if new == Enum.HumanoidStateType.Freefall then
         settings.main.Part = "RightFoot"
      else
         settings.main.Part = "LowerTorso"
      end
      end)
   end
end
-- no jump cooldown
if not game.IsLoaded(game) then
   game.Loaded.Wait(game.Loaded);
end
local IsA = game.IsA;
local newindex = nil
newindex = hookmetamethod(game, "__newindex", function(self, Index, Value)
if not checkcaller() and IsA(self, "Humanoid") and Index == "JumpPower" then
   return
end

return newindex(self, Index, Value);
end)
-- better color
-- // Created by rice

local l = game:GetService("Lighting")

local col = Instance.new("ColorCorrectionEffect", l)
col.Brightness = 0
col.Contrast = 0.01
col.Saturation = 0.37
-- anti slow
local mt = getrawmetatable(game)
local backup
backup = hookfunction(mt.__newindex, newcclosure(function(self, key, value)
if key == "WalkSpeed" and value < 16 then
   value = 16
end
return backup(self, key, value)
end))
