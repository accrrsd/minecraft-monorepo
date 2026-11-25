scoreboard players set @s tsd_mode 0
execute if score @s tsd.mode matches 1 run return run function tree_shift_down:set_mode_always
execute if score @s tsd.mode matches 0 run return run function tree_shift_down:set_mode_shift
