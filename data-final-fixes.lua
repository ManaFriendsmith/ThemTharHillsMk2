local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")

--do this in DFF so brimstuff gets its turn.
if misc.difficulty == 3 and mods["space-age"] and #data.raw.recipe["cryogenic-plant"].ingredients > 6 and not mods["maraxsis"] then
    rm.AddIngredient("hydrocoptic-marzelvane", "lithium-plate", 1)
    rm.RemoveIngredient("cryogenic-plant", "lithium-plate", 99999)
end

require("compat.deadlock")

if mods["quality"] and misc.last_pf_mod == "ThemTharHillsMk2" then
    rm.FixStackingRecycling()
    require("__quality__/data-updates.lua")
end