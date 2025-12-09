if mods["space-age"] and not mods["pf-sa-compat"] then
    error("Them Thar Hills requires PF Space Age compatibility (pf-sa-compat) to work with Space Age. Please download and enable that mod to continue.")
end

require("prototypes/ore")
require("prototypes/particle")
require("prototypes/items-fluids")
require("prototypes/recipes")
require("prototypes/technology")
require("prototypes/scrap-compat")
