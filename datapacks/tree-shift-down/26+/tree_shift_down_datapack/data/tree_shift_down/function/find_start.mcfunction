scoreboard players set #has_tree tsd.climb 0

# 1. Immediate upward
execute if score #has_tree tsd.climb matches 0 positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start

# 2. Immediate horizontal & diagonal
execute if score #has_tree tsd.climb matches 0 positioned ~1 ~1 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~-1 ~1 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~1 ~1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~1 ~-1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start

# 3. Upward column search (for disconnected branches floating in leaves)
execute if score #has_tree tsd.climb matches 0 positioned ~ ~2 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~3 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~4 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~5 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~6 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~7 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~8 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~9 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~10 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~11 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~12 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~13 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~14 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~15 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~16 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start

# 4. Diagonal upward column search
execute if score #has_tree tsd.climb matches 0 positioned ~1 ~2 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~-1 ~2 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~2 ~1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~2 ~-1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~1 ~3 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~-1 ~3 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~3 ~1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~3 ~-1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~1 ~4 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~-1 ~4 ~ if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~4 ~1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
execute if score #has_tree tsd.climb matches 0 positioned ~ ~4 ~-1 if block ~ ~ ~ #minecraft:logs run function tree_shift_down:set_start
