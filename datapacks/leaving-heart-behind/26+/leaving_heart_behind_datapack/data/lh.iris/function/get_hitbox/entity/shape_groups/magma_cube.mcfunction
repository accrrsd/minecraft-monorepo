scoreboard players set $entity_width lh.iris 510000
scoreboard players set $entity_height lh.iris 510000
execute store result score $slime_size lh.iris run data get entity @s Size
scoreboard players add $slime_size lh.iris 1
scoreboard players operation $entity_width lh.iris *= $slime_size lh.iris
scoreboard players operation $entity_height lh.iris *= $slime_size lh.iris
