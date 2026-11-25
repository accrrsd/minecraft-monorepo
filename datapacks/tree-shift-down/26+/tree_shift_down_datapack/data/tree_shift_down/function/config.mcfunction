# ==============================================================================
# 🌲 Tree Shift-Down — Default Configuration
# ==============================================================================
# Executed on load and /reload. Configure default behavior for new players here.

# ------------------------------------------------------------------------------
# 1. Default mechanic state for new players:
#    1 = Enabled (tree shift-down active) [DEFAULT]
#    0 = Disabled (axes behave like vanilla)
# ------------------------------------------------------------------------------
scoreboard players set #default_enabled tsd.config 1

# ------------------------------------------------------------------------------
# 2. Default activation mode for new players:
#    1 = Sneak only (Hold Shift) [DEFAULT]
#        Tree shifts down ONLY while sneaking. Standing chops 1 block normally.
#    0 = Always (Standing / In full height)
#        Tree shifts down whenever chopped, holding Shift is not required.
# ------------------------------------------------------------------------------
scoreboard players set #default_mode tsd.config 1

# ------------------------------------------------------------------------------
# 3. Default language for new players:
#    1 = English [DEFAULT]
#    2 = Russian (Русский)
#    3 = Spanish (Español)
#    4 = Chinese Simplified (简体中文)
#    5 = German (Deutsch)
#    6 = French (Français)
# ------------------------------------------------------------------------------
scoreboard players set #default_lang tsd.config 1
