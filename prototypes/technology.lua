local misc = require("__pf-functions__/misc")
local tm = require("__pf-functions__/technology-manipulation")

if mods["LunarLandings"] and not mods["BrassTacksMk2"] then
    data:extend({
        {
            type = "technology",
            name = "lunar-cheese-exploitation",
            icon = "__BrassTacksMk2__/graphics/technology/lunar-cheese-exploitation.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "cheese-ore-processing"
                }
            },
            prerequisites = {"production-science-pack"},
            unit = {
                count = 300,
                time = 15,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                }
            }
        }
    })
end

data:extend({
    {
        type = "technology",
        name = "gold-processing",
        icon = "__ThemTharHillsMk2__/graphics/technology/gold-processing.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "pf-nitric-acid"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-powder"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "depleted-acid-reprocessing"
            }
        },
        prerequisites = {"sulfur-processing"},
        unit = {
            count = 50,
            time = 15,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            }
        }
    }
})

if mods["space-age"] then
    tm.AddUnlock("foundry", "trace-metals-from-copper", "-concrete-from-molten-iron")

    data:extend({
        {
            type = "technology",
            name = "electrolytronics",
            icons = {
                {
                    icon = "__base__/graphics/technology/advanced-circuit.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__space-age__/graphics/technology/holmium-processing.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = {-32, -32}
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "holmium-wire"
                },
                {
                    type = "unlock-recipe",
                    recipe = "holmium-microchip"
                }
            },
            prerequisites = {"electromagnetic-science-pack", "metallurgic-science-pack"},
            unit = {
                count = 1500,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1}
                }
            }
        }
    })
else
    tm.AddUnlock("gold-processing", "trace-metals-from-copper", "gold-powder")
end


if misc.difficulty > 1 then
    data:extend({
        {
            type = "technology",
            name = "gold-electronics",
            icon = "__ThemTharHillsMk2__/graphics/technology/gold-electronics.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "gold-wire"
                },
                {
                    type = "unlock-recipe",
                    recipe = "transceiver"
                },
                {
                    type = "unlock-recipe",
                    recipe = "stepper-motor"
                }
            },
            prerequisites = {"gold-processing"},
            research_trigger = {
                type = "craft-item",
                item = "gold-plate"
            }
        }
    })

    if misc.difficulty == 3 then
        tm.AddUnlock("gold-electronics", "semiboloid-stator", "-stepper-motor")
    end
else
    tm.AddUnlock("gold-processing", "gold-wire", "-depleted-acid-reprocessing")
end

if mods["space-age"] then
    data:extend({
        {
            type = "technology",
            name = "neural-electronics",
            icon = "__ThemTharHillsMk2__/graphics/technology/neural-electronics.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "neural-bioculture"
                },
                {
                    type = "unlock-recipe",
                    recipe = "neural-microchip"
                },
                {
                    type = "unlock-recipe",
                    recipe = "neural-conductor"
                }
            },
            prerequisites = {"biochamber"},
            research_trigger = {
                type = "craft-item",
                item = "pentapod-egg"
            }
        }
    })
end

if mods["LunarLandings"] and misc.difficulty > 1 then
    data:extend({
        {
            type = "technology",
            name = "entangled-communications",
            icons = {
                {
                icon = "__ThemTharHillsMk2__/graphics/technology/gold-electronics.png",
                icon_size = 256
                },
                {
                icon = "__LunarLandings__/graphics/icons/polariton/polariton.png",
                icon_size = 64,
                shift = {-64, -64},
                scale = 1
                }
            },
            effects =
            {
                {
                type = "unlock-recipe",
                recipe = "entangled-transceiver"
                }
            },
            prerequisites = {"ll-quantum-resonation"},
            unit = {
                count = 500,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 },
                    { "chemical-science-pack", 1 },
                    { "production-science-pack", 1 },
                    { "utility-science-pack", 1 },
                    { "ll-space-science-pack", 1 }
                },
                time = 60,
            }
        }
    })
end

if mods["LunarLandings"] and mods["space-age"] then
    data:extend({
        {
            type = "technology",
            name = "vulcanus-silica",
            icons = {
                {
                icon = "__space-age__/graphics/technology/foundry.png",
                icon_size = 256
                },
                {
                icon = "__LunarLandings__/graphics/icons/silica.png",
                icon_size = 64,
                shift = {-64, -64},
                scale = 1
                }
            },
            effects =
            {
                {
                type = "unlock-recipe",
                recipe = "vulcanus-silica"
                }
            },
            prerequisites = {"metallurgic-science-pack", "ll-space-science-pack"},
            unit = {
                count = 1000,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 },
                    { "chemical-science-pack", 1 },
                    { "space-science-pack", 1 },
                    { "production-science-pack", 1 },
                    { "metallurgic-science-pack", 1 },
                    { "ll-space-science-pack", 1 }
                },
                time = 60,
            }
        }
    })
end