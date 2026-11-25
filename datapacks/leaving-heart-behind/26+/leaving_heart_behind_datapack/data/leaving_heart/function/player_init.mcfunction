# Initialize player on first join
# Capture initial base health (e.g. 20, or origins/modded health)
execute store result score @s lh_base_hp run attribute @s minecraft:max_health base get 1

# If reading returned 0 or negative, fallback to default base health (#default_base_hp = 20)
execute unless score @s lh_base_hp matches 1.. run scoreboard players operation @s lh_base_hp = #default_base_hp lh_values

# Initialize max health capacity to base health
scoreboard players operation @s lh_max_hp = @s lh_base_hp

# Initialize current health to base health
scoreboard players operation @s lh_current_hp = @s lh_base_hp

# Mark player as initialized
tag @s add lh_initialized

# Assign default language if unset (inherits from #server_lang)
execute unless score @s lh_lang matches 1..5 run scoreboard players operation @s lh_lang = #server_lang lh_values

# Enable player to use trigger /trigger lh_select_lang
scoreboard players enable @s lh_select_lang

# Apply initial health
function leaving_heart:apply_health
