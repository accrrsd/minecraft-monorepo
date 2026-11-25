# Advancement trigger handler for super
advancement revoke @s only leaving_heart:loot/super
# Super structures (Ancient City, Bastions): percentage chance from config (#loot_chance_super, default: 10% -> ~2-4 shards per Ancient City)
execute store result score $chance lh_temp run random value 1..100
execute if score $chance lh_temp > #loot_chance_super lh_values run return fail
tag @s add lh.super_loot
schedule function leaving_heart:loot/super/loot 1
