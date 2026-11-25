execute store success score $block_hit lh.iris store result score $block_distance lh.iris run function lh.iris:raycast/test_for_block
execute store success score $entity_hit lh.iris store result score $entity_distance lh.iris run function lh.iris:raycast/test_for_entity
execute if score $block_hit lh.iris matches 1 run return run function lh.iris:raycast/on_hit
execute if score $entity_hit lh.iris matches 1 run return run function lh.iris:raycast/on_hit
execute store result score $to_next_block lh.iris run function lh.iris:raycast/find_next_block
scoreboard players operation $total_distance lh.iris += $to_next_block lh.iris
scoreboard players add $depth lh.iris 1
execute if score $depth lh.iris = $max_depth lh.iris run tag @s remove lh.iris.executing
execute if score $depth lh.iris = $max_depth lh.iris run return fail
execute if data storage lh.iris:data {NextCoordinateChange: "x"} if score $dx lh.iris matches 0.. positioned ~1 ~ ~ run return run function lh.iris:raycast/loop
execute if data storage lh.iris:data {NextCoordinateChange: "x"} if score $dx lh.iris matches ..-1 positioned ~-1 ~ ~ run return run function lh.iris:raycast/loop
execute if data storage lh.iris:data {NextCoordinateChange: "y"} if score $dy lh.iris matches 0.. positioned ~ ~1 ~ run return run function lh.iris:raycast/loop
execute if data storage lh.iris:data {NextCoordinateChange: "y"} if score $dy lh.iris matches ..-1 positioned ~ ~-1 ~ run return run function lh.iris:raycast/loop
execute if data storage lh.iris:data {NextCoordinateChange: "z"} if score $dz lh.iris matches 0.. positioned ~ ~ ~1 run return run function lh.iris:raycast/loop
execute if data storage lh.iris:data {NextCoordinateChange: "z"} if score $dz lh.iris matches ..-1 positioned ~ ~ ~-1 run return run function lh.iris:raycast/loop
execute if score $depth lh.iris < $max_depth lh.iris at @s run return run function lh.iris:raycast/loop
