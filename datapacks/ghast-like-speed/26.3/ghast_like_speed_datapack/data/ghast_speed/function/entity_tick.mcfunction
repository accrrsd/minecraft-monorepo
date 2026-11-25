# Handle entity when speed effect is present
execute if predicate ghast_speed:has_speed run function ghast_speed:handle_speed

# Clean up attribute modifier when speed effect expires
execute unless predicate ghast_speed:has_speed if score @s ghast_speed matches 0.. run function ghast_speed:clear_speed
