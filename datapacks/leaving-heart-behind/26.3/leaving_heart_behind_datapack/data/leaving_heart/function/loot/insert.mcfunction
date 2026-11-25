# Choose a random slot from 0 to 26 and inject the loot table
execute store result storage leaving_heart:temp loot.slot int 1 run random value 0..26
function leaving_heart:loot/macro with storage leaving_heart:temp loot
