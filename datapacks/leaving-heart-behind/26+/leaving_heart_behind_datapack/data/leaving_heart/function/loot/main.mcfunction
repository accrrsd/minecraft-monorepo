# Perform raycast to find targeted container and inject loot
data remove storage lh.iris:settings Callback
data merge storage lh.iris:settings {TargetEntities: false, Whitelist: "#leaving_heart:chest", MaxRecursionDepth: 16, Blacklist: "#lh.iris:shape_groups/air"}
execute store result score $max_distance lh_temp run attribute @s minecraft:block_interaction_range get 1000000
execute at @s anchored eyes positioned ^ ^ ^ store result score $distance lh_temp run function lh.iris:get_target
execute if score $distance lh_temp <= $max_distance lh_temp at @n[type=minecraft:marker, tag=lh.iris.targeted_block] run function leaving_heart:loot/insert
