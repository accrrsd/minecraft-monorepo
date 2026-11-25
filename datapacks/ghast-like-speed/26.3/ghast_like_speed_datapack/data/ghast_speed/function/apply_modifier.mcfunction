# Macro function to apply dynamic flying speed modifier
attribute @s minecraft:flying_speed modifier remove ghast_speed:speed_boost
$attribute @s minecraft:flying_speed modifier add ghast_speed:speed_boost $(amount) add_multiplied_base
