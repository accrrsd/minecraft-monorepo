# Enable triggers for all players
scoreboard players enable @a tsd_toggle
scoreboard players enable @a tsd_mode
scoreboard players enable @a tsd_lang

# Handle trigger actions
execute as @a[scores={tsd_toggle=1..}] run function tree_shift_down:toggle
execute as @a[scores={tsd_mode=1..}] run function tree_shift_down:toggle_mode
execute as @a[scores={tsd_lang=1..}] run function tree_shift_down:toggle_lang

# Initialize default preferences for new players
execute as @a unless score @s tsd.pref matches 0..1 run scoreboard players operation @s tsd.pref = #default_enabled tsd.config
execute as @a unless score @s tsd.mode matches 0..1 run scoreboard players operation @s tsd.mode = #default_mode tsd.config
execute as @a unless score @s tsd.lang matches 1..6 run scoreboard players operation @s tsd.lang = #default_lang tsd.config

# Track sneak state
scoreboard players add @a tsd.sneak 0
execute as @a unless score @s tsd.sneak_prev matches -2147483648..2147483647 run scoreboard players operation @s tsd.sneak_prev = @s tsd.sneak

# Determine which players can activate shift-down this tick
execute as @a run tag @s remove tsd.can_shift

# Mode 0 (Always / In full height): active if enabled (tsd.pref=1)
execute as @a[scores={tsd.pref=1,tsd.mode=0}] run tag @s add tsd.can_shift

# Mode 1 (Shift required): active if enabled (tsd.pref=1) and sneaking
execute as @a[scores={tsd.pref=1,tsd.mode=1}] if score @s tsd.sneak > @s tsd.sneak_prev run tag @s add tsd.can_shift

# Update sneak previous score
execute as @a run scoreboard players operation @s tsd.sneak_prev = @s tsd.sneak

# Detect tree chopping for eligible players
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_wood matches 1.. at @s run function tree_shift_down:detect
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_stone matches 1.. at @s run function tree_shift_down:detect
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_iron matches 1.. at @s run function tree_shift_down:detect
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_gold matches 1.. at @s run function tree_shift_down:detect
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_diamond matches 1.. at @s run function tree_shift_down:detect
execute as @a[tag=tsd.can_shift] if score @s tsd.axe_netherite matches 1.. at @s run function tree_shift_down:detect

# Reset axe usage for non-eligible players
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_wood 0
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_stone 0
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_iron 0
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_gold 0
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_diamond 0
execute as @a[tag=!tsd.can_shift] run scoreboard players set @s tsd.axe_netherite 0
