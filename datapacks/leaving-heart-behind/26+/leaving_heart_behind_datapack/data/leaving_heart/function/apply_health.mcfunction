# Applies current health to player entity using attribute base set
# Clamp lower bound (min HP)
execute if score @s lh_current_hp < #min_hp lh_values run scoreboard players operation @s lh_current_hp = #min_hp lh_values

# Clamp upper bound (server max HP)
execute if score @s lh_current_hp > #max_hp lh_values run scoreboard players operation @s lh_current_hp = #max_hp lh_values

# Store score into storage as double for macro
execute store result storage leaving_heart:temp val double 1 run scoreboard players get @s lh_current_hp

# Call macro function to execute: /attribute @s minecraft:max_health base set $(val)
function leaving_heart:set_hp/base_set_macro with storage leaving_heart:temp
