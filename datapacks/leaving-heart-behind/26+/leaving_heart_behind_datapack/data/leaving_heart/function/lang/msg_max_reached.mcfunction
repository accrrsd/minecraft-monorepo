# Sends "Server maximum health limit reached!" in the player's language
# Abort if chat messages are disabled
execute unless score #show_chat_messages lh_values matches 1.. run return 0

# 1 = Russian (Русский)
execute if score @s lh_lang matches 1 run tellraw @s [{"text":"[Leaving Heart] ","color":"red"},{"text":"Достигнут абсолютный максимум здоровья сервера!","color":"gold"}]

# 2 = English
execute if score @s lh_lang matches 2 run tellraw @s [{"text":"[Leaving Heart] ","color":"red"},{"text":"Server maximum health limit reached!","color":"gold"}]

# 3 = Spanish (Español)
execute if score @s lh_lang matches 3 run tellraw @s [{"text":"[Leaving Heart] ","color":"red"},{"text":"¡Se ha alcanzado el límite máximo de salud del servidor!","color":"gold"}]

# 4 = Chinese Simplified (简体中文)
execute if score @s lh_lang matches 4 run tellraw @s [{"text":"[Leaving Heart] ","color":"red"},{"text":"已达到服务器最大生命值上限！","color":"gold"}]

# 5 = German (Deutsch)
execute if score @s lh_lang matches 5 run tellraw @s [{"text":"[Leaving Heart] ","color":"red"},{"text":"Das maximale Gesundheitslimit des Servers wurde erreicht!","color":"gold"}]
