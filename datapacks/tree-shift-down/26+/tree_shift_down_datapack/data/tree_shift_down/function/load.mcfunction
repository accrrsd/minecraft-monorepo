# Track axe usage across vanilla tiers
scoreboard objectives add tsd.axe_wood minecraft.used:minecraft.wooden_axe
scoreboard objectives add tsd.axe_stone minecraft.used:minecraft.stone_axe
scoreboard objectives add tsd.axe_iron minecraft.used:minecraft.iron_axe
scoreboard objectives add tsd.axe_gold minecraft.used:minecraft.golden_axe
scoreboard objectives add tsd.axe_diamond minecraft.used:minecraft.diamond_axe
scoreboard objectives add tsd.axe_netherite minecraft.used:minecraft.netherite_axe

# Sneak tracking
scoreboard objectives add tsd.sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add tsd.sneak_prev dummy

# Internal state, config and player preferences
scoreboard objectives add tsd.climb dummy
scoreboard objectives add tsd.config dummy
scoreboard objectives add tsd.pref dummy
scoreboard objectives add tsd.mode dummy
scoreboard objectives add tsd.lang dummy

# Player triggers
scoreboard objectives add tsd_toggle trigger
scoreboard objectives add tsd_mode trigger
scoreboard objectives add tsd_lang trigger

# Load default config
function tree_shift_down:config
