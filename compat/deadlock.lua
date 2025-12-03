
if deadlock then
  deadlock.add_stack("gold-ore", "__ThemTharHillsMk2__/graphics/icons/stacking/gold-ore-stacked.png", "deadlock-stacking-1", 64)
  deadlock.add_stack("gold-plate", "__ThemTharHillsMk2__/graphics/icons/stacking/gold-plate-stacked.png", "deadlock-stacking-1", 64)
  deadlock.add_stack("gold-powder", "__ThemTharHillsMk2__/graphics/icons/stacking/gold-powder-stacked.png", "deadlock-stacking-1", 64)
  deadlock.add_stack("gold-wire", "__ThemTharHillsMk2__/graphics/icons/stacking/gold-wire-stacked.png", "deadlock-stacking-2", 64)
  deadlock.add_stack("integrated-circuit", "__ThemTharHillsMk2__/graphics/icons/stacking/integrated-circuit-stacked.png", "deadlock-stacking-3", 64)
  data.raw.item["deadlock-stack-gold-plate"].ib_badge = "Au"
  data.raw.item["deadlock-stack-gold-wire"].ib_badge = "Au"
  data.raw.item["deadlock-stack-gold-ore"].ib_badge = "Au"
  data.raw.item["deadlock-stack-gold-powder"].ib_badge = "Au"
end

if deadlock_crating then
  deadlock_crating.add_crate("gold-ore", "deadlock-crating-1")
  deadlock_crating.add_crate("gold-plate", "deadlock-crating-1")
  deadlock_crating.add_crate("gold-powder", "deadlock-crating-1")
  deadlock_crating.add_crate("gold-wire", "deadlock-crating-2")
  deadlock_crating.add_crate("integrated-circuit", "deadlock-crating-3")
  data.raw.item["deadlock-crate-gold-plate"].ib_badge = "Au"
  data.raw.item["deadlock-crate-gold-wire"].ib_badge = "Au"
  data.raw.item["deadlock-crate-gold-ore"].ib_badge = "Au"
  data.raw.item["deadlock-crate-gold-powder"].ib_badge = "Au"
end