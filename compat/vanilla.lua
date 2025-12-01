local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

--INTERMEDIATE PRODUCTS

if misc.starting_planet ~= "fulgora" then
    if misc.difficulty == 1 then
        tm.AddPrerequisite("advanced-circuit", "gold-processing")
    else
        tm.AddPrerequisite("advanced-circuit", "gold-electronics")
    end
end
rm.ReplaceIngredientProportional("advanced-circuit", "copper-cable", "gold-wire")

tm.AddUnlock("processing-unit", "integrated-circuit", "-processing-unit")
if rm.GetIngredientCount("processing-unit", "silicon-wafer") > 0 then
    rm.ReplaceIngredientProportional("processing-unit", "silicon-wafer", "integrated-circuit", 1, 10)
else
    rm.ReplaceIngredientProportional("processing-unit", "electronic-circuit", "integrated-circuit", 1, 10)
end
rm.AddProduct("processing-unit", "depleted-acid", 5)

if misc.difficulty > 1 then
    rm.AddIngredient("flying-robot-frame", "transceiver", 1)
    rm.RemoveIngredient("flying-robot-frame", "electronic-circuit", 99999)
    --not a replace - if BrassTacks exists, circuits will have been replaced w/ gyro

    tm.AddUnlock("advanced-circuit", "heavy-cable")

    if misc.difficulty == 2 then
        rm.ReplaceIngredientProportional("electric-engine-unit", "electronic-circuit", "heavy-cable", 0.5)
    else
        rm.ReplaceIngredientProportional("electric-engine-unit", "electronic-circuit", "semiboloid-stator", 1)
    end
end

if misc.difficulty > 1 then
    if mods["space-age"] then
        rm.AddIngredient("rocket-control-unit", "transceiver", 1)
        rm.RemoveIngredient("rocket-control-unit", "electronic-circuit", 99999)
        if mods["LasingAround"] or not mods["BrassTacks"] then
            rm.AddIngredient("rocket-control-unit", "integrated-circuit", 5)
        end
    elseif not (mods["LasingAround"] and mods["BrassTacks"]) then
        rm.AddIngredient("rocket-part", "transceiver", 10)
    end
end

if not mods["space-age"] then
    rm.AddIngredient("satellite", "transceiver", 50)
end

if misc.difficulty > 1 and mods["LunarLandings"] then
    rm.ReplaceIngredientProportional("rocket-control-unit", "advanced-circuit", "transceiver", 1, 1)
end

