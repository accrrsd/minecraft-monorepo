# Checks and ensures player and server have all required scoreboard values initialized
# Config fallbacks & constants
execute unless score #c2 lh_values matches 2 run scoreboard players set #c2 lh_values 2
execute unless score #c100 lh_values matches 100 run scoreboard players set #c100 lh_values 100
execute unless score #c99 lh_values matches 99 run scoreboard players set #c99 lh_values 99
execute unless score #shard_hp lh_values matches 1.. run scoreboard players set #shard_hp lh_values 2
execute unless score #potion_heal_hp lh_values matches 1.. run scoreboard players set #potion_heal_hp lh_values 12
execute unless score #potion_max_hp lh_values matches 0.. run scoreboard players set #potion_max_hp lh_values 10
execute unless score #death_loss_percent lh_values matches 0..100 run scoreboard players set #death_loss_percent lh_values 50
execute unless score #show_chat_messages lh_values matches 0..1 run scoreboard players set #show_chat_messages lh_values 1
execute unless score #loot_chance_common lh_values matches 0..100 run scoreboard players set #loot_chance_common lh_values 5
execute unless score #loot_chance_end_city lh_values matches 0..100 run scoreboard players set #loot_chance_end_city lh_values 7
execute unless score #loot_chance_good lh_values matches 0..100 run scoreboard players set #loot_chance_good lh_values 10
execute unless score #loot_chance_super lh_values matches 0..100 run scoreboard players set #loot_chance_super lh_values 10

# 1. Base HP (e.g. 20, or origins/modded health)
execute unless score @s lh_base_hp matches 1.. store result score @s lh_base_hp run attribute @s minecraft:max_health base get 1
execute unless score @s lh_base_hp matches 1.. run scoreboard players operation @s lh_base_hp = #default_base_hp lh_values

# 2. Max HP capacity (at least base_hp)
execute unless score @s lh_max_hp matches 1.. run scoreboard players operation @s lh_max_hp = @s lh_base_hp
execute if score @s lh_max_hp < @s lh_base_hp run scoreboard players operation @s lh_max_hp = @s lh_base_hp

# 3. Current HP (at least min_hp, at most max_hp)
execute unless score @s lh_current_hp matches 1.. run scoreboard players operation @s lh_current_hp = @s lh_max_hp
execute if score @s lh_current_hp > @s lh_max_hp run scoreboard players operation @s lh_current_hp = @s lh_max_hp

# 4. Language preference
execute unless score @s lh_lang matches 1..5 run scoreboard players operation @s lh_lang = #server_lang lh_values

# 5. Enable language trigger
scoreboard players enable @s lh_select_lang

# 6. Mark player as initialized
tag @s add lh_initialized
