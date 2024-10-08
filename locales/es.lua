-- locales/es.lua
local Translations = {
    ["Standard"] = "Estándar",
    ["Large Circle"] = "Círculo Grande",
    ["Small Circle"] = "Círculo Pequeño",
    ["Police Officer"] = "Oficial de Policía",
    ["Police Area"] = "Área de Policía",
    ["Square"] = "Cuadrado",
    ["Player Position"] = "Posición del Jugador",
    ["North"] = "Norte",
    ["Waypoint"] = "Punto de Ruta",
    ["Large Circle Outline"] = "Contorno Círculo Grande",
    ["Up Arrow Outline"] = "Flecha Arriba Contorno",
    ["Down Arrow Outline"] = "Flecha Abajo Contorno",
    ["Up Arrow"] = "Flecha Arriba",
    ["Down Arrow"] = "Flecha Abajo",
    ["Police Helicopter"] = "Helicóptero de Policía",
    ["Speech Bubble"] = "Burbuja de Diálogo",
    ["Garage"] = "Garaje",
    ["Drugs"] = "Drogas",
    ["Store"] = "Tienda",
    ["Weapon"] = "Arma",
    ["Hospital"] = "Hospital",
    ["Star"] = "Estrella",
    ["Flag"] = "Bandera",
    ["Helicopter"] = "Helicóptero",
    ["Boat"] = "Barco",
    ["Parachute"] = "Paracaídas",
    ["Motorcycle"] = "Motocicleta",
    ["Bicycle"] = "Bicicleta",
    ["Car"] = "Coche",
    ["Truck"] = "Camión",
    ["Car Wash"] = "Lavado de Coches",
    ["Clothing Store"] = "Tienda de Ropa",
    ["Hair Salon"] = "Salón de Belleza",
    ["Tattoo Parlor"] = "Tatuajes",
    ["Bank"] = "Banco",
    ["ATM"] = "Cajero Automático",
    ["Restaurant"] = "Restaurante",
    ["Fire Station"] = "Estación de Bomberos",
    ["Prison"] = "Prisión",
    ["Airport"] = "Aeropuerto",
    ["Gas Station"] = "Gasolinera",
    ["Bar"] = "Bar",
    ["Amusement Park"] = "Parque de Atracciones",
    ["Cinema"] = "Cine",
    ["Museum"] = "Museo",
    ["Theater"] = "Teatro",
    ["Park"] = "Parque",
    ["Hotel"] = "Hotel",
    ["Bus Station"] = "Estación de Autobuses",
    ["Train Station"] = "Estación de Tren",
    ["Subway Station"] = "Estación de Metro",
    ["School"] = "Escuela",
    ["College"] = "Colegio",
    ["University"] = "Universidad",
    ["Library"] = "Biblioteca",
    ["Church"] = "Iglesia",
    ["Mosque"] = " mezquita",
    ["Temple"] = "Templo",
    ["Synagogue"] = "Sinagoga",
    ["Clinic"] = "Clínica",
    ["Pharmacy"] = "Farmacia",
    ["Dental Office"] = "Consultorio Dental",
    ["Veterinary Clinic"] = "Clínica Veterinaria",
    ["Police Station"] = "Estación de Policía",
    ["Ambulance Station"] = "Estación de Ambulancias",
    ["Government Building"] = "Edificio Gubernamental",
    ["Court"] = "Tribunal",
    ["City Hall"] = "Ayuntamiento",
    ["no_permission"] = "No tienes permiso para usar este comando.",
    ["blip_desc"] = "Descripción del blip",
    ["next"] = "Siguiente",
    ["blip_name"] = "Nombre del Blip",
    ["blip_id"] = "ID del blip",
    ["blip_id_color"] = "ID del color",
    ["blip_edit"] = "Editar un blip",
    ["back"] = "Volver",
    ["close"] = "Cerrar",
    ["blip_del"] = "Eliminar el blip",
    ["blip_create"] = "Crear un blip",
    
    ["script_loaded"] = " ha sido cargado. Bienvenido",
    ["blip_loaded"] = "Blips cargados con éxito",
    ["blip_loaded_fail"] = "Error al cargar los blips",
    ["blip_loaded_fails"] = "Ocurrió un problema al cargar los Blips. \nPor favor verifica los archivos",
    ["blip_save"] = "Blip Guardado",
    ["blip_no_perms"] = " intentó crear un blip sin los permisos necesarios",
    ["blip_already_exist"] = " intentó crear un blip que ya existe: ",
    ["blip_created"] = " para crear el blip: "
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
