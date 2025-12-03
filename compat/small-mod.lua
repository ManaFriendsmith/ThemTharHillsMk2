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