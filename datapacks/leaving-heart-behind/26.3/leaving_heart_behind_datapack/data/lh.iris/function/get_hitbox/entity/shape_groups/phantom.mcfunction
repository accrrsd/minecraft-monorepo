scoreboard players set $entity_width lh.iris 900000
scoreboard players set $entity_height lh.iris 500000
execute store result score $phantom_size lh.iris run data get entity @s Size
execute if score $phantom_size lh.iris matches 0 run return 0
scoreboard players set $phantom_extra_width lh.iris 135000
scoreboard players operation $phantom_extra_width lh.iris *= $phantom_size lh.iris
scoreboard players operation $entity_width lh.iris += $phantom_extra_width lh.iris
scoreboard players set $phantom_extra_height lh.iris 75000
scoreboard players operation $phantom_extra_height lh.iris *= $phantom_size lh.iris
scoreboard players operation $entity_height lh.iris += $phantom_extra_height lh.iris
