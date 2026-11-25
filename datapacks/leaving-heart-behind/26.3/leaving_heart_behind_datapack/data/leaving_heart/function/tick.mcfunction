# Main tick loop for leaving_heart datapack

# Safety check: ensure datapack is active and initialized before running tick operations
execute unless score #c2 lh_values matches 2 run return 0

# Keep trigger lh_select_lang enabled for all players so they can click buttons anytime
scoreboard players enable @a lh_select_lang

# Handle players who died
execute as @a[scores={lh_deaths=1..}] at @s run function leaving_heart:player_died

# Handle players respawning after death
execute as @a[tag=lh_dead,scores={lh_time_since_death=1..}] at @s run function leaving_heart:player_respawned

# Handle player language selection trigger
execute as @a[scores={lh_select_lang=1..}] at @s run function leaving_heart:lang/select

# Initialize new players
execute as @a[tag=!lh_initialized] at @s run function leaving_heart:player_init

# Safety verification for any online player missing scores
execute as @a unless score @s lh_max_hp matches 1.. at @s run function leaving_heart:player_check_init
