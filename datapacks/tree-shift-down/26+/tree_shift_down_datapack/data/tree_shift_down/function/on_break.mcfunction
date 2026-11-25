# Check if there are connected logs above or adjacent to the broken block
execute if block ~ ~1 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~1 ~1 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~-1 ~1 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~1 ~1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~1 ~-1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~1 ~ ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~-1 ~ ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~ ~1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~ ~-1 #minecraft:logs run return run function tree_shift_down:start_shift

# Upward column checks for floating branches in leaves above the cut trunk
execute if block ~ ~2 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~3 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~4 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~5 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~6 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~7 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~8 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~9 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~10 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~11 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~12 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~13 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~14 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~15 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~16 ~ #minecraft:logs run return run function tree_shift_down:start_shift

# Diagonal upward column checks
execute if block ~1 ~2 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~-1 ~2 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~2 ~1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~2 ~-1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~1 ~3 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~-1 ~3 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~3 ~1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~3 ~-1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~1 ~4 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~-1 ~4 ~ #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~4 ~1 #minecraft:logs run return run function tree_shift_down:start_shift
execute if block ~ ~4 ~-1 #minecraft:logs run return run function tree_shift_down:start_shift
