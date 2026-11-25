# Ensure player scores are valid
function leaving_heart:player_check_init

# Calculate effective potion healing limit for @s
# If #potion_max_hp == 0: heal up to full base health (lh_base_hp)
# If #potion_max_hp > 0: heal up to configured threshold (#potion_max_hp, default: 10)
scoreboard players operation #potion_cap lh_temp = #potion_max_hp lh_values
execute if score #potion_cap lh_temp matches 0 run scoreboard players operation #potion_cap lh_temp = @s lh_base_hp
execute if score #potion_cap lh_temp > @s lh_max_hp run scoreboard players operation #potion_cap lh_temp = @s lh_max_hp

# Restore 8 HP (4 hearts)
scoreboard players add @s lh_current_hp 8

# Cap current HP at effective potion limit
execute if score @s lh_current_hp > #potion_cap lh_temp run scoreboard players operation @s lh_current_hp = #potion_cap lh_temp

# Apply health to player entity
function leaving_heart:apply_health

# Instantly heal player to fill restored hearts
effect give @s instant_health 1 0 true

# Visual and audio effects
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.2
particle minecraft:heart ~ ~1 ~ 0.5 0.5 0.5 0.1 15
