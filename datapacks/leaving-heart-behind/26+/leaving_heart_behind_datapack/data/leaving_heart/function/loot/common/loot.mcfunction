# Execute loot insertion for common
data modify storage leaving_heart:temp loot.loot_table set value "leaving_heart:items/heart_shard"
execute as @a[tag=lh.common_loot] run function leaving_heart:loot/main
tag @a[tag=lh.common_loot] remove lh.common_loot
