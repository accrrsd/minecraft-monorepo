# Process language selection via /trigger lh_select_lang
execute if score @s lh_select_lang matches 1 run scoreboard players set @s lh_lang 1
execute if score #show_chat_messages lh_values matches 1.. if score @s lh_select_lang matches 1 run tellraw @s [{"text":"[Leaving Heart] ","color":"green","bold":true},{"text":"Язык изменён на Русский!","color":"yellow"}]

execute if score @s lh_select_lang matches 2 run scoreboard players set @s lh_lang 2
execute if score #show_chat_messages lh_values matches 1.. if score @s lh_select_lang matches 2 run tellraw @s [{"text":"[Leaving Heart] ","color":"green","bold":true},{"text":"Language changed to English!","color":"yellow"}]

execute if score @s lh_select_lang matches 3 run scoreboard players set @s lh_lang 3
execute if score #show_chat_messages lh_values matches 1.. if score @s lh_select_lang matches 3 run tellraw @s [{"text":"[Leaving Heart] ","color":"green","bold":true},{"text":"¡Idioma cambiado a Español!","color":"yellow"}]

execute if score @s lh_select_lang matches 4 run scoreboard players set @s lh_lang 4
execute if score #show_chat_messages lh_values matches 1.. if score @s lh_select_lang matches 4 run tellraw @s [{"text":"[Leaving Heart] ","color":"green","bold":true},{"text":"语言已更改为简体中文！","color":"yellow"}]

execute if score @s lh_select_lang matches 5 run scoreboard players set @s lh_lang 5
execute if score #show_chat_messages lh_values matches 1.. if score @s lh_select_lang matches 5 run tellraw @s [{"text":"[Leaving Heart] ","color":"green","bold":true},{"text":"Sprache auf Deutsch geändert!","color":"yellow"}]

# Reset trigger score and re-enable trigger for the player
scoreboard players set @s lh_select_lang 0
scoreboard players enable @s lh_select_lang
