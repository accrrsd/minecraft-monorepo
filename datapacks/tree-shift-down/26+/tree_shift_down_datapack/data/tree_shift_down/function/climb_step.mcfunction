scoreboard players add #steps tsd.climb 1
execute if score #steps tsd.climb matches 128.. run return 0
scoreboard players set #stepped tsd.climb 0

# 1. Direct vertical (Y+1)
execute if score #stepped tsd.climb matches 0 positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 2. Diagonal vertical (Y+1)
execute if score #stepped tsd.climb matches 0 positioned ~1 ~1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 3. High vertical gaps (Y+2, Y+3)
execute if score #stepped tsd.climb matches 0 positioned ~ ~2 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~3 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 4. Diagonal gap vertical (Y+2, and 2-block horizontal reaches with Y+1)
execute if score #stepped tsd.climb matches 0 positioned ~1 ~2 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~2 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~2 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~2 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~2 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~2 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~2 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~2 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~1 ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~1 ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~1 ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~1 ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~1 ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~1 ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~2 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~2 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~2 ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~2 ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 5. Horizontal canopy branch reach (Y=0)
execute if score #stepped tsd.climb matches 0 positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~ ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~ ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~ ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~ ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~ ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~ ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 6. Downward drooping branch reach (Y-1)
execute if score #stepped tsd.climb matches 0 positioned ~1 ~-1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~-1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~-1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~-1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~-1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~-1 ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~1 ~-1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-1 ~-1 ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~2 ~-1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~-2 ~-1 ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~-1 ~2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here
execute if score #stepped tsd.climb matches 0 positioned ~ ~-1 ~-2 if block ~ ~ ~ #minecraft:logs unless entity @e[type=minecraft:marker,tag=tsd.visited,distance=..0.8] run function tree_shift_down:step_here

# 7. Tail recursion: If a step was taken, continue climbing from the new position
execute if score #stepped tsd.climb matches 1 as @e[type=minecraft:marker,tag=tsd.climber,limit=1] at @s run function tree_shift_down:climb_step
