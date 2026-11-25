scoreboard players enable @a tsd_toggle
execute as @a[scores={tsd_toggle=1..}] run function tree_shift_down:toggle
execute as @a unless score @s tsd.pref matches 0..1 run scoreboard players set @s tsd.pref 1

execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_wood matches 1.. at @s run function tree_shift_down:detect
execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_stone matches 1.. at @s run function tree_shift_down:detect
execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_iron matches 1.. at @s run function tree_shift_down:detect
execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_gold matches 1.. at @s run function tree_shift_down:detect
execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_diamond matches 1.. at @s run function tree_shift_down:detect
execute as @a[scores={tsd.pref=1}] if score @s tsd.axe_netherite matches 1.. at @s run function tree_shift_down:detect

execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_wood 0
execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_stone 0
execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_iron 0
execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_gold 0
execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_diamond 0
execute as @a[scores={tsd.pref=0}] run scoreboard players set @s tsd.axe_netherite 0
