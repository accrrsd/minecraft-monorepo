data modify storage lh.iris:data Faces set value [{Direction: "WEST_EAST"}, {Direction: "UP_DOWN"}, {Direction: "NORTH_SOUTH"}]
data modify storage lh.iris:data Faces[0] merge from storage lh.iris:data Box
execute if score $dx lh.iris matches 0.. run data modify storage lh.iris:data Faces[0].max[0] set from storage lh.iris:data Box.min[0]
execute if score $dx lh.iris matches ..-1 run data modify storage lh.iris:data Faces[0].min[0] set from storage lh.iris:data Box.max[0]
data modify storage lh.iris:data Faces[1] merge from storage lh.iris:data Box
execute if score $dy lh.iris matches 0.. run data modify storage lh.iris:data Faces[1].max[1] set from storage lh.iris:data Box.min[1]
execute if score $dy lh.iris matches ..-1 run data modify storage lh.iris:data Faces[1].min[1] set from storage lh.iris:data Box.max[1]
data modify storage lh.iris:data Faces[2] merge from storage lh.iris:data Box
execute if score $dz lh.iris matches 0.. run data modify storage lh.iris:data Faces[2].max[2] set from storage lh.iris:data Box.min[2]
execute if score $dz lh.iris matches ..-1 run data modify storage lh.iris:data Faces[2].min[2] set from storage lh.iris:data Box.max[2]
data modify storage lh.iris:data Face set from storage lh.iris:data Faces[0]
execute store success score $hits_x_face lh.iris store result score $to_x_face lh.iris run function lh.iris:raycast/check_intersection/ray_plane
execute if score $hits_x_face lh.iris matches 0 run scoreboard players set $to_x_face lh.iris 2147483647
execute if score $hits_x_face lh.iris matches 1 run data modify storage lh.iris:data TargetPoint set from storage lh.iris:data Face.Collision
data modify storage lh.iris:data Face set from storage lh.iris:data Faces[1]
execute store success score $hits_y_face lh.iris store result score $to_y_face lh.iris run function lh.iris:raycast/check_intersection/ray_plane
execute if score $hits_y_face lh.iris matches 0 run scoreboard players set $to_y_face lh.iris 2147483647
execute if score $hits_y_face lh.iris matches 1 if score $to_y_face lh.iris < $to_x_face lh.iris run data modify storage lh.iris:data TargetPoint set from storage lh.iris:data Face.Collision
data modify storage lh.iris:data Face set from storage lh.iris:data Faces[2]
execute store success score $hits_z_face lh.iris store result score $to_z_face lh.iris run function lh.iris:raycast/check_intersection/ray_plane
execute if score $hits_z_face lh.iris matches 0 run scoreboard players set $to_z_face lh.iris 2147483647
execute if score $hits_z_face lh.iris matches 1 if score $to_z_face lh.iris < $to_x_face lh.iris if score $to_z_face lh.iris < $to_y_face lh.iris run data modify storage lh.iris:data TargetPoint set from storage lh.iris:data Face.Collision
execute if score $hits_x_face lh.iris matches 0 if score $hits_y_face lh.iris matches 0 if score $hits_z_face lh.iris matches 0 run return fail
scoreboard players operation $to_aabb lh.iris = $to_x_face lh.iris
scoreboard players operation $to_aabb lh.iris < $to_y_face lh.iris
scoreboard players operation $to_aabb lh.iris < $to_z_face lh.iris
return run scoreboard players get $to_aabb lh.iris
