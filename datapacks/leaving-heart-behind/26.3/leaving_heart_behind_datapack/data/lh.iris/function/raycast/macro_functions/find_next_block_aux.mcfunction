$scoreboard players operation $to_next_block lh.iris = $to_next_$(a) lh.iris
$execute if score $d$(a) lh.iris matches 0.. run scoreboard players add $[$(a)] lh.iris 1
$execute if score $d$(a) lh.iris matches 0.. run scoreboard players set ${$(a)} lh.iris 0
$execute if score $d$(a) lh.iris matches ..-1 run scoreboard players remove $[$(a)] lh.iris 1
$execute if score $d$(a) lh.iris matches ..-1 run scoreboard players set ${$(a)} lh.iris 1000000
scoreboard players operation $delta lh.iris = $to_next_block lh.iris
$scoreboard players operation $delta lh.iris *= $d$(b) lh.iris
scoreboard players operation $delta lh.iris /= $1000 lh.iris
$scoreboard players operation ${$(b)} lh.iris += $delta lh.iris
scoreboard players operation $delta lh.iris = $to_next_block lh.iris
$scoreboard players operation $delta lh.iris *= $d$(c) lh.iris
scoreboard players operation $delta lh.iris /= $1000 lh.iris
$scoreboard players operation ${$(c)} lh.iris += $delta lh.iris
