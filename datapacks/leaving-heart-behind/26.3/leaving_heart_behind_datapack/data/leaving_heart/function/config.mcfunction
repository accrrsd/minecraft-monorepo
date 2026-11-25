# Datapack Configuration File
# This file is the single source of truth for all datapack parameters.
# Settings in this file are automatically loaded on world startup and upon running /reload.
# Modify values directly in this file to configure the datapack.

# 1. Minimum health limit (default: 1 HP = 0.5 heart, cannot drop lower on death)
scoreboard players set #min_hp lh_values 1

# 2. Maximum health limit (default: 60 HP = 30 hearts, cap for heart shard expansions)
scoreboard players set #max_hp lh_values 60

# 3. Default base health for new players (default: 20 HP = 10 hearts)
scoreboard players set #default_base_hp lh_values 20

# 4. Default server language for new players (1=ru, 2=en, 3=es, 4=zh, 5=de; default: 1 = Russian)
scoreboard players set #server_lang lh_values 1

# 5. Health gained per Heart Shard (default: 1 HP = 0.5 heart container)
scoreboard players set #shard_hp lh_values 1

# 6. Maximum health that Health Restoration Potions can restore
# 0 = restores up to full base health (default: 20 HP = 10 hearts)
# Any number = maximum HP threshold potion can heal up to (default: 10 HP = 5 hearts)
scoreboard players set #potion_max_hp lh_values 10

# 7. Health reduction percentage upon death (default: 50 = 50% health lost / *0.5)
# Value represents the percentage of health lost on death (e.g. 50 = 50%, 25 = 25%, 75 = 75%)
scoreboard players set #death_loss_percent lh_values 50

# 8. Show chat messages toggle (1 = enabled [default], 0 = disabled / silent mode)
# When set to 0, gameplay notifications (death penalty, heart shard gain, limit reached) and load alerts are disabled.
scoreboard players set #show_chat_messages lh_values 1

# Administrator confirmation message
execute if score #show_chat_messages lh_values matches 1.. run tellraw @a[tag=lh_admin] [{"text":"[Leaving Heart] ","color":"gold","bold":true},{"text":"Configuration loaded from config.mcfunction (Min: 1, Max: 60, Base: 20, Shard HP: 1, Potion Max: 10, Loss: 50%, Lang: 1, Chat: On).","color":"green"}]

