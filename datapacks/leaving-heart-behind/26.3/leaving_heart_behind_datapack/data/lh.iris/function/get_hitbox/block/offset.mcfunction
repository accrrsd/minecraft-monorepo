scoreboard players operation $a lh.iris = $[x] lh.iris
scoreboard players operation $a lh.iris *= $3129871 lh.iris
scoreboard players operation $b lh.iris = $[z] lh.iris
scoreboard players operation $b lh.iris *= $116129781 lh.iris
execute store result score $a^b lh.iris run function lh.iris:get_hitbox/block/xor
scoreboard players operation $(a^b)² lh.iris = $a^b lh.iris
scoreboard players operation $(a^b)² lh.iris *= $a^b lh.iris
scoreboard players operation $11*(a^b) lh.iris = $a^b lh.iris
scoreboard players operation $11*(a^b) lh.iris *= $11 lh.iris
scoreboard players operation $seed lh.iris = $(a^b)² lh.iris
scoreboard players operation $seed lh.iris *= $42317861 lh.iris
scoreboard players operation $seed lh.iris += $11*(a^b) lh.iris
scoreboard players operation $seed lh.iris /= $65536 lh.iris
scoreboard players operation $x_offset lh.iris = $seed lh.iris
scoreboard players operation $x_offset lh.iris %= $16 lh.iris
scoreboard players operation $x_offset lh.iris *= $33333 lh.iris
scoreboard players operation $z_offset lh.iris = $seed lh.iris
scoreboard players operation $z_offset lh.iris /= $256 lh.iris
scoreboard players operation $z_offset lh.iris %= $16 lh.iris
scoreboard players operation $z_offset lh.iris *= $33333 lh.iris
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $x_offset lh.iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $z_offset lh.iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset lh.iris matches ..0 run scoreboard players set $x_offset lh.iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset lh.iris matches 250000.. run scoreboard players set $x_offset lh.iris 250000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset lh.iris matches ..0 run scoreboard players set $z_offset lh.iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset lh.iris matches 250000.. run scoreboard players set $z_offset lh.iris 250000
execute store result score $min_x lh.iris run data get storage lh.iris:data Shape[0].min[0] 1000000
execute store result storage lh.iris:data Shape[0].min[0] double 0.000001 run scoreboard players operation $min_x lh.iris += $x_offset lh.iris
execute store result score $min_z lh.iris run data get storage lh.iris:data Shape[0].min[2] 1000000
execute store result storage lh.iris:data Shape[0].min[2] double 0.000001 run scoreboard players operation $min_z lh.iris += $z_offset lh.iris
execute store result score $max_x lh.iris run data get storage lh.iris:data Shape[0].max[0] 1000000
execute store result storage lh.iris:data Shape[0].max[0] double 0.000001 run scoreboard players operation $max_x lh.iris += $x_offset lh.iris
execute store result score $max_z lh.iris run data get storage lh.iris:data Shape[0].max[2] 1000000
execute store result storage lh.iris:data Shape[0].max[2] double 0.000001 run scoreboard players operation $max_z lh.iris += $z_offset lh.iris
