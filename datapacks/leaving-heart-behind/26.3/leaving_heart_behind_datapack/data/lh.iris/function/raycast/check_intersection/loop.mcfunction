data modify storage lh.iris:data Box set from storage lh.iris:data Shape[-1]
data remove storage lh.iris:data Shape[-1]
execute store success score $is_hit lh.iris store result score $distance lh.iris run function lh.iris:raycast/check_intersection/ray_box
execute if score $is_hit lh.iris matches 1 if score $distance lh.iris >= $min_distance lh.iris run scoreboard players set $is_hit lh.iris 0
execute if score $is_hit lh.iris matches 1 run data modify storage lh.iris:data TargetedBox set from storage lh.iris:data Box
execute if score $is_hit lh.iris matches 1 if score $hits_x_face lh.iris matches 1 if score $to_aabb lh.iris = $to_x_face lh.iris run data modify storage lh.iris:data TargetedFace set from storage lh.iris:data Faces[0]
execute if score $is_hit lh.iris matches 1 if score $hits_y_face lh.iris matches 1 if score $to_aabb lh.iris = $to_y_face lh.iris run data modify storage lh.iris:data TargetedFace set from storage lh.iris:data Faces[1]
execute if score $is_hit lh.iris matches 1 if score $hits_z_face lh.iris matches 1 if score $to_aabb lh.iris = $to_z_face lh.iris run data modify storage lh.iris:data TargetedFace set from storage lh.iris:data Faces[2]
execute if score $is_hit lh.iris matches 1 run scoreboard players operation $min_distance lh.iris = $distance lh.iris
execute if data storage lh.iris:data Shape[-1] run return run function lh.iris:raycast/check_intersection/loop
execute if score $min_distance lh.iris matches 2147483647 run return fail
scoreboard players operation $min_distance lh.iris *= $1000 lh.iris
return run scoreboard players get $min_distance lh.iris
