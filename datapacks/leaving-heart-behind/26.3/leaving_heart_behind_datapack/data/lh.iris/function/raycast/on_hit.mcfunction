tag @s remove lh.iris.executing
execute if score $block_hit lh.iris matches 1 if score $entity_hit lh.iris matches 0 run data modify storage lh.iris:output TargetType set value "BLOCK"
execute if score $entity_hit lh.iris matches 1 if score $block_hit lh.iris matches 0 run data modify storage lh.iris:output TargetType set value "ENTITY"
execute if score $block_hit lh.iris matches 1 if score $entity_hit lh.iris matches 1 if score $block_distance lh.iris <= $entity_distance lh.iris run data modify storage lh.iris:output TargetType set value "BLOCK"
execute if score $block_hit lh.iris matches 1 if score $entity_hit lh.iris matches 1 if score $block_distance lh.iris > $entity_distance lh.iris run data modify storage lh.iris:output TargetType set value "ENTITY"
execute if data storage lh.iris:output {TargetType: "BLOCK"} run data modify storage lh.iris:output TargetedBlock set value [0, 0, 0]
execute if data storage lh.iris:output {TargetType: "BLOCK"} store result storage lh.iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] lh.iris
execute if data storage lh.iris:output {TargetType: "BLOCK"} store result storage lh.iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] lh.iris
execute if data storage lh.iris:output {TargetType: "BLOCK"} store result storage lh.iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] lh.iris
execute if data storage lh.iris:output {TargetType: "BLOCK"} align xyz run summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags: ["iris", "lh.iris.targeted_block"]}
execute if data storage lh.iris:output {TargetType: "ENTITY"} run data modify storage lh.iris:output TargetedEntity set from storage lh.iris:data TargetedBox.entity_id
execute if data storage lh.iris:output {TargetType: "ENTITY"} run data remove storage lh.iris:data TargetedBox.entity_id
execute if data storage lh.iris:output {TargetType: "ENTITY"} run data remove storage lh.iris:data TargetedFace.entity_id
execute if data storage lh.iris:output {TargetType: "ENTITY"} store result score $entity_id lh.iris run data get storage lh.iris:output TargetedEntity
execute if data storage lh.iris:output {TargetType: "ENTITY"} as @e[tag=lh.iris.possible_target] if score @s lh.iris.id = $entity_id lh.iris run tag @s add lh.iris.targeted_entity
execute if data storage lh.iris:output {TargetType: "ENTITY"} run tag @e remove lh.iris.possible_target
data modify storage lh.iris:output TargetPosition.tile set value [0, 0, 0]
execute store result storage lh.iris:output TargetPosition.tile[0] int 1 run scoreboard players get $[x] lh.iris
execute store result storage lh.iris:output TargetPosition.tile[1] int 1 run scoreboard players get $[y] lh.iris
execute store result storage lh.iris:output TargetPosition.tile[2] int 1 run scoreboard players get $[z] lh.iris
data modify storage lh.iris:output TargetPosition.point set from storage lh.iris:data TargetPoint
execute store result score ${x} lh.iris run data get storage lh.iris:output TargetPosition.point[0] 1000000
execute store result score ${y} lh.iris run data get storage lh.iris:output TargetPosition.point[1] 1000000
execute store result score ${z} lh.iris run data get storage lh.iris:output TargetPosition.point[2] 1000000
data modify storage lh.iris:output TargetedBox set from storage lh.iris:data TargetedBox
data modify storage lh.iris:output TargetedFace set from storage lh.iris:data TargetedFace
execute if data storage lh.iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx lh.iris matches 0.. run data modify storage lh.iris:output TargetedFace.Direction set value "WEST"
execute if data storage lh.iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx lh.iris matches ..-1 run data modify storage lh.iris:output TargetedFace.Direction set value "EAST"
execute if data storage lh.iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy lh.iris matches 0.. run data modify storage lh.iris:output TargetedFace.Direction set value "DOWN"
execute if data storage lh.iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy lh.iris matches ..-1 run data modify storage lh.iris:output TargetedFace.Direction set value "UP"
execute if data storage lh.iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz lh.iris matches 0.. run data modify storage lh.iris:output TargetedFace.Direction set value "NORTH"
execute if data storage lh.iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz lh.iris matches ..-1 run data modify storage lh.iris:output TargetedFace.Direction set value "SOUTH"
execute if data storage lh.iris:output {TargetType: "BLOCK"} run scoreboard players operation $total_distance lh.iris += $block_distance lh.iris
execute if data storage lh.iris:output {TargetType: "ENTITY"} run scoreboard players operation $total_distance lh.iris += $entity_distance lh.iris
execute store result storage lh.iris:output Distance double 0.000001 run scoreboard players get $total_distance lh.iris
execute if data storage lh.iris:settings Callback run data modify storage lh.iris:args function set from storage lh.iris:settings Callback
execute if data storage lh.iris:settings Callback run function lh.iris:raycast/macro_functions/callback with storage lh.iris:args
return run scoreboard players get $total_distance lh.iris
