# Advancement trigger handler for end_city
advancement revoke @s only leaving_heart:loot/end_city
# End City: 7% chance (1..100 <= 7)
execute store result score $chance lh_temp run random value 1..100
execute if score $chance lh_temp matches 8.. run return fail
tag @s add lh.end_city_loot
schedule function leaving_heart:loot/end_city/loot 1
