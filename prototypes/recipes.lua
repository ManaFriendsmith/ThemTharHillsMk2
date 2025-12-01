local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")
local item_sounds = require("__base__/prototypes/item_sounds")
local space_age_item_sounds = "foo"

data:extend({
    {
        type = "recipe",
        name = "nitric-acid",
        category = mods["space-age"] and "organic-or-chemistry" or "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-c",
        ingredients = {
            {type="item", name="copper-plate", amount=1},
            {type="item", name="stone", amount=2},
            {type="fluid", name="sulfuric-acid", amount=10},
            {type="fluid", name="water", amount=100}
        },
        results = {
            {type="fluid", name="nitric-acid", amount=100}
        },
        energy_required = 2,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.5, 0.75, 1, 1},
            secondary = {1, 1, 1, 1},
            tertiary = {0.25, 0.5, 1, 1},
            quaternary = {1, 1, 1, 1}
          }
    },
    {
        type = "recipe",
        name = "depleted-acid-reprocessing",
        category = mods["space-age"] and "chemistry-or-cryogenics" or "chemistry",
        icon = "__ThemTharHills__/graphics/icons/depleted-acid.png",
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "c[oil-products]-d",
        ingredients = {
            {type="fluid", name="depleted-acid", amount=150},
            {type="fluid", name="water", amount=50}
        },
        results = {
            {type="item", name="gold-powder", amount=1}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0, 0.6, 0.8, 1},
            secondary = {0, 1, 1, 1},
            tertiary = {0.5, 1, 1, 1},
            quaternary = {0.4, 0.4, 0.8, 1}
          }
    },
    {
        type = "recipe",
        name = "gold-powder",
        category = mods["space-age"] and "chemistry-or-metallurgy" or "chemistry",
        ingredients = {
            {type="item", name="gold-ore", amount=1},
            {type="fluid", name="nitric-acid", amount=10}
        },
        results = {
            {type="item", name="gold-powder", amount=2},
            {type="fluid", name="depleted-acid", amount=10},
        },
        main_product = "gold-powder",
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.75, 0.7, 0, 1},
            secondary = {1, 0.95, 0, 1},
            tertiary = {0.5, 0.5, 1, 1},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "trace-metals-from-copper",
        category = mods["space-age"] and "chemistry-or-metallurgy" or "chemistry",
        icons = {
            {
              icon = "__ThemTharHills__/graphics/icons/gold-powder.png",
              icon_size = 64
            },
            {
              icon = "__base__/graphics/icons/copper-ore.png",
              icon_size = 64,
              icon_mipmaps = 4,
              scale = 0.25,
              shift = {-8, -8}
            }
          },
        ingredients = {
            {type="item", name="copper-ore", amount=3},
            {type="fluid", name="nitric-acid", amount=30}
        },
        results = {
            {type="item", name="gold-powder", amount=1},
            {type="fluid", name="depleted-acid", amount=30},
        },
        main_product = "gold-powder",
        energy_required = 1,
        allow_productivity = true,
        enabled = false,
        crafting_machine_tint = {
            primary = {0.75, 0.4, 0, 1},
            secondary = {1, 0.65, 0, 1},
            tertiary = {0.5, 0.5, 1, 1},
            quaternary = {1, 1, 1, 1}
        }
    },
    {
        type = "recipe",
        name = "gold-plate",
        category = "smelting",
        ingredients = {
            {type="item", name="gold-powder", amount=3},
        },
        results = {
            {type="item", name="gold-plate", amount=1}
        },
        energy_required = 3.2,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "gold-wire",
        category = mods["space-age"] and "electronics" or "crafting",
        ingredients = {
            {type="item", name="gold-plate", amount=1},
        },
        results = {
            {type="item", name="gold-wire", amount=2}
        },
        energy_required = 0.5,
        lasermill_vanilla = {helium = -1},
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "integrated-circuit",
        category = mods["space-age"] and "electronics-with-fluid" or "crafting-with-fluid",
        ingredients = {
            {type="item", name="gold-plate", amount=2},
            {type="item", name="copper-plate", amount=2},
            {type="item", name="plastic-bar", amount=1},
            {type="fluid", name="sulfuric-acid", amount=1},
        },
        results = {
            {type="item", name="integrated-circuit", amount=2},
            {type="fluid", name="depleted-acid", amount=1}
        },
        main_product = "integrated-circuit",
        lasermill_vanilla = {helium = misc.difficulty == 3 and -0.4 or -1, convert = (misc.difficulty == 3 and not mods["LunarLandings"]), unlock="processing-unit"},
        lasermill_dlc = {helium = -1},
        energy_required = 1,
        allow_productivity = true,
        enabled = false
    }
})