if mods["LasingAround"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("laser", "heavy-cable", 1)
        rm.ReplaceIngredientProportional("scanner", "electronic-circuit", "integrated-circuit")
    else
        rm.AddIngredient("laser", "gold-wire", 5)
    end

    if misc.difficulty == 3 and not mods["space-age"] and not mods["LunarLandings"] then
        tm.AddPrerequisite("processing-unit", "laser-mill")
    end
end


if misc.difficulty == 2 and mods["IfNickel"] then
    --difficulty 3 coil is too early game for gold
    rm.ReplaceIngredientProportional("electromagnetic-coil", "copper-cable", "gold-wire")
end

if misc.difficulty == 3 and mods["IfNickel"] then
    rm.ReplaceIngredientProportional("grabber", "iron-gear-wheel", "stepper-motor", 0.66, 3)
end

rm.ReplaceIngredientProportional("rocket-fuel", "light-oil", "nitric-acid", 2)

--LOGISTICS

--INSERTERS

if misc.difficulty > 1 then
    if rm.GetIngredientCount("bulk-inserter", "iron-gear-wheel") > 0 then
        rm.ReplaceIngredientProportional("bulk-inserter", "iron-gear-wheel", "stepper-motor", 0.4)
    else
        rm.ReplaceIngredientProportional("bulk-inserter", "electronic-circuit", "stepper-motor", 0.4)
    end
end

--CIRCUIT NETWORK

if not data.raw.item["tinned-cable"] then
    tm.AddPrerequisite("circuit-network", "gold-electronics")
    rm.ReplaceIngredientProportional("decider-combinator", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("arithmetic-combinator", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("constant-combinator", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("programmable-speaker", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("power-switch", "copper-cable", "gold-wire")
end

--RAILWAY

if misc.difficulty == 1 then
    tm.AddPrerequisite("automated-rail-transportation", "gold-processing")
    rm.ReplaceIngredientProportional("train-stop", "iron-plate", "gold-wire")
else
    tm.AddPrerequisite("automated-rail-transportation", "gold-electronics")
    rm.ReplaceIngredientProportional("train-stop", "electronic-circuit", "transceiver", 0.3333)
end

if mods["BrassTacks"] and misc.difficulty == 3 then
    rm.ReplaceIngredientProportional("rail-signal", "galvanized-panel", "gold-wire", 1, 1)
    rm.ReplaceIngredientProportional("rail-chain-signal", "galvanized-panel", "gold-wire", 1, 1)
else
    rm.ReplaceIngredientProportional("rail-signal", "iron-plate", "gold-wire", 1, 1)
    rm.ReplaceIngredientProportional("rail-chain-signal", "iron-plate", "gold-wire", 1, 1)
end

--ELECTRIC POLES

if misc.difficulty == 1 then
    rm.ReplaceIngredientProportional("substation", "copper-cable", "gold-wire", 2)
else
    rm.ReplaceIngredientProportional("substation", "copper-cable", "heavy-cable", 1)
end

--ROBOTICS

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("roboport", "iron-gear-wheel", "stepper-motor", 1, 15)
    rm.AddIngredient("roboport", "transceiver", 15)

    rm.AddIngredient("passive-provider-chest", "stepper-motor", 1)
    rm.AddIngredient("storage-chest", "stepper-motor", 1)
    rm.AddIngredient("active-provider-chest", "stepper-motor", 1)
    rm.AddIngredient("buffer-chest", "stepper-motor", 1)
    rm.AddIngredient("requester-chest", "stepper-motor", 1)

    rm.ReplaceIngredientProportional("passive-provider-chest", "electronic-circuit", "transceiver", 0.33)
    rm.ReplaceIngredientProportional("storage-chest", "electronic-circuit", "transceiver", 0.33)
    rm.ReplaceIngredientProportional("active-provider-chest", "electronic-circuit", "transceiver", 0.33)
    rm.ReplaceIngredientProportional("buffer-chest", "electronic-circuit", "transceiver", 0.33)
    rm.ReplaceIngredientProportional("requester-chest", "electronic-circuit", "transceiver", 0.33)

    if not mods["BrassTacks"] then
        rm.AddIngredient("logistic-robot", "stepper-motor", 2)
        rm.AddIngredient("construction-robot", "stepper-motor", 2)
    end    
    tm.AddUnlock("ll-quantum-resource-processing", "astral-acid-recovery")
end

--PRODUCTION

--CRAFTING MACHINES

if misc.difficulty > 1 and rm.GetIngredientCount("assembling-machine-3", "electric-engine-unit") == 0 then
    rm.AddIngredient("assembling-machine-3", "electric-engine-unit", 2)
end

if misc.difficulty > 1 and not mods["BrassTacks"] then
    rm.AddIngredient("assembling-machine-3", "stepper-motor", 10)
end

if misc.difficulty > 1 and rm.GetIngredientCount("centrifuge", "electric-engine-unit") == 0 then
    tm.AddPrerequisite("uranium-mining", "electric-engine")
    rm.AddIngredient("centrifuge", "electric-engine-unit", 10)
end

if misc.difficulty == 2 and mods["space-age"] then
    rm.ReplaceIngredientProportional("electric-furnace", "advanced-circuit", "heavy-cable", 1)
else
    rm.AddIngredient("electric-furnace", "heavy-cable", 5)
end

if mods["LasingAround"] and misc.difficulty > 1 then
    rm.AddIngredient("laser-mill", "stepper-motor", 20)
    if mods["LunarLandings"] and not mods["space-age"] then
        rm.RemoveIngredient("laser-mill", "cooling-fan", 10)
    end
end

--GENERATORS

if misc.difficulty > 1 then
    tm.AddPrerequisite("electric-energy-accumulators", "gold-electronics")
else
    tm.AddPrerequisite("electric-energy-accumulators", "gold-processing")
end
rm.AddIngredient("accumulator", "gold-wire", 2)

if misc.difficulty == 3 and misc.starting_planet == "nauvis" then
    if rm.GetIngredientCount("solar-panel", "copper-plate") > 0 then
        rm.ReplaceIngredientProportional("solar-panel", "copper-plate", "gold-plate")
    else
        if rm.GetIngredientCount("solar-panel", "copper-plate") > 0 then
            rm.ReplaceIngredientProportional("solar-panel", "lead-plate", "gold-plate")
        else
            rm.AddIngredient("solar-panel", "gold-plate", 5)
        end
    end
    if rm.GetIngredientCount("solar-panel", "gold-plate") then
        tm.AddPrerequisite("solar-energy", "gold-processing")
    end
    --this is extra mean in space age. you can't get regular gold on gleba without recyclers!
end

if misc.difficulty > 1 then
    rm.AddIngredient("steam-turbine", "heavy-cable", 20)
    if misc.difficulty == 3 then
        if mods["BrassTacks"] or mods["IfNickel"] then
            --Too many ingredients.
            rm.ReplaceIngredientProportional("steam-turbine", "copper-plate", "semiboloid-stator", 0.5)
            rm.RemoveIngredient("steam-turbine", "iron-gear-wheel", 99999)
        else
            rm.ReplaceIngredientProportional("steam-turbine", "copper-plate", "semiboloid-stator", 0.3)
        end
    end
end

--MODULES

if (misc.difficulty == 3) or (not data.raw.item["cooling-fan"]) then
    local wire_count = data.raw.item["silicon-wafer"] and 10 or 5
    rm.AddIngredient("speed-module", "gold-wire", wire_count)
    rm.AddIngredient("efficiency-module", "gold-wire", wire_count)
    rm.AddIngredient("productivity-module", "gold-wire", wire_count)
    rm.AddIngredient("quality-module", "gold-wire", wire_count)
end

if mods["space-age"] and misc.difficulty > 2 then
    rm.ReplaceIngredientProportional("speed-module-2", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("efficiency-module-2", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("productivity-module-2", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("quality-module-2", "advanced-circuit", "integrated-circuit", 2)
else
    rm.ReplaceIngredientProportional("speed-module-3", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("efficiency-module-3", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("productivity-module-3", "advanced-circuit", "integrated-circuit", 2)
    rm.ReplaceIngredientProportional("quality-module-3", "advanced-circuit", "integrated-circuit", 2)
end

if misc.difficulty == 1 then
    rm.ReplaceIngredientProportional("beacon", "copper-cable", "gold-wire")
    rm.ReplaceIngredientProportional("beacon", "electronic-circuit", "integrated-circuit")
else
    rm.AddIngredient("beacon", "heavy-cable", 10)
    rm.RemoveIngredient("beacon", "copper-cable", 99999)
    rm.RemoveIngredient("beacon", "tinned-cable", 99999)
    rm.ReplaceIngredientProportional("beacon", "electronic-circuit", "transceiver", 0.25)
    rm.ReplaceIngredientProportional("beacon", "advanced-circuit", "integrated-circuit", 2.5)
end

--MILITARY

--TURRETS
if misc.difficulty > 1 then
    if not mods["IfNickel"] then
        rm.AddIngredient("laser-turret", "stepper-motor", 1)
    end
end

--EQUIPMENT
if misc.difficulty > 1 then
    rm.AddIngredient("personal-roboport-equipment", "transceiver", 10)
    rm.ReplaceIngredientProportional("personal-roboport-equipment", "iron-gear-wheel", "stepper-motor", 1, 10)
end

--AMMUNITION
if misc.difficulty > 1 and not data.raw.item["tracker"] then
    rm.AddIngredient("artillery-shell", "transceiver")
    rm.RemoveIngredient("artillery-shell", "radar")
end

--TUNER
if tune_up_data then
    tune_up_data.ReplaceIngredientProportional("copper-ore", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("nickel-ore", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("copper-plate", "sulfuric-acid", "nitric-acid", 1)
    tune_up_data.ReplaceIngredientProportional("nickel-plate", "sulfuric-acid", "nitric-acid", 1)
end