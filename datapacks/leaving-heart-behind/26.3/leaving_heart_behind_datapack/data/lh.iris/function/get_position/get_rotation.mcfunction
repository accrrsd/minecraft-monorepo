execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage lh.iris:data Pos set from entity @s Pos
execute store result score $dx lh.iris run data get storage lh.iris:data Pos[0]
execute store result score $dy lh.iris run data get storage lh.iris:data Pos[1]
execute store result score $dz lh.iris run data get storage lh.iris:data Pos[2]
