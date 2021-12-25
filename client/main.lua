local c             = Config                    -- Chargement de la configuration
local langue        = Langues[Config.langue]    -- Chargement de la langue
local GetGameTimer  = GetGameTimer              -- Chargement du temps

-- Fonction draw3dText
local function draw3dText(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(c.couleur.r, c.couleur.g, c.couleur.b, c.couleur.a)
    SetTextScale(0.0, c.taille * scale)
    SetTextFont(c.police)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Fonction displayText
local function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local distance  = #(playerPos - targetPos)
    local los       = HasEntityClearLosToEntity(playerPed, ped, 17)

    if distance <= c.distance and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer() + c.duree,
            text = text
        }

        if not exists then
            local display = true

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
                draw3dText(pos, peds[ped].text)
                display = GetGameTimer() <= peds[ped].time
            end

            peds[ped] = nil
        end

    end
end

-- Fonction MeSync
local function MeSync(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, text)
    end
end

-- Enregistrement de l'évènement
RegisterNetEvent('ffm_me:meSync', MeSync)

-- Suggestion du chat
TriggerEvent('chat:addSuggestion', '/' .. langue.commandeNom, langue.commandeDescription, langue.commandeSuggestion)