if mods["LunarLandings"] then
    if mods["BrassTacks"] then
        rm.RemoveProduct("cheese-ore-processing", "zinc-ore", 5)
        rm.AddProduct("cheese-ore-processing", "gold-ore", 5)
    else
        data:extend({
            {
                type = "recipe",
                name = "cheese-ore-processing",
                category = "ll-electric-smelting",
                subgroup = "ll-raw-material-moon",
                order = "a[moon-rock]-d",
                icon = "__BrassTacks__/graphics/icons/cheese-ore.png",
                icon_size = 64,
                energy_required = 10,
                ingredients = {
                    {type="item", name="cheese-ore", amount=20}
                },
                results = {
                    {type="item", name="gold-ore", amount=10},
                    {type="item", name="ll-moon-rock", amount=3},
                    {type="fluid", name="light-oil", amount=10, fluidbox_index = 1}
                },
                always_show_products = true,
                enabled = false
            }
        })
    end
    if mods["space-age"] then
        data:extend({
            {
                type = "recipe",
                name = "vulcanus-silica",
                category = "metallurgy",
                subgroup = "ll-raw-material-moon",
                order = "a[silica]-b",
                icon = "__LunarLandings__/graphics/icons/silica.png",
                icon_size = 64,
                energy_required = 5,
                ingredients = {
                    {type="item", name="stone", amount=20},
                    {type="item", name="calcite", amount=2},
                    {type="fluid", name="lava", amount=100}
                },
                results = {
                    {type="item", name="ll-silica", amount=1}
                },
                enabled = false
            }
        })
    end
end

if mods["LunarLandings"] then
    data:extend({
        {
        type = "recipe",
        name = "astral-acid-recovery",
        category = "chemistry",
        icons = {
            {
                icon = "__ThemTharHills__/graphics/icons/depleted-acid.png",
                icon_size = 64
            },
            {
                icon = "__LunarLandings__/graphics/fluid/astroflux.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.33
            }
        },
        icon_size = 64,
        subgroup = "fluid-recipes",
        order = "c[oil-products]-da",
        energy_required = 10,
        allow_decomposition = false,
        allow_productivity = true,
        ingredients = {
            {type="fluid", name="depleted-acid", amount=600},
            {type="fluid", name="ll-astroflux", amount=1}
        },
        results = {
            {type="fluid", name="sulfuric-acid", amount=15},
            {type="item", name="copper-ore", amount=1}
        },
        crafting_machine_tint = {
            primary = {0, 1, 1, 1},
            secondary = {0.5, 0, 1, 1},
            tertiary = {0, 1, 1, 1},
            quaternary = {0.3, 0, 0.75, 1}
        },
        enabled = false
        }
    })
end

