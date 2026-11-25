execute if score @s tsd_lang matches 1..6 run scoreboard players operation @s tsd.lang = @s tsd_lang
execute if score @s tsd_lang matches 7.. run scoreboard players set @s tsd.lang 1
scoreboard players set @s tsd_lang 0
function tree_shift_down:status_message
