scoreboard players set #stepped tsd.climb 1
execute as @e[type=minecraft:marker,tag=tsd.climber,limit=1] run tp @s ~ ~ ~
summon minecraft:marker ~ ~ ~ {Tags:["tsd.visited"]}
execute if score #has_leaves tsd.climb matches 0 run function tree_shift_down:check_leaves
