data modify storage lh.iris:data EntityTag set from entity @s
execute if data storage lh.iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width lh.iris 250000
execute if data storage lh.iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height lh.iris 987500
execute unless data storage lh.iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width lh.iris 500000
execute unless data storage lh.iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height lh.iris 1975000
execute if data storage lh.iris:data EntityTag{Marker: 1b} store result score $entity_width lh.iris run scoreboard players set $entity_height lh.iris 0
