if not lib then return end

local Weapon = {}
local Items = require 'modules.items.client'
local Utils = require 'modules.utils.client'

function Weapon.Equip(item, data)
	local playerPed = cache.ped
	local coords = GetEntityCoords(playerPed, true)

	item.hash = GetHashKey(data.name)
	item.ammo = data.ammo
	item.melee = 0
	item.timer = 0
	item.throwable = data.throwable
	item.group = Citizen.InvokeNative(0xEDCA14CA5199FF25, item.hash)

	local ammo = item.metadata.ammo or item.throwable and 1 or 0
	-- Create an object instead of adding the weapon directly to ped
	-- Allows the components and ammo to be set more smoothly
	GiveWeaponToPed(playerPed, item.hash, 1, 1, 1, 0, false, 0.5, 1.0, 0, false, 0.0, false)
	SetPedAmmo(playerPed, item.hash, ammo)

	-- Sometimes the ammo fills or splits into reserves instead of loading into the weapon
	-- Refilling without a timeout tends to lead to the weapon jamming
	-- SetTimeout(0, function() RefillAmmoInstantly(playerPed) end)

	Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), item.hash, 1, 1, 1, 0, false, 0.5, 1.0, 752097756, 0, true, 0.0)
	Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), item.hash, 0, 0, 0, 0)


	Utils.ItemNotify({ item, 'ui_equipped' })
	return item
end

function Weapon.Disarm(currentWeapon, noAnim)
	if currentWeapon?.timer then
		currentWeapon.timer = nil

		TriggerServerEvent('rpx-inventory:updateWeapon')

		SetPedAmmo(cache.ped, currentWeapon.hash, 0)
		GiveDelayedWeaponToPed(PlayerPedId(), currentWeapon.hash, 0, true, 0)

		Utils.ItemNotify({ currentWeapon, 'ui_holstered' })
	end

	-- Utils.WeaponWheel()
	-- RemoveAllPedWeapons(cache.ped, true, true)
	Citizen.InvokeNative(0x94A3C1B804D291EC, cache.ped)
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, cache.ped, 2, false)
end

function Weapon.ClearAll(currentWeapon)
	Weapon.Disarm(currentWeapon)
end

Utils.Disarm = Weapon.Disarm
Utils.ClearWeapons = Weapon.ClearAll

return Weapon
