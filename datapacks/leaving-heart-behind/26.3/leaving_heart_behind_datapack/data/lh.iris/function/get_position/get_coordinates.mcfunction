tag @s add lh.iris.coordinate_getter
data modify storage lh.iris:data Pos set from entity @s Pos
execute store result score $[x] lh.iris store result storage lh.iris:args x int -1 run data get storage lh.iris:data Pos[0]
execute store result score $[y] lh.iris store result storage lh.iris:args y int -1 run data get storage lh.iris:data Pos[1]
execute store result score $[z] lh.iris store result storage lh.iris:args z int -1 run data get storage lh.iris:data Pos[2]
function lh.iris:get_position/teleport with storage lh.iris:args
data modify storage lh.iris:data Pos set from entity @s Pos
execute store result score ${x} lh.iris run data get storage lh.iris:data Pos[0] 1000000
execute store result score ${y} lh.iris run data get storage lh.iris:data Pos[1] 1000000
execute store result score ${z} lh.iris run data get storage lh.iris:data Pos[2] 1000000
data remove storage lh.iris:data Pos
