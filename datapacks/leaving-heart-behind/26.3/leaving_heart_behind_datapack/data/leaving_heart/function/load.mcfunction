# Initialize scoreboards
scoreboard objectives add lh_deaths deathCount
scoreboard objectives add lh_time_since_death minecraft.custom:minecraft.time_since_death
scoreboard objectives add lh_used_potion minecraft.used:minecraft.potion
scoreboard objectives add lh_used_shard minecraft.used:minecraft.apple
scoreboard objectives add lh_base_hp dummy
scoreboard objectives add lh_current_hp dummy
scoreboard objectives add lh_max_hp dummy
scoreboard objectives add lh_values dummy
scoreboard objectives add lh_temp dummy
scoreboard objectives add lh_lang dummy
scoreboard objectives add lh_select_lang trigger

# Constant values
scoreboard players set #c2 lh_values 2
scoreboard players set #c100 lh_values 100
scoreboard players set #c99 lh_values 99

# Load configuration settings (defaults or admin-configured values)
function leaving_heart:config

# Revoke consumption advancements to prevent any stuck state
advancement revoke @a only leaving_heart:use_shard
advancement revoke @a only leaving_heart:use_potion

# Initialize Iris raycasting library for chest loot injection
function lh.iris:setup/load

# Initialize and validate scores for all online players
execute as @a run function leaving_heart:player_check_init

# Welcome / load message to administrators
execute if score #show_chat_messages lh_values matches 1.. run tellraw @a[tag=lh_admin] [{"text":"[Leaving Heart] ","color":"red","bold":true},{"text":"Datapack successfully loaded! / Датапак успешно загружен!","color":"green"}]