if mods["space-age"] then
    if data.raw.item["stem-cells"] then
        data:extend({
            {
                type = "recipe",
                name = "neural-bioculture",
                category = "organic",
                ingredients = {
                    {type="item", name="stem-cells", amount=4},
                    {type="item", name="philosophers-hormone", amount=1}
                },
                results = {
                    {type="item", name="neural-bioculture", amount=4}
                },
                energy_required = 2,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {1, 1, 0, 1},
                    secondary = {0.8, 0.8, 0.4, 1}
                }
            }    
        })
    else
        data:extend({
            {
                type = "recipe",
                name = "neural-bioculture",
                category = "organic",
                ingredients = {
                    {type="item", name="pentapod-egg", amount=1},
                },
                results = {
                    {type="item", name="neural-bioculture", amount=8}
                },
                energy_required = 4,
                allow_productivity = true,
                enabled = false,
                crafting_machine_tint = {
                    primary = {1, 1, 0, 1},
                    secondary = {0.8, 0.8, 0.4, 1}
                }
            }    
        })
    end

    if 1 == 2 then
        data.raw.item["gold-plate"].localised_description = {"recipe-description.hint-nonstandard-recycling"}

        data:extend({
            {
                type = "recipe",
                name = "custom-gold-plate-recycling",
                localised_name = {"recipe-name.recycling", {"item-name.gold-plate"}},
                icons = {
                          {
                            icon = "__quality__/graphics/icons/recycling.png",
                            icon_size = 64
                          },
                          {
                            icon = "__ThemTharHills__/graphics/icons/gold-plate.png",
                            icon_size = 64
                          },
                          {
                            icon = "__quality__/graphics/icons/recycling-top.png",
                            icon_size = 64
                          }
                },
                category = "recycling",
                ingredients = {
                    {type="item", name="gold-plate", amount=1}
                },
                results = {
                    {type="item", name="gold-powder", amount=1, probability = 0.18}
                },
                bespoke = "gold-plate",
                energy_required = 6.4/16,
                allow_productivity = false,
                enabled = true,
                hidden = true,
                allow_decomposition = false,
                unlock_results = false
            }
        })
    end

    data:extend({
        {
            type = "recipe-category",
            name = "chemistry-or-metallurgy",
            can_recycle = false
        },
        {
            type = "recipe",
            name = "neural-microchip",
            category = "electronics",
            icons = {
                {
                    icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
                    icon_size = 64
                },
                {
                    icon = "__ThemTharHills__/graphics/icons/neural-bioculture.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {8, 8}
                },
            },
            ingredients = {
                {type="item", name="neural-bioculture", amount=2},
                {type="item", name="copper-plate", amount=2},
                {type="item", name="plastic-bar", amount=1}
            },
            results = {
                {type="item", name="integrated-circuit", amount=2}
            },
            energy_required = 1,
            lasermill_dlc = {helium = -1, unlock="neural-electronics"},
            allow_productivity = true,
            auto_recycle = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "neural-conductor",
            category = "electromagnetics",
            icons = {
                {
                    icon = "__base__/graphics/icons/copper-cable.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__ThemTharHills__/graphics/icons/neural-bioculture.png",
                    icon_size = 64,
                    scale = 0.25,
                    shift = {8, 8}
                },
            },
            ingredients = {
                {type="item", name="neural-bioculture", amount=1}
            },
            results = {
                {type="item", name="copper-cable", amount_min=1, amount_max=4}
            },
            energy_required = 1,
            allow_productivity = true,
            auto_recycle = false,
            enabled = false
        },
        {
            type = "recipe",
            name = "molten-gold",
            category = "metallurgy",
            icon = "__pf-sa-compat__/graphics/icons/gold-powder-melting.png",
            icon_size = 64,
            subgroup = "vulcanus-processes",
            order = "a[melting]-e",
            ingredients = {
                {type="item", name="gold-powder", amount=150}
            },
            results = {
                {type="fluid", name="molten-gold", amount=500}
            },
            energy_required = 8,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "molten-gold-from-lava",
            icon = "__pf-sa-compat__/graphics/icons/molten-gold-from-lava.png",
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "vulcanus-processes",
            order = "a[melting]-a[lava-e]",
            category = "metallurgy",
            ingredients = {
                {type="fluid", name="lava", amount=500, fluidbox_multiplier=10},
                {type="fluid", name="nitric-acid", amount=500, fluidbox_multiplier=10},
                {type="item", name="calcite", amount=1}
            },
            results = {
                {type="fluid", name="molten-gold", amount=250, fluidbox_multiplier=10},
                {type="fluid", name="depleted-acid", amount=500, fluidbox_multiplier=10},
                {type="item", name="stone", amount=15},
            },
            energy_required = 16,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "casting-gold",
            category = "metallurgy",
            icon = "__pf-sa-compat__/graphics/icons/casting-gold.png",
            icon_size = 64,
            subgroup = "vulcanus-processes",
            order = "b[casting]-d",
            ingredients = {
                {type="fluid", name="molten-gold", amount=20}
            },
            results = {
                {type="item", name="gold-plate", amount=2}
            },
            energy_required = 3.2,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "casting-gold-wire",
            category = "metallurgy",
            icon = "__pf-sa-compat__/graphics/icons/casting-gold-wire.png",
            icon_size = 64,
            subgroup = "vulcanus-processes",
            order = "b[casting]-i",
            ingredients = {
                {type="fluid", name="molten-gold", amount=5}
            },
            results = {
                {type="item", name="gold-wire", amount=2}
            },
            energy_required = 1,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "depleted-acid-reprocessing-with-calcite",
            category = "chemistry-or-cryogenics",
            subgroup = "fluid-recipes",
            icons = {
                {
                    icon = "__ThemTharHills__/graphics/icons/depleted-acid.png",
                    icon_size = 64,        
                },
                {
                    icon = "__space-age__/graphics/icons/calcite.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.33,
                    shift = {0, 4}
                }
            },
            order = "c[oil-products]-d",
            ingredients = {
                {type="fluid", name="depleted-acid", amount=1500},
                {type="fluid", name="water", amount=100},
                {type="item", name="calcite", amount=1}
            },
            results = {
                {type="item", name="gold-powder", amount=30},
                {type="item", name="copper-ore", amount=2}
            },
            energy_required = 100,
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0, 0.6, 0.8, 1},
                secondary = {0, 1, 1, 1},
                tertiary = {0.5, 1, 1, 1},
                quaternary = {0.4, 0.4, 0.8, 1}
              }
        },
        {
            type = "recipe",
            name = "holmium-wire",
            category = data.raw["recipe-category"]["electroplating"] and "electroplating" or "electromagnetics",
            icons = {
                {
                    icon = "__ThemTharHills__/graphics/icons/gold-wire.png",
                    icon_size = 64,        
                },
                {
                    icon = "__space-age__/graphics/icons/fluid/electrolyte.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = {8, 8}
                }
            },
            ingredients = {
                {type="fluid", name="electrolyte", amount=5},
                {type="item", name="copper-cable", amount=40}
            },
            results = {
                {type="item", name="gold-wire", amount=data.raw["recipe-category"]["electroplating"] and 8 or 10}
            },
            energy_required = 2.5,
            allow_productivity = true,
            enabled = false
        },
        {
            type = "recipe",
            name = "holmium-microchip",
            category = "electromagnetics",
            icons = {
                {
                    icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
                    icon_size = 64,        
                },
                {
                    icon = "__space-age__/graphics/icons/fluid/electrolyte.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = {8, 8}
                }
            },
            ingredients = {
                {type="fluid", name="sulfuric-acid", amount=2},
                {type="fluid", name="electrolyte", amount=2},
                {type="item", name="electronic-circuit", amount=2}
            },
            results = {
                {type="item", name="integrated-circuit", amount=1},
                {type="fluid", name="depleted-acid", amount=2}
            },
            energy_required = 1,
            main_product = "integrated-circuit",
            enabled = false
        }
    })
    if misc.difficulty == 3 then
        rm.AddIngredient("neural-microchip", "jelly", 1)
    end

    if mods["Paracelsin"] then
        data:extend({
            {
                type = "recipe",
                name = "integrated-circuits-from-nitric-acid",
                category = "electrochemistry",
                additional_categories = {"electromagnetics"},
                icons = {
                    {
                        icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
                        icon_size = 64
                    },
                    {
                        icon = "__Paracelsin-Graphics__/graphics/icons/nitric-acid.png",
                        icon_size = 64,
                        scale = 0.25,
                        shift = {-8, -8}
                    }
                },
                ingredients = {
                    {type="item", name="gold-wire", amount=6},
                    {type="item", name="zinc-solder", amount=2},
                    {type="item", name="plastic-bar", amount=1},
                    {type="fluid", name="nitric-acid", amount=1},
                },
                results = {
                    {type="item", name="integrated-circuit", amount=2},
                    {type="fluid", name="depleted-acid", amount=1}
                },
                subgroup = "nitric-acid-and-nitrogen",
                order = "fa",
                main_product = "integrated-circuit",
                lasermill_dlc = {helium = -1, unlock="electrochemical-plant", icon_offset={8, -8}},
                energy_required = 1,
                allow_productivity = true,
                enabled = false
            }
        })
    end

    if mods["castra"] then
        data:extend({
            {
                type = "recipe",
                name = "integrated-circuit-battlefield-data",
                category = "electronics",
                icons = {
                    {
                        icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
                        icon_size = 64,
                        scale = 0.7,
                        shift = {0, -10}
                    },
                    {
                        icon = "__castra__/graphics/icons/castra-data.png",
                        icon_size = 64,
                        scale = 0.5,
                        shift = {-10, 10}
                    }
                },
                ingredients = {
                    {type="item", name="plastic-bar", amount=4},
                    {type="fluid", name="sulfuric-acid", amount=10},
                    {type="item", name="castra-data", amount=1},
                },
                results = {
                    {type="item", name="integrated-circuit", amount=8},
                    {type="fluid", name="depleted-acid", amount=10}
                },
                subgroup = "castra-processes",
                order = "g",
                main_product = "integrated-circuit",
                energy_required = 1,
                allow_productivity = true,
                enabled = false
            }
        })
    end
