local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["se-space-trains"] then
    if misc.difficulty == 3 and not mods["IfNickelMk2"] then
        rm.AddIngredient("space-locomotive", "semiboloid-stator", 30)
        rm.AddIngredient("space-cargo-wagon", "semiboloid-stator", 30)
        rm.AddIngredient("space-fluid-wagon", "semiboloid-stator", 30)
    elseif misc.difficulty > 1 then
        rm.AddIngredient("space-locomotive", "heavy-cable", 20)
        rm.AddIngredient("space-cargo-wagon", "heavy-cable", 20)
        rm.AddIngredient("space-fluid-wagon", "heavy-cable", 20)
    end

    if #data.raw.recipe["space-locomotive"].ingredients > 5 then
        rm.RemoveIngredient("space-locomotive", "steel-plate", 99999)
        rm.RemoveIngredient("space-cargo-wagon", "steel-plate", 99999)
        rm.RemoveIngredient("space-fluid-wagon", "steel-plate", 99999)
    end

    if misc.difficulty == 3 and not mods["space-age"] then
        rm.AddIngredient("space-train-battery-pack", "heavy-cable", 1)
    end
    if misc.difficulty > 1 then
        rm.AddIngredient("space-train-battery-charging-station", "heavy-cable", 5)
    end
end

if mods["deadlock-beltboxes-loaders"] then

    if misc.difficulty > 1 then
        if mods["space-age"] then
            if rm.GetIngredientCount("turbo-transport-belt-beltbox", "electric-engine-unit") == 0 then
                rm.AddIngredient("turbo-transport-belt-beltbox", "electric-engine-unit", 5)
            end

        else
            if rm.GetIngredientCount("express-transport-belt-beltbox", "electric-engine-unit") == 0 then
                rm.AddIngredient("express-transport-belt-beltbox", "electric-engine-unit", 2)
            end

        end

        rm.AddIngredient("express-transport-belt-beltbox", "stepper-motor", 5)
        rm.RemoveIngredient("express-transport-belt-beltbox", "iron-gear-wheel", 99999)
    end

    if misc.difficulty == 1 or not ((mods["LasingAroundmk2"] and not mods["space-age"]) or (mods["BrassTacksMk2"] and misc.difficulty > 1)) then
        rm.AddIngredient("express-transport-belt-beltbox", "integrated-circuit", 10)
    end

end

if mods["scrap-industry"] then
    if mods["space-age"] then
        tm.AddUnlock("foundry", "molten-gold-from-scrap")

        for k, v in pairs(ScrapIndustry.items["superconductor"].scrap) do
            if v == "copper-scrap" then
                ScrapIndustry.items["superconductor"].scrap[k] = "gold-scrap"
            end
        end
    end

    ScrapIndustry.items["gold-plate"] = {scrap="gold-scrap", scale=ScrapIndustry.COMMON, failrate=0.01, recycle=3}
    ScrapIndustry.items["gold-wire"] = {scrap="gold-scrap", scale=ScrapIndustry.CHEAP, failrate=0.02}

    rm.ReplaceIngredientProportional("advanced-circuit-from-scrap", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("processing-unit-from-scrap", "copper-cable", "gold-wire")

    if data.raw.item["plastic-bits"] then
        ScrapIndustry.items["integrated-circuit"] = {scrap={"gold-scrap", "circuit-scrap", "plastic-bits"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
        ScrapIndustry.items["advanced-circuit"] = {scrap={"gold-scrap", "circuit-scrap", "plastic-bits"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
        ScrapIndustry.items["heavy-cable"] = {scrap={"gold-scrap", "circuit-scrap", mods["BrimStuffMk2"] and "rubber-bits" or "plastic-bits"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
    else
        ScrapIndustry.items["integrated-circuit"] = {scrap={"gold-scrap", "circuit-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
        ScrapIndustry.items["advanced-circuit"] = {scrap={"gold-scrap", "circuit-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
        ScrapIndustry.items["heavy-cable"] = {scrap={"gold-scrap", "circuit-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
    end

    ScrapIndustry.items["transceiver"] = {scrap={"gold-scrap", "circuit-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.03}
    if data.raw.item["mech-scrap"] then
        ScrapIndustry.items["stepper-motor"] = {scrap={"gold-scrap", mods["IfNickelMk2"] and "motor-scrap" or "mech-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}
        ScrapIndustry.items["semiboloid-stator"] = {scrap={"gold-scrap", mods["IfNickelMk2"] and "motor-scrap" or "mech-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
        ScrapIndustry.items["hydrocoptic-marzelvane"] = {scrap={"gold-scrap", "lithium-dust", "holmium-scrap", mods["IfNickelMk2"] and "motor-scrap" or "mech-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.04}
    else
        ScrapIndustry.items["stepper-motor"] = {scrap={"gold-scrap", "iron-scrap", mods["IfNickelMk2"] and "nickel-scrap" or "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}
        ScrapIndustry.items["semiboloid-stator"] = {scrap={"gold-scrap", "iron-scrap", mods["IfNickelMk2"] and "nickel-scrap" or "copper-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
        ScrapIndustry.items["hydrocoptic-marzelvane"] = {scrap={"gold-scrap", "lithium-dust", "holmium-scrap", mods["IfNickelMk2"] and "nickel-scrap" or "iron-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.04}
    end

    if not settings.startup["scrap-industry-no-mercy"].value then
        ScrapIndustry.recipes["gold-wire"] = {ignore=true}
    end
end