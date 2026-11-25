# Called when player dies
scoreboard players set @s lh_deaths 0

# Ensure player scores and constants are valid
function leaving_heart:player_check_init

# Tag player so that health reduction is applied upon respawn
tag @s add lh_dead

# Calculate remaining percentage: 100 - #death_loss_percent
scoreboard players operation #remaining_pct lh_temp = #c100 lh_values
scoreboard players operation #remaining_pct lh_temp -= #death_loss_percent lh_values
execute if score #remaining_pct lh_temp matches ..-1 run scoreboard players set #remaining_pct lh_temp 0
execute if score #remaining_pct lh_temp matches 101.. run scoreboard players set #remaining_pct lh_temp 100

# Reduce current health with ceiling division: (lh_current_hp * remaining_pct + 99) / 100
# For default 50%: 20 -> 10, 10 -> 5, 5 -> 3, 3 -> 2, 2 -> 1, 1 -> 1
scoreboard players operation #calc lh_temp = @s lh_current_hp
scoreboard players operation #calc lh_temp *= #remaining_pct lh_temp
scoreboard players add #calc lh_temp 99
scoreboard players operation #calc lh_temp /= #c100 lh_values
scoreboard players operation @s lh_current_hp = #calc lh_temp

# Clamp current HP to not drop below #min_hp (default: 1 HP)
execute if score @s lh_current_hp < #min_hp lh_values run scoreboard players operation @s lh_current_hp = #min_hp lh_values

# Reduce maximum health capacity with ceiling division: (lh_max_hp * remaining_pct + 99) / 100
# Shards in the lost percentage are permanently lost on death
# Shards in the surviving percentage remain in effect
scoreboard players operation #calc lh_temp = @s lh_max_hp
scoreboard players operation #calc lh_temp *= #remaining_pct lh_temp
scoreboard players add #calc lh_temp 99
scoreboard players operation #calc lh_temp /= #c100 lh_values
scoreboard players operation @s lh_max_hp = #calc lh_temp

# Max health capacity cannot drop below base health (lh_base_hp, default: 20 HP)
execute if score @s lh_max_hp < @s lh_base_hp run scoreboard players operation @s lh_max_hp = @s lh_base_hp

# Ensure current HP does not exceed max HP
execute if score @s lh_current_hp > @s lh_max_hp run scoreboard players operation @s lh_current_hp = @s lh_max_hp

# Try applying immediately in case game allows it
function leaving_heart:apply_health

# Send localized death message to player
function leaving_heart:lang/msg_died
