scoreboard players set $entity_found lh.iris 0
execute if score $entity_found lh.iris matches 0 if entity @s[type=#lh.iris:tree/0] run function lh.iris:get_hitbox/entity/tree/0
execute if score $entity_found lh.iris matches 0 if entity @s[type=#lh.iris:tree/1] run function lh.iris:get_hitbox/entity/tree/1
execute if score $entity_found lh.iris matches 0 if entity @s[type=#lh.iris:tree/2] run function lh.iris:get_hitbox/entity/tree/2
execute if score $entity_found lh.iris matches 0 if entity @s[type=#lh.iris:tree/3] run function lh.iris:get_hitbox/entity/tree/3
execute if score $entity_found lh.iris matches 0 if entity @s[type=#lh.iris:tree/4] run function lh.iris:get_hitbox/entity/tree/4
function lh.iris:get_hitbox/entity/scale
execute if predicate lh.iris:baby run scoreboard players operation $entity_width lh.iris /= $2 lh.iris
execute if predicate lh.iris:baby run scoreboard players operation $entity_height lh.iris /= $2 lh.iris
scoreboard players operation $entity_[x] lh.iris = $[x] lh.iris
scoreboard players operation $entity_[y] lh.iris = $[y] lh.iris
scoreboard players operation $entity_[z] lh.iris = $[z] lh.iris
scoreboard players operation $entity_{x} lh.iris = ${x} lh.iris
scoreboard players operation $entity_{y} lh.iris = ${y} lh.iris
scoreboard players operation $entity_{z} lh.iris = ${z} lh.iris
execute at @s summon minecraft:marker run function lh.iris:get_position/get_coordinates
kill @e[type=minecraft:marker, tag=lh.iris.coordinate_getter]
scoreboard players operation $entity_[x] lh.iris >< $[x] lh.iris
scoreboard players operation $entity_[y] lh.iris >< $[y] lh.iris
scoreboard players operation $entity_[z] lh.iris >< $[z] lh.iris
scoreboard players operation $entity_{x} lh.iris >< ${x} lh.iris
scoreboard players operation $entity_{y} lh.iris >< ${y} lh.iris
scoreboard players operation $entity_{z} lh.iris >< ${z} lh.iris
scoreboard players operation $entity_dx lh.iris = $entity_[x] lh.iris
scoreboard players operation $entity_dx lh.iris -= $[x] lh.iris
scoreboard players operation $entity_dx lh.iris *= $1000000 lh.iris
scoreboard players operation $entity_dx lh.iris += $entity_{x} lh.iris
scoreboard players operation $entity_dy lh.iris = $entity_[y] lh.iris
scoreboard players operation $entity_dy lh.iris -= $[y] lh.iris
scoreboard players operation $entity_dy lh.iris *= $1000000 lh.iris
scoreboard players operation $entity_dy lh.iris += $entity_{y} lh.iris
scoreboard players operation $entity_dz lh.iris = $entity_[z] lh.iris
scoreboard players operation $entity_dz lh.iris -= $[z] lh.iris
scoreboard players operation $entity_dz lh.iris *= $1000000 lh.iris
scoreboard players operation $entity_dz lh.iris += $entity_{z} lh.iris
scoreboard players operation $entity_half_width lh.iris = $entity_width lh.iris
scoreboard players operation $entity_half_width lh.iris /= $2 lh.iris
scoreboard players operation $entity_x0 lh.iris = $entity_dx lh.iris
scoreboard players operation $entity_x0 lh.iris -= $entity_half_width lh.iris
execute if score $entity_x0 lh.iris matches ..0 run scoreboard players set $entity_x0 lh.iris 0
scoreboard players operation $entity_y0 lh.iris = $entity_dy lh.iris
execute if score $entity_y0 lh.iris matches ..0 run scoreboard players set $entity_y0 lh.iris 0
scoreboard players operation $entity_z0 lh.iris = $entity_dz lh.iris
scoreboard players operation $entity_z0 lh.iris -= $entity_half_width lh.iris
execute if score $entity_z0 lh.iris matches ..0 run scoreboard players set $entity_z0 lh.iris 0
scoreboard players operation $entity_x1 lh.iris = $entity_dx lh.iris
scoreboard players operation $entity_x1 lh.iris += $entity_half_width lh.iris
execute if score $entity_x1 lh.iris matches 1000000.. run scoreboard players set $entity_x1 lh.iris 1000000
scoreboard players operation $entity_y1 lh.iris = $entity_dy lh.iris
scoreboard players operation $entity_y1 lh.iris += $entity_height lh.iris
execute if score $entity_y1 lh.iris matches 1000000.. run scoreboard players set $entity_y1 lh.iris 1000000
scoreboard players operation $entity_z1 lh.iris = $entity_dz lh.iris
scoreboard players operation $entity_z1 lh.iris += $entity_half_width lh.iris
execute if score $entity_z1 lh.iris matches 1000000.. run scoreboard players set $entity_z1 lh.iris 1000000
data modify storage lh.iris:data Shape append value {type: "ENTITY", min: [0.0d, 0.0d, 0.0d], max: [0.0d, 0.0d, 0.0d]}
execute store result storage lh.iris:data Shape[-1].min[0] double 0.000001 run scoreboard players get $entity_x0 lh.iris
execute store result storage lh.iris:data Shape[-1].min[1] double 0.000001 run scoreboard players get $entity_y0 lh.iris
execute store result storage lh.iris:data Shape[-1].min[2] double 0.000001 run scoreboard players get $entity_z0 lh.iris
execute store result storage lh.iris:data Shape[-1].max[0] double 0.000001 run scoreboard players get $entity_x1 lh.iris
execute store result storage lh.iris:data Shape[-1].max[1] double 0.000001 run scoreboard players get $entity_y1 lh.iris
execute store result storage lh.iris:data Shape[-1].max[2] double 0.000001 run scoreboard players get $entity_z1 lh.iris
tag @s add lh.iris.possible_target
scoreboard players operation @s lh.iris.id = $max_entity_id lh.iris.id
execute store result storage lh.iris:data Shape[-1].entity_id int 1 run scoreboard players get @s lh.iris.id
scoreboard players add $max_entity_id lh.iris.id 1
