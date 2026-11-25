execute unless entity @s run return fail
execute if score ${x} lh.iris matches ..0 run scoreboard players set ${x} lh.iris 0
execute if score ${y} lh.iris matches ..0 run scoreboard players set ${y} lh.iris 0
execute if score ${z} lh.iris matches ..0 run scoreboard players set ${z} lh.iris 0
execute if score ${x} lh.iris matches 1000000.. run scoreboard players set ${x} lh.iris 999999
execute if score ${y} lh.iris matches 1000000.. run scoreboard players set ${y} lh.iris 999999
execute if score ${z} lh.iris matches 1000000.. run scoreboard players set ${z} lh.iris 999999
execute store result storage lh.iris:args x int 1 run scoreboard players get $[x] lh.iris
execute store result storage lh.iris:args y int 1 run scoreboard players get $[y] lh.iris
execute store result storage lh.iris:args z int 1 run scoreboard players get $[z] lh.iris
execute store result storage lh.iris:args value int 1 run scoreboard players get ${x} lh.iris
function lh.iris:set_coordinates/pad_with_zeros with storage lh.iris:args
data modify storage lh.iris:args dx set string storage lh.iris:data String -6
execute store result storage lh.iris:args value int 1 run scoreboard players get ${y} lh.iris
function lh.iris:set_coordinates/pad_with_zeros with storage lh.iris:args
data modify storage lh.iris:args dy set string storage lh.iris:data String -6
execute store result storage lh.iris:args value int 1 run scoreboard players get ${z} lh.iris
function lh.iris:set_coordinates/pad_with_zeros with storage lh.iris:args
data modify storage lh.iris:args dz set string storage lh.iris:data String -6
function lh.iris:set_coordinates/teleport with storage lh.iris:args
