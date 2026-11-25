# Extract active speed amplifier (0 for Speed I, 1 for Speed II, etc.)
execute store result score @s ghast_speed_calc run data get entity @s active_effects[{id:"minecraft:speed"}].amplifier

# If amplifier is new or modified, recalculate and apply modifier
execute unless score @s ghast_speed = @s ghast_speed_calc run function ghast_speed:update_modifier
