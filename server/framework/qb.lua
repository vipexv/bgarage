if GetResourceState("qb-core") ~= "started" then return end

local _, QBCore = pcall(exports["qb-core"].getSharedObject) --[[@as table | false]]

if not QBCore then return end

---@param source integer
---@return table
function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

---@param identifier string
---@return table
function GetPlayerFromIdentifier(identifier)
    return QBCore.Functions.GetPlayerFromCitizenId(identifier)
end

---@param player table
---@return string
function GetIdentifier(player)
    return player.PlayerData.citizenid
end

---@param identifier string
---@return string
function IdentifierTypeConversion(identifier)
    return identifier
end

---@param player table
---@return string
function GetFullName(player)
    return player.PlayerData.firstname .. " " .. player.PlayerData.lastName
end

---@param source integer
---@return number
function GetMoney(source)
    local player = GetPlayerFromId(source)
    if not player then return 0 end

    return player.PlayerData.money.cash
end

---@param source integer
---@param amount number
function RemoveMoney(source, amount)
    local player = GetPlayerFromId(source)
    if not player then return end

    player.Functions.RemoveMoney("cash", amount)
end

---@param source integer
---@param message string
---@param duration? integer
---@param position? string
---@param _type? string
---@param icon? string
---@param iconColor? string
function Notify(source, message, duration, position, _type, icon, iconColor)
    return lib.notify(source, {
        title = locale("notification_title"),
        description = message,
        duration = duration,
        position = position,
        type = _type,
        icon = icon,
        iconColor = iconColor,
    })
end
