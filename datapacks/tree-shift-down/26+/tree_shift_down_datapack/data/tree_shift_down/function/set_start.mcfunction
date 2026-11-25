scoreboard players set #has_tree tsd.climb 1
execute as @e[type=minecraft:marker,tag=tsd.climber,limit=1] run tp @s ~ ~ ~
summon minecraft:marker ~ ~ ~ {Tags:["tsd.visited"]}
function tree_shift_down:check_leaves
