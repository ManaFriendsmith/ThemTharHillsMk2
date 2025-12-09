local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if not mods["scrap-industry"] then
    return
end

local item_sounds = require("__base__/prototypes/item_sounds")

data:extend({
      {
        type = "item",
        name = "gold-scrap",
        icon = "__ThemTharHillsMk2__/graphics/icons/gold-scrap.png",
        icon_size = 64,
        subgroup = "production-scrap",
        order = "a[material]-f[gold]",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        default_import_location = "nauvis",
        canonical_cost = 1,
        weight = 2*kg
      },
      {
        type = "recipe",
        name = "gold-plate-from-scrap",
        icons = {
            {
                icon = "__ThemTharHillsMk2__/graphics/icons/gold-scrap.png",
                icon_size = 64,
                shift = {-4, -4}
            },
            {
                icon = "__ThemTharHillsMk2__/graphics/icons/gold-plate.png",
                icon_size = 64,
                shift = {4, 4}
            }
        },
        hide_from_player_crafting = true,
        subgroup = "production-scrap",
        order = "b[smelting]-f[gold]",
        category = "smelting",
        energy_required = 3.2,
        allow_productivity = true,
        enabled = true,
        ingredients = {
            {type="item", name="gold-scrap", amount=4}
        },
        results = {
            {type="item", name="gold-plate", amount=1}
        }
      }
})

if mods["space-age"] then
    data:extend({
        {
            type = "recipe",
            name = "molten-gold-from-scrap",
            icons = {
                {
                    icon = "__ThemTharHillsMk2__/graphics/icons/gold-scrap.png",
                    icon_size = 64,
                    shift = {-4, -4}
                },
                {
                    icon = "__pf-sa-compat__/graphics/icons/molten-gold.png",
                    icon_size = 64,
                    shift = {4, 4}
                }
            },
            hide_from_player_crafting = true,
            subgroup = "production-scrap",
            order = "e[melting]-f[molten-gold]",
            category = "metallurgy",
            energy_required = 64,
            allow_productivity = true,
            enabled = false,
            ingredients = {
                {type="item", name="gold-scrap", amount=50}
            },
            results = {
                {type="fluid", name="molten-gold", amount=100}
            }
        }
    })
end
