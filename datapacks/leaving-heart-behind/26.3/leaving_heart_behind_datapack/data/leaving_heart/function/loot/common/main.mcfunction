# Advancement trigger handler for common
advancement revoke @s only leaving_heart:loot/common
# Common structures: 5% chance (1 in 20)
execute store result score $chance lh_temp run random value 1..20
execute if score $chance lh_temp matches 2.. run return fail
tag @s add lh.common_loot
schedule function leaving_heart:loot/common/loot 1
