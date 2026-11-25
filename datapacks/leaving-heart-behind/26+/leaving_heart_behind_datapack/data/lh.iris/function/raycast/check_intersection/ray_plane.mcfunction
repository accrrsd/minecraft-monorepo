execute store result score $x0 lh.iris run data get storage lh.iris:data Face.min[0] 1000000
execute store result score $y0 lh.iris run data get storage lh.iris:data Face.min[1] 1000000
execute store result score $z0 lh.iris run data get storage lh.iris:data Face.min[2] 1000000
execute store result score $x1 lh.iris run data get storage lh.iris:data Face.max[0] 1000000
execute store result score $y1 lh.iris run data get storage lh.iris:data Face.max[1] 1000000
execute store result score $z1 lh.iris run data get storage lh.iris:data Face.max[2] 1000000
execute if data storage lh.iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance lh.iris = $x0 lh.iris
execute if data storage lh.iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance lh.iris -= ${x} lh.iris
execute if data storage lh.iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance lh.iris = $y0 lh.iris
execute if data storage lh.iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance lh.iris -= ${y} lh.iris
execute if data storage lh.iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance lh.iris = $z0 lh.iris
execute if data storage lh.iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance lh.iris -= ${z} lh.iris
scoreboard players operation $distance lh.iris *= $1000 lh.iris
execute if data storage lh.iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance lh.iris /= $dx lh.iris
execute if data storage lh.iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance lh.iris /= $dy lh.iris
execute if data storage lh.iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance lh.iris /= $dz lh.iris
execute if score $distance lh.iris matches ..-1 run return fail
execute if score $distance lh.iris matches 2000.. run return fail
scoreboard players operation $x_intersection lh.iris = $distance lh.iris
scoreboard players operation $x_intersection lh.iris *= $dx lh.iris
scoreboard players operation $x_intersection lh.iris /= $1000 lh.iris
scoreboard players operation $x_intersection lh.iris += ${x} lh.iris
execute if data storage lh.iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $x_intersection lh.iris = $x0 lh.iris
scoreboard players operation $y_intersection lh.iris = $distance lh.iris
scoreboard players operation $y_intersection lh.iris *= $dy lh.iris
scoreboard players operation $y_intersection lh.iris /= $1000 lh.iris
scoreboard players operation $y_intersection lh.iris += ${y} lh.iris
execute if data storage lh.iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $y_intersection lh.iris = $y0 lh.iris
scoreboard players operation $z_intersection lh.iris = $distance lh.iris
scoreboard players operation $z_intersection lh.iris *= $dz lh.iris
scoreboard players operation $z_intersection lh.iris /= $1000 lh.iris
scoreboard players operation $z_intersection lh.iris += ${z} lh.iris
execute if data storage lh.iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $z_intersection lh.iris = $z0 lh.iris
data modify storage lh.iris:data Face.Collision set value [0.0d, 0.0d, 0.0d]
execute store result storage lh.iris:data Face.Collision[0] double 0.000001 run scoreboard players get $x_intersection lh.iris
execute store result storage lh.iris:data Face.Collision[1] double 0.000001 run scoreboard players get $y_intersection lh.iris
execute store result storage lh.iris:data Face.Collision[2] double 0.000001 run scoreboard players get $z_intersection lh.iris
execute if score $x_intersection lh.iris >= $x0 lh.iris if score $x_intersection lh.iris <= $x1 lh.iris if score $y_intersection lh.iris >= $y0 lh.iris if score $y_intersection lh.iris <= $y1 lh.iris if score $z_intersection lh.iris >= $z0 lh.iris if score $z_intersection lh.iris <= $z1 lh.iris run return run scoreboard players get $distance lh.iris
return fail
