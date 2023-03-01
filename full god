getgenv().Settings = {
    ['Custom'] = {
        ["GodV2"] = true,
        ["GodV3"] = true,
        ["Godblock"] = true,
        ["Autoblock"] = true,
        ["Hideblock"] = true,
        ["Antislow"] = true,
        ["Antieffect"] = true,
    }
}

if not game['Loaded'] or not game:GetService("Players").LocalPlayer then 
    game['Loaded']:Wait();
    game:WaitForChild(game:GetService('Players'));
    game:GetService('Players'):WaitForChild(game:GetService("Players").LocalPlayer.Name)
end

assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
newcclosure(
function(self, ...)
	local args = {...}
        if tostring(self) == "RemoteFunction" then return end
		if tostring(self) == "MainEvent" then
		if tostring(args[1]) == "DropMoney" or tostring(args[1]) == "TimerDecrease" or  tostring(args[1]) == "Grabbing" or tostring(args[1]) == "Block" or tostring(args[1]) == "Stomp" or tostring(args[1]) == "JoinCrew" or tostring(args[1]) == "PhoneCall" or tostring(args[1]) == "Boombox" or tostring(args[1]) == "BoomboxStop" or tostring(args[1]) == "EnterPromoCode" or tostring(args[1]) == "PurchaseSkinCrate" or tostring(args[1]) == "TimerMoney" or tostring(args[1]) == "Reload" or tostring(args[1]) == "UpdateMousePos" or tostring(args[1]) == "FireworkText" or tostring(args[1]) == "GunCombatToggle" or tostring(args[1]) == "LeaveCrew" or tostring(args[1]) == "AnimationPack" or tostring(args[1]) == "EquipWeaponSkins" or tostring(args[1]) == "REPORT_PLAYER" or tostring(args[1]) == "IS_MOBILE" or tostring(args[1]) == "GamePurchase" then
			else 
				return
			end 
		end
	return old(self, ...)
end)


function AnimPlay(ID, SPEED)
    local animation = Instance.new('Animation', game:GetService("Workspace"))
    animation.AnimationId = 'rbxassetid://'..ID
    playing = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
    playing:Play() 
    if tonumber(SPEED) then
        playing:AdjustSpeed(SPEED)
    else
        playing:AdjustSpeed(1)
    end
    animation:Destroy()
end

function AnimStop(ID, SPEED)
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
        if v.Animation.AnimationId == 'rbxassetid://'..ID then
          if tonumber(SPEED) then
                v:Stop(SPEED)
            else
                v:Stop()
            end
        end
    end
end

