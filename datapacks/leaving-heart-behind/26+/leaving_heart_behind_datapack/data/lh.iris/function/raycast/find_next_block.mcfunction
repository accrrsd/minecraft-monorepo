scoreboard players operation $last_[x] lh.iris = $[x] lh.iris
scoreboard players operation $last_[y] lh.iris = $[y] lh.iris
scoreboard players operation $last_[z] lh.iris = $[z] lh.iris
execute if score $dx lh.iris matches 0.. run scoreboard players set $to_next_x lh.iris 1000000000
execute if score $dx lh.iris matches ..-1 run scoreboard players set $to_next_x lh.iris 0
scoreboard players operation ${x}*1000 lh.iris = ${x} lh.iris
scoreboard players operation ${x}*1000 lh.iris *= $1000 lh.iris
scoreboard players operation $to_next_x lh.iris -= ${x}*1000 lh.iris
scoreboard players operation $to_next_x lh.iris /= $dx lh.iris
execute if score $dy lh.iris matches 0.. run scoreboard players set $to_next_y lh.iris 1000000000
execute if score $dy lh.iris matches ..-1 run scoreboard players set $to_next_y lh.iris 0
scoreboard players operation ${y}*1000 lh.iris = ${y} lh.iris
scoreboard players operation ${y}*1000 lh.iris *= $1000 lh.iris
scoreboard players operation $to_next_y lh.iris -= ${y}*1000 lh.iris
scoreboard players operation $to_next_y lh.iris /= $dy lh.iris
execute if score $dz lh.iris matches 0.. run scoreboard players set $to_next_z lh.iris 1000000000
execute if score $dz lh.iris matches ..-1 run scoreboard players set $to_next_z lh.iris 0
scoreboard players operation ${z}*1000 lh.iris = ${z} lh.iris
scoreboard players operation ${z}*1000 lh.iris *= $1000 lh.iris
scoreboard players operation $to_next_z lh.iris -= ${z}*1000 lh.iris
scoreboard players operation $to_next_z lh.iris /= $dz lh.iris
execute if score $to_next_x lh.iris <= $to_next_y lh.iris if score $to_next_x lh.iris <= $to_next_z lh.iris run data merge storage lh.iris:data {NextCoordinateChange: "x"}
execute if score $to_next_y lh.iris <= $to_next_x lh.iris if score $to_next_y lh.iris <= $to_next_z lh.iris run data merge storage lh.iris:data {NextCoordinateChange: "y"}
execute if score $to_next_z lh.iris <= $to_next_x lh.iris if score $to_next_z lh.iris <= $to_next_y lh.iris run data merge storage lh.iris:data {NextCoordinateChange: "z"}
execute if data storage lh.iris:data {NextCoordinateChange: "x"} run data modify storage lh.iris:args {} merge value {a: "x", b: "y", c: "z"}
execute if data storage lh.iris:data {NextCoordinateChange: "y"} run data modify storage lh.iris:args {} merge value {a: "y", b: "z", c: "x"}
execute if data storage lh.iris:data {NextCoordinateChange: "z"} run data modify storage lh.iris:args {} merge value {a: "z", b: "x", c: "y"}
function lh.iris:raycast/macro_functions/find_next_block_aux with storage lh.iris:args
return run scoreboard players operation $to_next_block lh.iris *= $1000 lh.iris
