execute unless data storage lh.iris:settings {TargetEntities: true} run return fail
execute align xyz unless entity @e[type=!#lh.iris:ignore, tag=!lh.iris.ignore, dx=0, dy=0, dz=0, tag=!lh.iris.executing] run return fail
execute align xyz as @e[type=!#lh.iris:ignore, tag=!lh.iris.ignore, dx=0, dy=0, dz=0, tag=!lh.iris.executing] run function lh.iris:get_hitbox/entity
return run function lh.iris:raycast/check_intersection/loop
