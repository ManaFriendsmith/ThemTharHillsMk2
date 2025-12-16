local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if data.raw["item-subgroup"].cable then
    data.raw.item["copper-cable"].subgroup = "cable"
    data.raw.item["gold-wire"].subgroup = "cable"
    data.raw.item["heavy-cable"].subgroup = "cable"
end

if mods["bzsilicon"] then
    if data.raw.item["silicon-wafer"] then
        rm.ReplaceIngredientProportional("integrated-circuit", "copper-plate", "silicon-wafer", 0.5)
        rm.AddProduct("silicon-wafer", {type="fluid", name="depleted-acid", amount=50, ignored_by_productivity=50})
        if mods["Cerys-Moon-of-Fulgora"] then
            rm.ReplaceIngredientProportional("integrated-circuit", "copper-plate", "silicon-wafer", 0.5)
        else
            rm.AddIngredient("integrated-circuits-from-nitric-acid", "silicon-wafer", 1)
        end
    else
        rm.ReplaceIngredientProportional("integrated-circuit", "copper-plate", "silicon", 0.5)
        if mods["Cerys-Moon-of-Fulgora"] then
            rm.ReplaceIngredientProportional("integrated-circuit", "copper-plate", "silicon", 0.5)
        else
            rm.AddIngredient("integrated-circuits-from-nitric-acid", "silicon", 1)
        end
    end

    --quartz oscillator
    rm.RemoveIngredient("transceiver", "iron-stick", 1)
    rm.AddIngredient("transceiver", "silica", 2)
end