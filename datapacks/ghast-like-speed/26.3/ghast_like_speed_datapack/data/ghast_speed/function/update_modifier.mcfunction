# Save current amplifier so tick does not trigger redundant updates
scoreboard players operation @s ghast_speed = @s ghast_speed_calc

# Calculate level: amplifier + 1
scoreboard players operation #level ghast_speed_calc = @s ghast_speed_calc
scoreboard players add #level ghast_speed_calc 1

# Calculate modifier magnitude: +20% flying speed per level (0.2 * level)
execute store result storage ghast_speed:macro modifier.amount double 0.2 run scoreboard players get #level ghast_speed_calc

# Apply modifier via macro
function ghast_speed:apply_modifier with storage ghast_speed:macro modifier
