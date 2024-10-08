-- locales/fr.lua
local Translations = {
    ["Standard"] = "Standard",
    ["Large Circle"] = "Grand Cercle",
    ["Small Circle"] = "Petit Cercle",
    ["Police Officer"] = "Officier de Police",
    ["Police Area"] = "Zone de Police",
    ["Square"] = "Carré",
    ["Player Position"] = "Position du Joueur",
    ["North"] = "Nord",
    ["Waypoint"] = "Point de Cheminement",
    ["Large Circle Outline"] = "Contour Grand Cercle",
    ["Up Arrow Outline"] = "Flèche Haut Contour",
    ["Down Arrow Outline"] = "Flèche Bas Contour",
    ["Up Arrow"] = "Flèche Haut",
    ["Down Arrow"] = "Flèche Bas",
    ["Police Helicopter"] = "Hélicoptère de Police",
    ["Speech Bubble"] = "Bulle de Discussion",
    ["Garage"] = "Garage",
    ["Drugs"] = "Drogues",
    ["Store"] = "Magasin",
    ["Weapon"] = "Arme",
    ["Hospital"] = "Hôpital",
    ["Star"] = "Étoile",
    ["Flag"] = "Drapeau",
    ["Helicopter"] = "Hélicoptère",
    ["Boat"] = "Bateau",
    ["Parachute"] = "Parachute",
    ["Motorcycle"] = "Moto",
    ["Bicycle"] = "Vélo",
    ["Car"] = "Voiture",
    ["Truck"] = "Camion",
    ["Car Wash"] = "Lavage de Voiture",
    ["Clothing Store"] = "Magasin de Vêtements",
    ["Hair Salon"] = "Salon de Coiffure",
    ["Tattoo Parlor"] = "Salon de Tatouage",
    ["Bank"] = "Banque",
    ["ATM"] = "Distributeur Automatique",
    ["Restaurant"] = "Restaurant",
    ["Fire Station"] = "Caserne de Pompiers",
    ["Prison"] = "Prison",
    ["Airport"] = "Aéroport",
    ["Gas Station"] = "Station-service",
    ["Bar"] = "Bar",
    ["Amusement Park"] = "Parc d'Attractions",
    ["Cinema"] = "Cinéma",
    ["Museum"] = "Musée",
    ["Theater"] = "Théâtre",
    ["Park"] = "Parc",
    ["Hotel"] = "Hôtel",
    ["Bus Station"] = "Gare Routière",
    ["Train Station"] = "Gare",
    ["Subway Station"] = "Station de Métro",
    ["School"] = "École",
    ["College"] = "Collège",
    ["University"] = "Université",
    ["Library"] = "Bibliothèque",
    ["Church"] = "Église",
    ["Mosque"] = "Mosquée",
    ["Temple"] = "Temple",
    ["Synagogue"] = "Synagogue",
    ["Clinic"] = "Clinique",
    ["Pharmacy"] = "Pharmacie",
    ["Dental Office"] = "Cabinet Dentaire",
    ["Veterinary Clinic"] = "Clinique Vétérinaire",
    ["Police Station"] = "Poste de Police",
    ["Ambulance Station"] = "Poste Ambulancier",
    ["Government Building"] = "Bâtiment Gouvernemental",
    ["Court"] = "Tribunal",
    ["City Hall"] = "Hôtel de Ville",
    ["no_permission"] = "Vous n'avez pas la permission d'utiliser cette commande.",
    ["blip_desc"] = "Description du blip",
    ["next"] = "Suivant",
    ["blip_name"] = "Nom du Blip",
    ["blip_id"] = "ID du blip",
    ["blip_id_color"] = "ID de la couleur",
    ["blip_edit"] = "Modifier un blip",
    ["back"] = "Retour",
    ["close"] = "Fermer",
    ["blip_del"] = "Supprimer le blip",
    ["blip_create"] = "Créer un blip",
    
    
    ["script_loaded"] = "Le script a été chargé. Bienvenue",
    ["blip_loaded"] = "Blips chargé avec succès",
    ["blip_loaded_fail"] = "Échec du chargement des blips",
    ["blip_loaded_fails"] = "Un problème est survenu lors du chargement des Blips. \nVeuillez vérifier les fichiers",
    ["blip_save"] = "Blip Enregistré",
    ["blip_no_perms"] = " a tenté de créer un blip sans les autorisations nécessaires",
    ["blip_already_exist"] = " tenté de créer un blip déjà existant : ",
    ["blip_created"] = " pour créer le blip : "
}

if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
