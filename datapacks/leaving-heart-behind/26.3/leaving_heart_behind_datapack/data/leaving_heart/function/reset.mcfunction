# Admin Reset Command: /function leaving_heart:reset
# Cleans up all datapack data, restores player health to base, and removes all scoreboards.
# Safe to run before uninstalling or disabling the datapack.

# 1. Reset all online players back to initial base health
execute as @a run function leaving_heart:reset_player

# 2. Clear temporary macro and iris storages
data remove storage leaving_heart:temp
data remove storage lh.iris:data
data remove storage lh.iris:settings
data remove storage lh.iris:output
data remove storage lh.iris:args

# 3. Broadcast confirmation message to chat
execute if score #show_chat_messages lh_values matches 1.. run tellraw @a [{"text":"[Leaving Heart] ","color":"red","bold":true},{"text":"Datapack data has been reset! All players' health restored to base. / Данные датапака сброшены, здоровье игроков возвращено к исходному.","color":"green"}]

# 4. Remove all datapack and iris scoreboard objectives
scoreboard objectives remove lh_deaths
scoreboard objectives remove lh_time_since_death
scoreboard objectives remove lh_used_potion
scoreboard objectives remove lh_used_shard
scoreboard objectives remove lh_base_hp
scoreboard objectives remove lh_current_hp
scoreboard objectives remove lh_max_hp
scoreboard objectives remove lh_values
scoreboard objectives remove lh_temp
scoreboard objectives remove lh_lang
scoreboard objectives remove lh_select_lang
scoreboard objectives remove lh.iris
scoreboard objectives remove lh.iris.id

# 5. Revoke loot injection advancements from all players
advancement revoke @a only leaving_heart:loot/common
advancement revoke @a only leaving_heart:loot/end_city
advancement revoke @a only leaving_heart:loot/good
advancement revoke @a only leaving_heart:loot/super

