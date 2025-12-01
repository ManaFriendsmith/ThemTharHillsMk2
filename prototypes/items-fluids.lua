local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")
local item_sounds = require("__base__/prototypes/item_sounds")
local space_age_item_sounds = "foo"

data:extend({
    {
        type = "item",
        name = "gold-ore",
        icon = "__ThemTharHills__/graphics/icons/gold-ore.png",
        icon_size = 64,
        mipmap_count = 4,
        pictures = {
          { size = 64, filename = "__ThemTharHills__/graphics/icons/gold-ore.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/gold-ore-1.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/gold-ore-2.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/gold-ore-3.png", scale = 0.5, mipmap_count = 4 }
        },
        subgroup = "raw-resource",
        order = "fc", -- f = copper
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
        type = "fluid",
        name = "nitric-acid",
        icon = "__ThemTharHills__/graphics/icons/nitric-acid.png",
        icon_size = 64,
        subgroup = "fluid",
        order = "a[fluid]-b[oil]-g",
        canonical_cost = 0.15,
        default_temperature = 15,
        base_color = {0.7, 0.7, 1, 1},
        flow_color = {0.8, 0.9, 0.9, 1},
        visualization_color = {0.7, 0.7, 1, 1}
      },
      {
        type = "fluid",
        name = "depleted-acid",
        icon = "__ThemTharHills__/graphics/icons/depleted-acid.png",
        icon_size = 64,
        subgroup = "fluid",
        order = "a[fluid]-b[oil]-h",
        canonical_cost = 0.003,
        default_temperature = 15,
        base_color = {0.0, 0.7, 1, 1},
        flow_color = {0.7, 0.8, 0.9, 1},
        visualization_color = {0.0, 0.7, 1, 1}
      },
      {
        type = "item",
        name = "gold-powder",
        icon = "__ThemTharHills__/graphics/icons/gold-powder.png",
        subgroup = "raw-resource",
        order = "fca",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        canonical_cost = 0.5,
        weight = 1*kg
      },
      {
        type = "item",
        name = "gold-plate",
        icon = "__ThemTharHills__/graphics/icons/gold-plate.png",
        subgroup = "raw-material",
        order = "a[smelting]-bd",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        drop_sound = item_sounds.metal_small_inventory_move,
        stack_size = 100,
        default_import_location = "nauvis",
        canonical_cost = 1.5,
        weight = 2*kg
      },
      {
        type = "item",
        name = "gold-wire",
        icon = "__ThemTharHills__/graphics/icons/gold-wire.png",
        subgroup = "intermediate-product",
        order = "a[basic-intermediates]-ca",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        default_import_location = "nauvis",
        weight = 0.5*kg
      },
      {
        type = "item",
        name = "integrated-circuit",
        icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
        subgroup = "intermediate-product",
        order = "b[circuits]-d",
        color_hint = { text = "G" },
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move,
        stack_size = 200,
        default_import_location = "nauvis",
        weight = 0.5*kg
      }
})

if mods["LunarLandings"] and not mods["BrassTacks"] then
  data:extend({
    {
        type = "item",
        name = "cheese-ore",
        icon = "__ThemTharHills__/graphics/icons/cheese-ore.png",
        icon_size = 64,
        mipmap_count = 4,
        pictures = {
          { size = 64, filename = "__ThemTharHills__/graphics/icons/cheese-ore.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/cheese-ore-1.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/cheese-ore-2.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__ThemTharHills__/graphics/icons/cheese-ore-3.png", scale = 0.5, mipmap_count = 4 }
        },
        subgroup = "raw-resource",
        order = "faq", -- f = copper
        color_hint = { text = "C" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        canonical_cost = 1,
        weight = 2*kg
      }
  })
end

if mods["space-age"] then
    space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
    data:extend({
        {
            type = "fluid",
            name = "molten-gold",
            icon = "__pf-sa-compat__/graphics/icons/molten-gold.png",
            icon_size = 64,
            subgroup = "fluid",
            order = "b[new-fluid]-b[vulcanus]-e",
            auto_barrel = false,
            default_temperature = 1070,
            max_temperature = 2000,
            base_color = {1, 0.85, 0, 1},
            flow_color = {1, 1, 0.5, 1},
            visualization_color = {1, 0.85, 0, 1}
        },
        {
            type = "item",
            name = "neural-bioculture",
            icon = "__ThemTharHills__/graphics/icons/neural-bioculture.png",
            subgroup = data.raw.item["stem-cells"] and "original-dint" or "agriculture-products",
            order = data.raw.item["stem-cells"] and "b" or "c[eggs]-c",
            color_hint = { text = "G" },
            inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
            pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
            drop_sound = space_age_item_sounds.agriculture_inventory_move,
            stack_size = 200,
            default_import_location = "gleba",
            weight = 0.5*kg,
            spoil_ticks = misc.difficulty == 3 and (1 * minute) or (2 * minute),
            canonical_cost = 0.5,
            spoil_result = "gold-wire"
        }
    })
end

if misc.difficulty == 1 then
  return
end

data:extend({
  {
    type = "item",
    name = "stepper-motor",
    icon = "__ThemTharHills__/graphics/icons/stepper-motor.png",
    subgroup = "intermediate-product",
    order = "b[circuits]-3",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    stack_size = 100,
    default_import_location = "nauvis",
    weight = 2*kg
  },
  {
    type = "item",
    name = "transceiver",
    icon = "__ThemTharHills__/graphics/icons/transceiver.png",
    subgroup = "intermediate-product",
    order = "b[circuits]-4",
    inventory_move_sound = item_sounds.rocket_control_inventory_move,
    pick_sound = item_sounds.rocket_control_inventory_pickup,
    drop_sound = item_sounds.rocket_control_inventory_move,
    stack_size = 100,
    default_import_location = "nauvis",
    weight = 2*kg
  },
  {
    type = "item",
    name = "heavy-cable",
    icon = "__ThemTharHills__/graphics/icons/heavy-cable.png",
    subgroup = "intermediate-product",
    order = "b[circuits]-5",
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 100,
    default_import_location = "nauvis",
    weight = 2*kg
  },
})

if misc.difficulty == 2 then
  return
end

data:extend({
  {
    type = "item",
    name = "semiboloid-stator",
    icon = "__ThemTharHills__/graphics/icons/semiboloid-stator.png",
    subgroup = "intermediate-product",
    order = "b[circuits]-25",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
    default_import_location = "nauvis",
    weight = 1*kg
  }
})

if mods["space-age"] then
  data:extend({
    {
      type = "item",
      name = "hydrocoptic-marzelvane",
      icon = "__ThemTharHills__/graphics/icons/hydrocoptic-marzelvane.png",
      subgroup = mods["maraxsis"] and "maraxsis-salt" or "aquilo-processes",
      order = mods["maraxsis"] and "ga" or "c[lithium]-b2",
      inventory_move_sound = item_sounds.fluid_inventory_move,
      pick_sound = item_sounds.fluid_inventory_pickup,
      drop_sound = item_sounds.fluid_inventory_move,
      stack_size = 50,
      default_import_location = "aquilo",
      weight = 10*kg
    }
  })
end