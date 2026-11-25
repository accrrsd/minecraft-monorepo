scoreboard players set @s tsd_toggle 0
execute if score @s tsd.pref matches 1 run return run function tree_shift_down:disable_player
execute if score @s tsd.pref matches 0 run return run function tree_shift_down:enable_player