end

if tune_up_data then
  if not mods["space-age"] then
    tune_up_data.recipes["gold-ore"] = {
        category = "purification",
        count = 5,
        energy_required = 1,
        ingredients = {{{"gold-ore", 5}, {"stone", 1}, {"nitric-acid", 50}}}
    }
  end

  tune_up_data.recipes["gold-plate"] = {
    category = "purification",
    count = 10,
    energy_required = 10,
    ingredients = {{{"gold-plate", 5}, {"nitric-acid", 100}, {"calcite", 1}}, {{"stone", 1}, {"gold-ore", 5}}}
  }

  tune_up_data.recipes["gold-powder"] = {
    category = "purification",
    count = 30,
    energy_required = 10,
    ingredients = {{{"gold-powder", 5}, {"nitric-acid", 100}, {"copper-ore", 1}}, {{"stone", 1}, {"gold-powder", 15}}}
  }

  tune_up_data.recipes["gold-wire"] = {
    category = "tuning-up",
    count = 4,
    energy_required = 1,
    ingredients = {{{"rubber", 1}, {"gold-wire", 1}}, {{"plastic-bar", 1}, {"gold-wire", 1}}}
  }

  tune_up_data.recipes["integrated-circuit"] = {
    category = "tuning-up",
    count = 5,
    energy_required = 5,
    ingredients = {{{"holmium-plate", 1}}, {{"electronic-circuit", 2}, {"gold-wire", 2}}}
  }

  tune_up_data.recipes["neural-bioculture"] = {
    category = "purification",
    count = 3,
    energy_required = 1,
    ingredients = {{{"nutrients", 1}, {"electrolyte", 1}}}
  }

  tune_up_data.recipes["transceiver"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 2,
    ingredients = {{{"advanced-circuit", 1}}}
  }

  tune_up_data.recipes["heavy-cable"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 2,
    surface_conditions = {{property="magnetic-field", min=99}},
    ingredients = {{{"superconductor", 1}}}
  }

  tune_up_data.recipes["stepper-motor"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 2,
    ingredients = {{{"superconductor", 1}, {"iron-gear-wheel", 1}}, {{"integrated-circuit", 1}, {"iron-gear-wheel", 1}}}
  }

  tune_up_data.recipes["semiboloid-stator"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 1,
    ingredients = {{{"electromagnetic-coil", 1}, {"gold-wire", 1}}, {{"gold-wire", 3}}}
  }

  tune_up_data.recipes["hydrocoptic-marzelvane"] = {
    category = "tuning-up",
    count = 1,
    energy_required = 1,
    ingredients = {{{"semiboloid-stator", 4}, {mods["maraxsis"] and "maraxsis-glass-panes" or "fluoroketone-cold", mods["maraxsis"] and 1 or 20}, {mods["BrassTacks"] and "bearing" or "iron-gear-wheel", 2}}}
  }
