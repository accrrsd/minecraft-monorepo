# Advancement trigger handler for super
advancement revoke @s only leaving_heart:loot/super
# Super structures (Ancient City, Bastion Treasure): 100% chance (5-7 shards)
tag @s add lh.super_loot
schedule function leaving_heart:loot/super/loot 1
