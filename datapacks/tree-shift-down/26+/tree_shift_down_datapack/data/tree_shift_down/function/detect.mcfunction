scoreboard players set @s tsd.axe_wood 0
scoreboard players set @s tsd.axe_stone 0
scoreboard players set @s tsd.axe_iron 0
scoreboard players set @s tsd.axe_gold 0
scoreboard players set @s tsd.axe_diamond 0
scoreboard players set @s tsd.axe_netherite 0

execute at @s anchored eyes positioned ^ ^ ^1.5 as @e[type=minecraft:item,nbt={Age:0s},distance=..6,limit=1,sort=nearest] at @s align xyz positioned ~ ~ ~ run function tree_shift_down:on_break
