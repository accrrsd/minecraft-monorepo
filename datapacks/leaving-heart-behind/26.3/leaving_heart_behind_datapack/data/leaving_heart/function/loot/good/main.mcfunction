# Advancement trigger handler for good
advancement revoke @s only leaving_heart:loot/good
# Good structures (Stronghold, Trial Vaults): 100% chance (1-3 shards)
tag @s add lh.good_loot
schedule function leaving_heart:loot/good/loot 1
