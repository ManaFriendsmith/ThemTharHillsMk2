local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

--mods that just use vanilla-like ore generation will not get special design effort
if mods["tenebris"] then
    data.raw.planet["tenebris"].map_gen_settings.autoplace_controls["gold-ore"] = {}
    data.raw.planet["tenebris"].map_gen_settings.autoplace_settings.entity.settings["gold-ore"] = {}    
end

if mods["terrapalus"] then
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_controls["gold-ore"] = {}
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_settings.entity.settings["gold-ore"] = {}    
end

if mods["maraxsis"] then
    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("hydrocoptic-marzelvane", "superconductor", "tungsten-plate")
        rm.ReplaceIngredientProportional("hydrocoptic-marzelvane", "fluoroketone-cold", "maraxsis-brackish-water")

        tm.AddUnlock("maraxsis-hydro-plant", "hydrocoptic-marzelvane", "maraxsis-brackish-water")
        rm.AddIngredient("maraxsis-hydro-plant", "hydrocoptic-marzelvane", 4)
        rm.AddIngredient("maraxsis-salt-reactor", "hydrocoptic-marzelvane", 4)

        rm.MultiplyRecipe("hydraulic-science-pack", 2)
        rm.AddIngredient("hydraulic-science-pack", "hydrocoptic-marzelvane", 1)
    end
end

--cerys: I'm really not sure if you can obtain all ores in decent ratios from recycling stuff.
--as I understand it cerys is a meticulously designed puzzle, adding explicit compat would almost be like adding compat with ultracube

--arrakis, shattered planet: incomplete

if mods["Paracelsin"] then
    rm.ReplaceIngredientProportional("paracelsin-processing-units-from-nitric-acid", "electronic-circuit", "integrated-circuit", 1, data.raw.item["cooling-fan"] and 16 or 8)
    rm.AddProduct("paracelsin-processing-units-from-nitric-acid", "depleted-acid", 5)
    tm.AddUnlock("electrochemical-plant", "integrated-circuits-from-nitric-acid")
    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="gold-wire", amount_min=4, amount_max=10})
    table.insert(data.raw["simple-entity"]["big-metallic-rock"].minable.results, {type="item", name="gold-powder", amount_min=1, amount_max=7})

    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("electric-coil", "iron-gear-wheel", "semiboloid-stator", 0.4)
    end
    if misc.difficulty == 1 then
        rm.ReplaceIngredientProportional("electric-coil", "copper-cable", "gold-wire", 0.8)
    else
        rm.ReplaceIngredientProportional("electric-coil", "copper-cable", "heavy-cable", 0.2)
        rm.ReplaceIngredientProportional("electrochemical-plant", "copper-cable", "heavy-cable", 0.25)
        rm.AddIngredient("mechanical-plant", "stepper-motor", 10)
    end

    --gold can be obtained from copper ore but we need more of it
    rm.AddProduct("tetrahedrite-processing", "copper-ore", 1)

    rm.AddProduct("zinc-leaching", "depleted-acid", 5)

    data.raw.recipe["nitrogen-nitric-acid"].icons = {
        {
            icon = "__Paracelsin-Graphics__/graphics/icons/nitric-acid.png",
            icon_size = 64
        },
        {
            icon = "__Paracelsin-Graphics__/graphics/icons/nitrogen.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
        }
    }
    data.raw.recipe["nitrogen-nitric-acid"].icon = nil
    data.raw.recipe["nitrogen-nitric-acid"].icon_size = nil
end

if mods["castra"] then
    --this should theoretically provide enough gold for non-circuit needs as it really isn't very much and the planet already heavily favors imports over starting from scratch.
    --recyclers allow recovering gold from circuits producted from battle data and foundries allow recovering more gold from depleted acid.
    rm.AddIngredient("nickel-sulfide-reduction", "nitric-acid", 25)
    rm.AddProduct("nickel-sulfide-reduction", "depleted-acid", 25)
    rm.AddProduct("processing-unit-battlefield-data", "depleted-acid", 40)

    if mods["BrassTacks"] then
        rm.AddProduct("custom-ancient-military-wreckage-recycling", {type="item", name="transceiver", amount=1, probability=0.04})
    end

    tm.AddUnlock("planet-discovery-castra", "integrated-circuit-battlefield-data", "-processing-unit-battlefield-data")

    if misc.difficulty > 1 then
        rm.AddIngredient("combat-roboport", "stepper-motor", 25)
        rm.AddIngredient("jammer-radar", "transceiver", 10)
    end
end