tag @e remove lh.iris.targeted_entity
tag @e remove lh.iris.possible_target
kill @e[type=minecraft:marker, tag=lh.iris.targeted_block]
scoreboard players reset * lh.iris.id
data modify storage lh.iris:output TargetType set value "NONE"
data remove storage lh.iris:output TargetedBlock
data remove storage lh.iris:output TargetedEntity
data remove storage lh.iris:output TargetPosition
data remove storage lh.iris:output Distance
data remove storage lh.iris:output TargetedBox
data remove storage lh.iris:output TargetedFace
scoreboard players set $depth lh.iris 0
scoreboard players set $min_distance lh.iris 2147483647
scoreboard players set $max_entity_id lh.iris 0
scoreboard players set $total_distance lh.iris 0
execute summon minecraft:marker run function lh.iris:get_position/main
tag @s add lh.iris.executing
execute store result score $max_depth lh.iris run data get storage lh.iris:settings MaxRecursionDepth
return run function lh.iris:raycast/loop
