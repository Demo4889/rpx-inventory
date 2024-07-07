if not lib then return end

local Items = require 'modules.items.shared' --[[@as { [string]: OxClientItem }]]

local function displayMetadata(metadata, value)
	local data = metadata
	if type(metadata) == 'string' and value then data = { [metadata] = value } end
	SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end
exports('displayMetadata', displayMetadata)

local function GetItem(item)
	if item then
		item = string.lower(item)
		--if item:sub(0, 7) == 'weapon_' then item = string.lower(item) end
		return Items[item]
	end
	return Items
end

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------
Item('consumable_jerky', function(data, slot)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
	local health = GetEntityHealth(playerPed)
	inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(playerPed, math.min(maxHealth, math.floor(health + maxHealth / 16)))
			lib.notify({ description = 'You feel better already' })
		end
	end)
end)

Item('consumable_jerky_venison', function(data, slot)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
	local health = GetEntityHealth(playerPed)
	inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(playerPed, math.min(maxHealth, math.floor(health + maxHealth / 16)))
			lib.notify({ description = 'You feel better already' })
		end
	end)
end)

Item('goldpan', function(data, slot)
	inventory:useItem(data, function(data)
		if data then
			exports['rpx-goldpan']:EnablePanningMode()
		end
	end)
end)

Item('campkit', function(data, slot)
	inventory:useItem(data, function(data)
		if data then
			TriggerEvent("rpx-camps:client:CheckTownPerimeter")
		end
	end)
end)

-----------------------------------------------------------------------------------------------

exports('Items', GetItem)
exports('ItemList', GetItem)

return Items
