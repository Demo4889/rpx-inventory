---wip types

---@class OxShop
---@field name string
---@field label? string
---@field blip? { id: number, colour: number, scale: number }
---@field inventory { name: string, price: number, count?: number, currency?: string }
---@field locations? vector3[]
---@field targets? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }[]
---@field groups? string | string[] | { [string]: number }
---@field model? number[]

return {
	General = {
		name = 'Shop',
		blip = {
			id = 1475879922, colour = 69, scale = 0.8
		},
		inventory = {
			{ name = 'consumable_apple', price = 1 },
			{ name = 'consumable_apricots_can', price = 2 },
			{ name = 'consumable_baked_beans_can', price = 2 },
			{ name = 'consumable_biscuit_box', price = 1 },
			{ name = 'consumable_candy_bag', price = 2 },
			{ name = 'consumable_chocolate_bar', price = 1 },
			{ name = 'consumable_cornedbeef_can', price = 2 },
			{ name = 'consumable_crackers', price = 1 },
			{ name = 'consumable_kidneybeans_can', price = 2 },
			{ name = 'consumable_peaches_can', price = 2 },
			{ name = 'consumable_peas_can', price = 2 },
			{ name = 'consumable_salmon_can', price = 5 },
			{ name = 'consumable_strawberries_can', price = 2 },
			{ name = 'consumable_beets', price = 1 },
			{ name = 'consumable_carrot', price = 1 },
			{ name = 'consumable_celery', price = 1 },
			{ name = 'consumable_corn', price = 1 },
			{ name = 'consumable_peach', price = 1 },
			{ name = 'consumable_pear', price = 1 },
		},
		targets = {
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(1330.36 , -1292.74, 77.02)  , heading = 65.0, distance = 2.0 }, -- Rhodes
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(2824.44 , -1319.39, 46.75)  , heading = 320.0, distance = 2.0 }, -- Saint Denis
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-785.80 , -1322.13, 43.88)  , heading = 182.0, distance = 2.0 }, -- Blackwater
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-3687.33, -2623.59, -13.43) , heading = 265.0, distance = 2.0 }, -- Armadillo
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-5485.94, -2937.86, -0.39)  , heading = 128.0, distance = 2.0 }, -- Tumbleweed
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-324.07 ,  803.66 , 117.88) , heading = 279.0, distance = 2.0 }, -- Valentine
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-1789.75, -388.12 , 160.32) , heading = 54.0, distance = 2.0 }, -- Strawberry
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(3025.71 ,  562.25 , 44.72)  , heading = 249.0, distance = 2.0 }, -- Van Horn
		}
	},
	Gunsmith = {
		name = 'Gunsmith',
		blip = {
			id = 4149098929, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'weapon_revolver_cattleman', price = 15 },
			{ name = 'weapon_rifle_varmint', price = 20 },
			{ name = 'ammo_rifle_normal', price = 5 },
			{ name = 'ammo_pistol_normal', price = 3 },
			{ name = 'ammo_repeater_normal', price = 5 },
			{ name = 'ammo_shotgun', price = 5 },
			{ name = 'ammo_revolver_normal', price = 2},
			{ name = 'ammo_arrow', price = 1},
		}, targets = {
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(-5506.36, -2964.00, -0.63), heading = 119.0, distance = 2.0 }, -- Armadillo
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(2717.2678, -1286.846, 49.636447), heading = 25.0, distance = 2.0 }, -- Saint Denis
			{ ped = "u_m_m_sdexoticsshopkeeper_01", loc = vec3(2948.413, 1319.382, 44.820), heading = 67.45, distance = 2.0}, -- Annesburg
		}
	},
	Butcher = {
		inventory = {
			{ name = 'consumable_jerky', price = 1 },
			{ name = 'consumable_jerky_venison', price = 2 },
			{ name = 'provision_meat_mature_venison', price = 5 },
			{ name = 'provision_meat_prime_beef', price = 5 },
			{ name = 'provision_meat_tender_pork', price = 5 },
		}
	}
}