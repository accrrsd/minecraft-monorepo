execute store success score $loaded lh.iris if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked
execute if score $loaded lh.iris matches 0 run return fail
execute if data storage lh.iris:settings Whitelist run data modify storage lh.iris:args id set from storage lh.iris:settings Whitelist
execute if data storage lh.iris:settings Whitelist store success score $is_whitelisted lh.iris run function lh.iris:raycast/macro_functions/block_id_test with storage lh.iris:args
execute if data storage lh.iris:settings Whitelist unless score $is_whitelisted lh.iris matches 1 run return fail
execute if data storage lh.iris:settings Blacklist run data modify storage lh.iris:args id set from storage lh.iris:settings Blacklist
execute if data storage lh.iris:settings Blacklist store success score $is_blacklisted lh.iris run function lh.iris:raycast/macro_functions/block_id_test with storage lh.iris:args
execute if data storage lh.iris:settings Blacklist if score $is_blacklisted lh.iris matches 1 run return fail
function lh.iris:get_hitbox/block
execute unless data storage lh.iris:data Shape[0] run return fail
return run function lh.iris:raycast/check_intersection/loop
