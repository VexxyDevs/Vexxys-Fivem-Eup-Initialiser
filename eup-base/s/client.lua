local p = print
function credits() -- please dont remove this 😔
    p("made by vexxydevs :D ")
end



Citizen.CreateThread(function()
    credits()
end)





Citizen.CreateThread(function()
    p("all eup files loaded sucessfully (client-side)")
    credits()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPoliceIgnorePlayer(PlayerId(), true)
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetGarbageTrucks(false)
        SetRandomBoats(false)
    end
end)


-- repair veh script


local repairLocations = {
    { coords = vector3(134.531876, -1052.492310, 28.302612), name = "Repair Mechanic" },
    { coords = vector3(-211.397797, -1323.613159, 30.038086), name = "Repair Mechanic" },
    { coords = vector3(480.593414, -1317.507690, 28.336304), name = "Repair Mechanic" },
}

Citizen.CreateThread(function()
    for _, location in ipairs(repairLocations) do
        local repairBlip = AddBlipForCoord(location.coords)
        SetBlipSprite(repairBlip, 402) 
        SetBlipDisplay(repairBlip, 4)
        SetBlipScale(repairBlip, 1.2)
        SetBlipColour(repairBlip, 0) 
        SetBlipBright(repairBlip, true) 
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(location.name)
        EndTextCommandSetBlipName(repairBlip)
    end

    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId())

        for _, location in ipairs(repairLocations) do
            local distance = #(playerCoords - location.coords)

            if distance < 10.0 then
                DrawMarker(1, location.coords.x, location.coords.y, location.coords.z - 0.5, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.5, 0, 255, 0, 200, false, true, 2, false, nil, nil, false)

                if distance < 2.0 then
                    DisplayHelpText("Press ~INPUT_CONTEXT~ to repair your vehicle.")
                    if IsControlJustReleased(0, 38) then
                        local localPlayerPed = GetPlayerPed(-1)
                        local localVehicle = GetVehiclePedIsIn(localPlayerPed, false)
                        SetVehicleFixed(localVehicle)
                        exports['mythic_notify']:SendAlert('success', 'thankyou for using our services!')
                    end
                end
            end
        end
    end
end)

function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
