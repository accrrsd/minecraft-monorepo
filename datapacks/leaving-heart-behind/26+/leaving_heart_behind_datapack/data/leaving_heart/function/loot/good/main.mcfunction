# Advancement trigger handler for good
advancement revoke @s only leaving_heart:loot/good
# Good structures (Stronghold, Trial Vaults): percentage chance from config (#loot_chance_good, default: 10% -> ~1-2 shards per structure)
execute store result score $chance lh_temp run random value 1..100
execute if score $chance lh_temp > #loot_chance_good lh_values run return fail
tag @s add lh.good_loot
schedule function leaving_heart:loot/good/loot 1
