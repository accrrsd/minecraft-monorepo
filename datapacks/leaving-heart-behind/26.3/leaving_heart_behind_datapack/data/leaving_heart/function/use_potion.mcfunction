# Reset advancement for repeated consumption
advancement revoke @s only leaving_heart:use_potion

# Safety initialization for player
function leaving_heart:player_check_init

# Calculate effective potion healing limit for @s
# If #potion_max_hp == 0: heal up to full base health (lh_base_hp)
# If #potion_max_hp > 0: heal up to configured threshold (#potion_max_hp, default: 10)
scoreboard players operation #potion_cap lh_temp = #potion_max_hp lh_values
execute if score #potion_cap lh_temp matches 0 run scoreboard players operation #potion_cap lh_temp = @s lh_base_hp

# Potion cap can never exceed player's lh_max_hp
execute if score #potion_cap lh_temp > @s lh_max_hp run scoreboard players operation #potion_cap lh_temp = @s lh_max_hp

# Potion restores health only if current_hp is strictly less than effective potion cap
# If current_hp >= #potion_cap, it is consumed with no effect
execute if score @s lh_current_hp < #potion_cap lh_temp run function leaving_heart:apply_potion_heal
