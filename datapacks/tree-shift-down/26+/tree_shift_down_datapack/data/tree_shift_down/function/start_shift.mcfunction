summon minecraft:marker ~ ~ ~ {Tags:["tsd.target"]}
summon minecraft:marker ~ ~ ~ {Tags:["tsd.climber"]}

# Store destination coordinates into storage
execute store result storage tsd:runtime dest.x int 1 run data get entity @e[type=minecraft:marker,tag=tsd.target,limit=1] Pos[0]
execute store result storage tsd:runtime dest.y int 1 run data get entity @e[type=minecraft:marker,tag=tsd.target,limit=1] Pos[1]
execute store result storage tsd:runtime dest.z int 1 run data get entity @e[type=minecraft:marker,tag=tsd.target,limit=1] Pos[2]

# Reset counters
scoreboard players set #has_tree tsd.climb 0
scoreboard players set #steps tsd.climb 0

# Position climber on the first log of the tree
execute as @e[type=minecraft:marker,tag=tsd.climber,limit=1] at @s run function tree_shift_down:find_start

# If a starting log was found, climb through branches to the furthest tip
execute if score #has_tree tsd.climb matches 1 as @e[type=minecraft:marker,tag=tsd.climber,limit=1] at @s run function tree_shift_down:climb_step

# If climber reached a higher log, shift it down to the target position
execute if score #has_tree tsd.climb matches 1 as @e[type=minecraft:marker,tag=tsd.climber,limit=1] at @s unless entity @e[type=minecraft:marker,tag=tsd.target,distance=..0.5] run function tree_shift_down:shift_move with storage tsd:runtime dest

# Clean up all markers
kill @e[type=minecraft:marker,tag=tsd.target]
kill @e[type=minecraft:marker,tag=tsd.climber]
kill @e[type=minecraft:marker,tag=tsd.visited]
