local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

rm.AddProduct("aop-nauvitian-crushing", {type="item", name="gold-ore", amount=1, independent_probability=0.1})
rm.AddProduct("aop-vulcanusian-crushing", {type="item", name="gold-ore", amount=2, independent_probability=0.1})
rm.AddProduct("aop-fulgoran-crushing", {type="item", name="gold-ore", amount=1, independent_probability=0.05})
rm.AddProduct("aop-gleban-crushing", {type="item", name="gold-powder", amount=1, independent_probability=0.1})

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("aop-arc-furnace", "copper-cable", "heavy-cable", 0.33)
end
