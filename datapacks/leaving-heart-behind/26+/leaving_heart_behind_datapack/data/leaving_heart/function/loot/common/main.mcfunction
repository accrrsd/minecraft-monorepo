# Advancement trigger handler for common
advancement revoke @s only leaving_heart:loot/common
# Common structures: percentage chance from config (#loot_chance_common, default: 5%)
execute store result score $chance lh_temp run random value 1..100
execute if score $chance lh_temp > #loot_chance_common lh_values run return fail
tag @s add lh.common_loot
schedule function leaving_heart:loot/common/loot 1