coroutine.wrap(function()
    if getgenv().Settings.Custom.Godblock then
        Godblock = true
		game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects"):WaitForChild("Defense"):WaitForChild("CurrentTimeBlock"):Destroy()
	end
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.GodV3 then
    game:GetService("StarterPlayer").StarterCharacterScripts["CheckingKOED                                                                   ."]:Destroy()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'Script' then
                v:Destroy()
            end
        end
    end  
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.GodV2 then
        GodV2 = true
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
        end
        local newCharacter =  game:GetService("Workspace"):WaitForChild(game:GetService("Players").LocalPlayer.Name)
        local spoofFolder = Instance.new('Folder');
        spoofFolder.Name = 'FULLY_LOADED_CHAR';
        spoofFolder.Parent = newCharacter;
        newCharacter:WaitForChild('RagdollConstraints'):Destroy();
        local spoofValue = Instance.new('BoolValue', newCharacter);
        spoofValue.Name = 'RagdollConstraints';         
        game:GetService("Players").LocalPlayer.Character.BodyEffects.Defense:Destroy()
        Defense = Instance.new("IntValue", game:GetService("Players").LocalPlayer.Character.BodyEffects)
        Defense.Name = "Defense"
        Defense.Value = 101
        game:GetService("Players").LocalPlayer.Character:WaitForChild('BodyEffects').Armor:Destroy()
        local Clone1 = Instance.new("IntValue")
        Clone1.Name = "Armor"
        Clone1.Value = 101
        Clone1.Parent = game:GetService("Players").LocalPlayer.Character.BodyEffects
    end
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.Autoblock then
    	game:GetService('UserInputService').InputBegan:Connect(function(key,b)
			if key.KeyCode == Enum.KeyCode.F and not b then
				HoldingF = true
			end
		end)
		game:GetService('UserInputService').InputEnded:Connect(function(key,b)
			if key.KeyCode == Enum.KeyCode.F and not b then
				HoldingF = false
			end
		end)
        game:GetService("RunService").RenderStepped:connect(function()
            local forbidden = {'[RPG]','[SMG]','[TacticalShotgun]','[AK47]','[AUG]','[Glock]', '[Shotgun]','[Flamethrower]','[Silencer]','[AR]','[Revolver]','[SilencerAR]','[LMG]','[P90]','[DrumGun]','[Double-Barrel SG]','[Hamburger]','[Chicken]','[Pizza]','[Cranberry]','[Donut]','[Taco]','[Starblox Latte]','[BrownBag]','[Weights]','[HeavyWeights]'}
            local Found = false
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v and v.Character and v.Character:FindFirstChild("UpperTorso") and v.Character:FindFirstChild("FULLY_LOADED_CHAR") and (v.Character.UpperTorso.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= 25 then
                    if v.Character.BodyEffects.Attacking.Value == true and not table.find(forbidden, v.Character:FindFirstChildWhichIsA('Tool').Name ) and v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        Found = true
                        game:GetService("ReplicatedStorage").MainEvent:FireServer('Block', game:GetService("Players").LocalPlayer.Name)
                    end
                end
            end
            if Found == false and HoldingF == false then
				if game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects"):FindFirstChild('Block') then 
					game:GetService("Players").LocalPlayer.Character.BodyEffects.Block:Destroy()
				end
            end
		end)
	end
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.Hideblock then
        game:GetService("RunService").RenderStepped:connect(function()
            pcall(function()
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
                    if v.Animation.AnimationId == 'rbxassetid://5641749824' or v.Name == 'Block' then
                        v:Stop() 
                    end
                end
            end)
        end)
    end
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.Antislow then
		repeat wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField_TESTING")
    	wait(1)
		game:GetService('UserInputService').InputBegan:Connect(function(key,b)
			if key.KeyCode == Enum.KeyCode.LeftShift and not b then
                repeat wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField_TESTING")
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Name = "Humanoid "
				game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 22
			end
		end)
		game:GetService('UserInputService').InputEnded:Connect(function(key,b)
			if key.KeyCode == Enum.KeyCode.LeftShift and not b then
                repeat wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField_TESTING")
				game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 16
			end
		end)
        game:GetService('UserInputService').InputBegan:Connect(function(key,b)
            if key.KeyCode == Enum.KeyCode.LeftControl and not b then
                repeat wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField_TESTING")
                AnimPlay(3152394906)
            end
        end)
        game:GetService('UserInputService').InputEnded:Connect(function(key,b)
            if key.KeyCode == Enum.KeyCode.LeftControl and not b then
                repeat wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField_TESTING")
                AnimStop(3152394906)
            end
        end)
    end
end)()

coroutine.wrap(function()
    if getgenv().Settings.Custom.Antieffect then
        game:GetService("RunService").RenderStepped:connect(function()
            pcall(function()
                local Particle = game:GetService("Players").LocalPlayer.Character.UpperTorso:FindFirstChild('ElectricuteParticle') or game:GetService("Players").LocalPlayer.Character.UpperTorso:FindFirstChild('FlamethrowerFireParticle') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Christmas_Sock')
                if Particle then 
                    Particle:Destroy() 
                end
            end)
        end)   
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(chr) 
    if GodV2 == true then
        local newCharacter =  game:GetService("Workspace"):WaitForChild(game:GetService("Players").LocalPlayer.Name)
        local spoofFolder = Instance.new('Folder');
        spoofFolder.Name = 'FULLY_LOADED_CHAR';
        spoofFolder.Parent = newCharacter;
        newCharacter:WaitForChild('RagdollConstraints'):Destroy();
        local spoofValue = Instance.new('BoolValue', newCharacter);
        spoofValue.Name = 'RagdollConstraints';         
        game:GetService("Players").LocalPlayer.Character.BodyEffects.Defense:Destroy()
        Defense = Instance.new("IntValue", game:GetService("Players").LocalPlayer.Character.BodyEffects)
        Defense.Name = "Defense"
        Defense.Value = 101
        game:GetService("Players").LocalPlayer.Character:WaitForChild('BodyEffects').Armor:Destroy()
        local Clone1 = Instance.new("IntValue")
        Clone1.Name = "Armor"
        Clone1.Value = 101
        Clone1.Parent = game:GetService("Players").LocalPlayer.Character.BodyEffects
		if Godblock == true then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects"):WaitForChild("Defense"):WaitForChild("CurrentTimeBlock"):Destroy()
		end
    end
end)
