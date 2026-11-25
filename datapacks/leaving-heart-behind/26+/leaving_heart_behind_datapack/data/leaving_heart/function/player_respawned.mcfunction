# Called upon respawn (time_since_death >= 1)
tag @s remove lh_dead

# Ensure player scores are valid
function leaving_heart:player_check_init

# Apply calculated current health to player
function leaving_heart:apply_health
