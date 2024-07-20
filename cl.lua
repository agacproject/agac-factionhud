local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('deniz:load')
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            TriggerEvent('agac-factionhud:load')
        end
    end)
end)

RegisterCommand('debughud', function()
    TriggerEvent('agac-factionhud:load')
end)

RegisterNetEvent('agac-factionhud:load', function()
    local loadData = {
        cash = QBCore.Functions.GetPlayerData().money.cash,
        health = GetEntityHealth(PlayerPedId()) / 2,
        stamina = math.ceil(100 - GetPlayerSprintStaminaRemaining(PlayerId())),
        armor = GetPedArmour(PlayerPedId())
    }
    SendNUIMessage({
        type = 'updateHud',
        data = loadData
    })
end)
