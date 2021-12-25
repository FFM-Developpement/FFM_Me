Config = {
    langue                  = 'fr',                                                             -- Sélection de la langue
    couleur                 = { r = 230, g = 230, b = 230, a = 255 },                           -- Couleur du texte
    police                  = 2,                                                                -- Police du texte
    duree                   = 5000,                                                             -- Durée d'affichage en MS
    taille                  = 0.5,                                                              -- Taille du texte
    distance                = 250                                                               -- Distance d'affichage
}

Langues = {
    ['fr'] = {
        commandeNom         = 'me',                                                             -- Nom de la commande
        commandeDescription = 'Effectuer une action.',                                          -- Description de la commande
        commandeSuggestion  = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},   -- Suggestion du chat
        prefixe             = 'la personne '                                                    -- Préfixe
    }
}
