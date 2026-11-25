# Reset advancement for repeated consumption
advancement revoke @s only leaving_heart:use_shard

# Ensure player scores are valid and initialized
function leaving_heart:player_check_init

# Check if player hasn't reached server #max_hp limit
execute if score @s lh_max_hp < #max_hp lh_values run function leaving_heart:apply_shard_increase
execute if score @s lh_max_hp >= #max_hp lh_values run function leaving_heart:lang/msg_max_reached
