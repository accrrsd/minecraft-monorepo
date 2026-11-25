# Execute loot insertion for super
data modify storage leaving_heart:temp loot.loot_table set value "leaving_heart:items/heart_shard_super"
execute as @a[tag=lh.super_loot] run function leaving_heart:loot/main
tag @a[tag=lh.super_loot] remove lh.super_loot
