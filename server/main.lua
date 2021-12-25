-- Chargement de la langue
local langue = Langues[Config.langue]

-- Fonction MeCommande
local function MeCommande(source, args)
    local text = "* " .. langue.prefixe .. table.concat(args, " ") .. " *"
    TriggerClientEvent('ffm_me:meSync', -1, text, source)
end

-- Enregistrement de la commande
RegisterCommand(langue.commandeNom, MeCommande)
