# Ensure player scores are valid and initialized
function leaving_heart:player_check_init

# Increase player's maximum health capacity by configured shard gain (#shard_hp, default: 2)
scoreboard players operation @s lh_max_hp += #shard_hp lh_values

# Cap max HP at server #max_hp limit (default: 60 HP)
execute if score @s lh_max_hp > #max_hp lh_values run scoreboard players operation @s lh_max_hp = #max_hp lh_values

# Also increase player's current HP by configured shard gain (#shard_hp, default: 2)
scoreboard players operation @s lh_current_hp += #shard_hp lh_values

# Cap current HP at player's max HP limit
execute if score @s lh_current_hp > @s lh_max_hp run scoreboard players operation @s lh_current_hp = @s lh_max_hp

# Apply updated health to player entity via attribute macro
function leaving_heart:apply_health

# Instantly heal player to fill the newly granted heart container
effect give @s instant_health 1 0 true

# Audio-visual effects (crystalline chime and resonance)
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1.2 1.2
playsound minecraft:block.amethyst_cluster.place player @s ~ ~ ~ 1.0 1.0
playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 0.8 1.4
particle minecraft:heart ~ ~1.2 ~ 0.4 0.4 0.4 0.1 10
particle minecraft:end_rod ~ ~1 ~ 0.4 0.4 0.4 0.15 25
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.2 20

# Localized notification to player
function leaving_heart:lang/msg_shard

# Grant Heart of a Titan challenge advancement if player reaches 40 HP (10 extra hearts)
execute if score @s lh_max_hp matches 40.. run advancement grant @s only leaving_heart:consume_shard

