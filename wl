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
        -- script
    else
        while true do
            print('skiddes got crashed')
        end
    end
end


function blacklist()
    local userid = game.Players.LocalPlayer
    
    if table.find(blacklist) then
        while true do
            print('skiddes got crashed')
        end
    end
end

check()
blacklist()
