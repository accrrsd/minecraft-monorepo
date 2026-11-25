# Sends "You died! Your health was reduced by X%" in the player's selected language
# Abort if chat messages are disabled
execute unless score #show_chat_messages lh_values matches 1.. run return 0

# 1 = Russian (Русский)
execute if score @s lh_lang matches 1 run tellraw @s [{"text":"[Leaving Heart] ","color":"dark_red"},{"text":"Вы погибли! Ваше здоровье уменьшено на ","color":"red"},{"score":{"name":"#death_loss_percent","objective":"lh_values"},"color":"gold"},{"text":"%!","color":"red"}]

# 2 = English
execute if score @s lh_lang matches 2 run tellraw @s [{"text":"[Leaving Heart] ","color":"dark_red"},{"text":"You died! Your health was reduced by ","color":"red"},{"score":{"name":"#death_loss_percent","objective":"lh_values"},"color":"gold"},{"text":"%!","color":"red"}]

# 3 = Spanish (Español)
execute if score @s lh_lang matches 3 run tellraw @s [{"text":"[Leaving Heart] ","color":"dark_red"},{"text":"¡Has muerto! Tu salud se ha reducido un ","color":"red"},{"score":{"name":"#death_loss_percent","objective":"lh_values"},"color":"gold"},{"text":"%!","color":"red"}]

# 4 = Chinese Simplified (简体中文)
execute if score @s lh_lang matches 4 run tellraw @s [{"text":"[Leaving Heart] ","color":"dark_red"},{"text":"你阵亡了！你的生命值减少了 ","color":"red"},{"score":{"name":"#death_loss_percent","objective":"lh_values"},"color":"gold"},{"text":"%！","color":"red"}]

# 5 = German (Deutsch)
execute if score @s lh_lang matches 5 run tellraw @s [{"text":"[Leaving Heart] ","color":"dark_red"},{"text":"Du bist gestorben! Deine Gesundheit wurde um ","color":"red"},{"score":{"name":"#death_loss_percent","objective":"lh_values"},"color":"gold"},{"text":"% verringert!","color":"red"}]
