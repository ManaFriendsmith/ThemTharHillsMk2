local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["Age-of-Production"] then
    require("compat.age-of-production")
end

--SPACE PLATFORM(?)

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("thruster", "electric-engine-unit", "stepper-motor", 2)
    rm.AddIngredient("cargo-bay", "stepper-motor", 5)
    rm.ReplaceIngredientProportional("space-platform-foundation", "copper-cable", "heavy-cable", 0.2)
    if not data.raw.item["grabber"] then
        rm.ReplaceIngredientProportional("asteroid-collector", "electric-engine-unit", "stepper-motor", 2)
    end
end

--VULCANUS

table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "chemistry-or-metallurgy")
table.insert(data.raw["assembling-machine"]["foundry"].crafting_categories, "chemistry-or-metallurgy")

if mods["BrimStuffMk2"] then
    rm.ReplaceIngredientProportional("foundry", "electronic-circuit", "heavy-cable")    
end

if mods["IfNickelMk2"] then
    rm.AddProduct("copper-ore-from-malachite", "depleted-acid", 200)
else
    rm.AddProduct("acid-neutralisation", "depleted-acid", 200)
end
tm.AddUnlock("calcite-processing", "depleted-acid-reprocessing-with-calcite")
tm.AddUnlock("foundry", "molten-gold", "-casting-iron")
if mods["BrassTacksMk2"] then
    tm.AddUnlock("foundry", "casting-gold", "casting-brass")
else
    tm.AddUnlock("foundry", "casting-gold", "casting-copper")
end
tm.AddUnlock("foundry", "casting-gold-wire", "casting-copper-cable")
tm.AddUnlock("full-spectrum-magmallurgy", "molten-gold-from-lava")

--GLEBA

if data.raw.item["stem-cells"] then
    tm.AddUnlock("neural-electronics", "stem-cells", "-neural-bioculture")
    tm.RemoveUnlock("tissue-cultivation", "stem-cells")
    tm.AddPrerequisite("tissue-cultivation", "neural-electronics")
    rm.AddProduct("stem-cells", "neural-bioculture", 4)

    rm.AddIngredient("musculoskeletal-bioculture", "neural-bioculture", 1)
    rm.AddIngredient("cardiac-bioculture", "neural-bioculture", 1)
    rm.AddIngredient("vestibular-bioculture", "neural-bioculture", 1)
end

if data.raw.item["malleable-logarithmic-casing"] then
    rm.RemoveIngredient("perpendicular-processor", "iron-stick", 7)
    rm.RemoveIngredient("logic-deregulator", "hazard-concrete", 7)
end
rm.AddIngredient("perpendicular-processor", "neural-bioculture", 8)
rm.AddIngredient("logic-deregulator", "neural-bioculture", 8)

rm.ReplaceIngredientProportional("brain-galactification", "bioflux", "neural-bioculture", 4)
rm.MultiplyRecipe("brain-galactification", 0.25)

--FULGORA

if misc.difficulty > 1 then
    rm.AddIngredient("electromagnetic-plant", "stepper-motor", 50)
    rm.AddIngredient("lightning-collector", "heavy-cable", 5)
    rm.AddProduct("scrap-recycling", {type="item", name="heavy-cable", amount=1, probability=0.03})

    if mods["LasingAroundMk2"] then
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="integrated-circuit", amount=1, probability=0.7})
    end
end
rm.ReplaceIngredientProportional("superconductor", "copper-plate", "gold-wire", 2)
rm.AddProduct("spectroscopic-holmium-processing", {type="item", name="gold-powder", amount=1, probability=0.33})

if misc.starting_planet == "fulgora" then
    tm.RemoveUnlock("gold-electronics", "gold-wire")
    tm.RemoveUnlock("gold-processing", "gold-wire")
    tm.AddUnlock("battery", "gold-wire")
    tm.AddUnlock("advanced-circuit", "gold-wire")
    tm.RemovePrerequisite("gold-electronics", "gold-processing")
    tm.AddPrerequisite("gold-electronics", "advanced-circuit")
    tm.SetTechnologyTrigger("gold-electronics", "gold-wire", 5)
end

if mods["LasingAroundMk2"] and misc.difficulty > 1 then
    rm.AddIngredient("lavaser", "heavy-cable", 1)
    rm.AddIngredient("bioluminaser", "heavy-cable", 1)
    rm.AddIngredient("electrolaser", "heavy-cable", 1)
    rm.AddIngredient("galvaser", "heavy-cable", 1)
    rm.AddIngredient("milaser", "heavy-cable", 1)
    rm.AddIngredient("halaser", "heavy-cable", 1)
    rm.AddIngredient("lunaser", "heavy-cable", 1)
end

if misc.difficulty == 3 and rm.GetIngredientCount("electromagnetic-science-pack", "electric-engine-unit") == 0 then
    rm.AddIngredient("electromagnetic-science-pack", "electric-engine-unit")
end

--AQUILO

if misc.difficulty == 3 then
    if not mods["maraxsis"] then
        tm.AddUnlock("cryogenic-plant", "hydrocoptic-marzelvane", "-cryogenic-plant")
        rm.ReplaceIngredientProportional("cryogenic-plant", "superconductor", "hydrocoptic-marzelvane", 0.2)

        rm.AddIngredient("captive-biter-spawner", "hydrocoptic-marzelvane", 10)

        --every other FK recipe takes cold, making chem plants able to cool FK would be too strong (much better energy:speed ratio) so there is this kludge
        --data.raw.recipe["fluoroketone"].category = "chemistry-or-cryogenics"
        --rm.RemoveProduct("fluoroketone", "fluoroketone-hot", 2)
        --rm.AddProduct("fluoroketone", "fluoroketone-cold", 2)

        rm.MultiplyRecipe("cryogenic-science-pack", 2)
        rm.ReplaceIngredientProportional("cryogenic-science-pack", "ice", "hydrocoptic-marzelvane", 0.16)

        --this logic is also duplicated into brimstuff as it adds an extra ingredient to cryoplants
        if data.raw.item["hydrocoptic-marzelvane"] and #data.raw.recipe["cryogenic-plant"].ingredients > 6 and rm.GetIngredientCount("cryogenic-plant", "lithium-plate") > 0 then
            rm.AddIngredient("hydrocoptic-marzelvane", "lithium-plate", 1)
            rm.RemoveIngredient("cryogenic-plant", "lithium-plate", 99999)
        end
    end

    rm.ReplaceIngredientProportional("productivity-module-3", "ice", "hydrocoptic-marzelvane", 0.1)
    if mods["maraxsis"] then
        tm.AddSciencePack("productivity-module-3", "hydraulic-science-pack")
    end

    rm.AddIngredient("fusion-generator", "semiboloid-stator", 100)
    rm.AddIngredient("fusion-reactor", "heavy-cable", 100)
    rm.AddIngredient("railgun-turret", "hydrocoptic-marzelvane", 5)

    if settings.startup["planetfall-postgame-logistics"].value then
        rm.AddIngredient("extradimensional-cargo-bay", "hydrocoptic-marzelvane", 20)
    end
end