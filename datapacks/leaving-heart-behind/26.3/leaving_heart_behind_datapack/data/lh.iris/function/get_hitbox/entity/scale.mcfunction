execute store result score $attribute_scale lh.iris run attribute @s minecraft:scale get 1000
execute if score $attribute_scale lh.iris matches 0 run return fail
execute if score $attribute_scale lh.iris matches 1000 run return 0
scoreboard players operation $entity_width lh.iris /= $10 lh.iris
scoreboard players operation $entity_width lh.iris *= $attribute_scale lh.iris
scoreboard players operation $entity_width lh.iris /= $100 lh.iris
scoreboard players operation $entity_height lh.iris /= $10 lh.iris
scoreboard players operation $entity_height lh.iris *= $attribute_scale lh.iris
scoreboard players operation $entity_height lh.iris /= $100 lh.iris