end

if misc.difficulty == 1 then
    return
end

data:extend({
    {
        type = "recipe",
        name = "stepper-motor",
        category = mods["space-age"] and "electronics" or "crafting",
        ingredients = {
            {type="item", name="gold-wire", amount=6},
            {type="item", name="iron-gear-wheel", amount=1},
            {type="item", name="copper-plate", amount=1}
        },
        results = {
            {type="item", name="stepper-motor", amount=1}
        },
        energy_required = 2,
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "transceiver",
        category = mods["space-age"] and "electronics" or "crafting",
        ingredients = {
            {type="item", name="gold-wire", amount=6},
            {type="item", name="iron-stick", amount=1},
            {type="item", name="electronic-circuit", amount=3}
        },
        results = {
            {type="item", name="transceiver", amount=1}
        },
        energy_required = 3,
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "heavy-cable",
        category = mods["space-age"] and "electronics" or "crafting",
        ingredients = {
            {type="item", name="gold-wire", amount=6},
            {type="item", name="copper-cable", amount=1},
            {type="item", name="plastic-bar", amount=3}
        },
        results = {
            {type="item", name="heavy-cable", amount=1}
        },
        energy_required = 3,
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    }
})

if mods["LunarLandings"] then
    data:extend({
        {
        type = "recipe",
        name = "entangled-transceiver",
        category = "ll-quantum-resonating",
        localised_name = { "recipe-name.entangled-transceiver" },
        icons = {
            {
            icon = "__ThemTharHills__/graphics/icons/transceiver.png",
            icon_size = 64
            },
            {
            icon = "__LunarLandings__/graphics/icons/polariton/polariton.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
            }
        },
        energy_required = 20,
        allow_decomposition = false,
        ingredients = {
            {type="item", name="integrated-circuit", amount=40},
            {type="item", name="ll-down-polariton", amount=1},
            {type="item", name="ll-left-polariton", amount=1}
        },
        results = {
            {type="item", name="transceiver", amount=40},
            {type="item", name="ll-up-polariton", amount=2}
        },
        main_product = "transceiver",
        enabled = false
        }
    })
