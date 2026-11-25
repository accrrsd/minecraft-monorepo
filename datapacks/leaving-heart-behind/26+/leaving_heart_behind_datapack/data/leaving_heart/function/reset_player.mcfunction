# Restore health attribute to original base health (lh_base_hp, fallback to 20 if unset)
execute unless score @s lh_base_hp matches 1.. run scoreboard players set @s lh_base_hp 20
execute store result storage leaving_heart:temp val double 1 run scoreboard players get @s lh_base_hp
function leaving_heart:set_hp/base_set_macro with storage leaving_heart:temp

# Instantly heal to fill newly restored hearts
effect give @s instant_health 1 0 true

# Remove all datapack tags
tag @s remove lh_initialized
tag @s remove lh_dead

# Revoke all custom advancements
advancement revoke @s only leaving_heart:use_shard
advancement revoke @s only leaving_heart:use_potion
