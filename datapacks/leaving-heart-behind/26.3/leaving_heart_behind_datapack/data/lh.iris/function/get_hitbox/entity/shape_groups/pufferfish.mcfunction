execute store result score $pufferfish_puffstate lh.iris run data get entity @s PuffState
execute if score $pufferfish_puffstate lh.iris matches 0 run scoreboard players set $entity_width lh.iris 350000
execute if score $pufferfish_puffstate lh.iris matches 1 run scoreboard players set $entity_width lh.iris 490000
execute if score $pufferfish_puffstate lh.iris matches 2 run scoreboard players set $entity_width lh.iris 700000
scoreboard players operation $entity_height lh.iris = $entity_width lh.iris
