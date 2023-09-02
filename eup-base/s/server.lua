local p = print 

local function credits() -- please dont remove this 😔
    p("made by vexxydevs :D (please dont remove this 😔)")
end





local function Nb()
    p('sucessfully loaded and configured script for environment (#1)')
end 

local function Nb2()
 p('sucessfully loaded and configured script for environment (#2)')
end

Citizen.CreateThread(function()
    credits()
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000) 
    
    local eupstream = GetResourceState("eup-stream")
    
    if eupstream == "started"  then
        p("Please delete the resource: eup-stream if you're wanting to use this resource!")
        
    else 
        p("Loaded all eup files with no errors! (server-sided) #1")
        Nb()
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000) 
    
    local eupui = GetResourceState("eup-ui")
    
    if eupui == "started" then
        p("Please delete the resource: eup-ui if you're wanting to use this resource!")
    else 
        p("Loaded all eup files with no errors! (server-sided) #2")
        Nb2()
    end
end)