end

if misc.difficulty == 2 then
    return
end

data:extend({
    {
        type = "recipe",
        name = "semiboloid-stator",
        category = mods["space-age"] and "electronics" or "crafting",
        ingredients = {
            {type="item", name="gold-wire", amount=2},
            {type="item", name="iron-gear-wheel", amount=1},
            {type="item", name="copper-plate", amount=1}
        },
        results = {
            {type="item", name="semiboloid-stator", amount=1}
        },
        energy_required = 1,
        lasermill_dlc = {helium = -1},
        allow_productivity = true,
        enabled = false
    }
})

rm.ReplaceIngredientProportional("stepper-motor", "copper-plate", "semiboloid-stator")

if mods["space-age"] then
    data:extend({
        {
            type = "recipe",
            name = "hydrocoptic-marzelvane",
            category = mods["maraxsis"] and "maraxsis-hydro-plant-or-assembling" or "cryogenics-or-assembling",
            ingredients = {
                {type="item", name="stepper-motor", amount=4},
                {type="item", name="pipe", amount=10},
                {type="item", name=mods["maraxsis"] and "maraxsis-glass-panes" or "lithium-plate", amount=mods["maraxsis"] and 5 or 2},
                {type="item", name="superconductor", amount=5},
                {type="fluid", name=mods["maraxsis"] and "maraxsis-saline-water" or "fluorine", amount=50}
            },
            results = {
                {type="item", name="hydrocoptic-marzelvane", amount=1}
            },
            energy_required = 6,
            lasermill_dlc = {helium = -1, unlock=mods["maraxsis"] and "maraxsis-hydro-plant" or "cryogenic-plant"},
            allow_productivity = true,
            enabled = false,
            crafting_machine_tint = {
                primary = {0, 0, 1, 1},
                secondary = {0, 1, 1, 1},
                tertiary = {0, 0, 1, 1},
                quaternary = {1, 1, 1, 0.5}
              }
    
        }
    })
end