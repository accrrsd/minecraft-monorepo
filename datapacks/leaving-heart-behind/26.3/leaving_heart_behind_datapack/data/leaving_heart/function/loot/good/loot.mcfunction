# Execute loot insertion for good
data modify storage leaving_heart:temp loot.loot_table set value "leaving_heart:items/heart_shard_good"
execute as @a[tag=lh.good_loot] run function leaving_heart:loot/main
tag @a[tag=lh.good_loot] remove lh.good_loot
