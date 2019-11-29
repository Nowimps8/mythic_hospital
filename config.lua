Config = Config or {}
Config.Debug = false

-- Keys
Config.Keys = {}
Config.Keys.GetUp = 73 -- Key Used To Get Out Of Bed When Using /bed Command
Config.Keys.Revive = 54 -- Key Used To Revive Or Teleport

--[[
    GENERAL SETTINGS | THESE WILL AFFECT YOUR ENTIRE SERVER SO BE SURE TO SET THESE CORRECTLY
    MaxHp : Maximum HP Allowed, set to -1 if you want to disable mythic_hospital from setting this
        NOTE: Anything under 100 and you are dead
    RegenRate : 
]]
Config.MaxHp = 200
Config.RegenRate = 0.0

--[[
    HiddenRevChance : The % Chance That Using The Hidden Revive Spot Will Result In A Full Revive With All Limb Damage & Bleeds Removed
    HiddenCooldown : The time, in minutes, for how long a player must wait before using the hidden revive spot again
]]
Config.HiddenRevChance = 65
Config.HiddenCooldown = 30

--[[
    Pricing
]]
Config.InjuryBase = 100
Config.HiddenInjuryBase = 1000

--[[
    AlertShowInfo : 
]]
Config.AlertShowInfo = 2

--[[

]]
Config.Hospital = {
    Location = { x = 308.06161499023, y = -595.19683837891, z = 43.291839599609, h = 180.4409942627 },
    ShowBlip = true,
}
Config.Hospital.Blip = { name = "Pillbox Medical Center", color = 38, id = 153, scale = 1.0, short = false, x = Config.Hospital.Location.x, y = Config.Hospital.Location.y, z = Config.Hospital.Location.z }

--[[
    Hidden: Location of the hidden location where you can heal and no alert of GSW's will be made.
]]

Config.Hidden = {
    Location = { x = 1969.2971191406, y = 3815.6735839844, z = 33.428680419922 },
    ShowBlip = true,
}
Config.Hidden.Blip = { name = 'Hidden Medic', color = 12, id = 153, scale = 1.0, short = false, x = Config.Hidden.Location.x, y = Config.Hidden.Location.y, z = Config.Hidden.Location.z }

Config.Teleports = {
    { x = 298.57528686523, y = -599.33715820313, z = 43.292068481445, h = 338.03997802734, destination = 3, range = 2, text = Config.Strings.TeleportLower },
    { x = 309.68832397461, y = -602.75939941406, z = 43.291839599609, h = 67.832542419434, destination = 4, range = 2, text = Config.Strings.TeleportRoof },
    { x = 357.58139038086, y = -590.75146484375, z = 28.788959503174, h = 245.51211547852, destination = 1, range = 5, text = Config.Strings.TeleportEnter },
    { x = 338.8362121582, y = -583.79595947266, z = 74.165649414063, h = 247.53303527832, destination = 2, range = 2, text = Config.Strings.TeleportEnter },
}