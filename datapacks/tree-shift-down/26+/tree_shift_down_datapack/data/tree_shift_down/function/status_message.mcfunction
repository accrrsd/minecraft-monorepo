# ==============================================================================
# Sends current status & mode to the player in their selected language
# 1 = English, 2 = Russian, 3 = Spanish, 4 = Chinese, 5 = German, 6 = French
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. State: ENABLED (tsd.pref = 1) & Mode: SNEAK (tsd.mode = 1)
# ------------------------------------------------------------------------------
# English
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 1 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Status: ","color":"gray"},{"text":"Enabled","color":"green"},{"text":" | Mode: ","color":"gray"},{"text":"Sneak (Hold Shift)","color":"gold"}]
# Russian
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 2 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Статус: ","color":"gray"},{"text":"Включен","color":"green"},{"text":" | Режим: ","color":"gray"},{"text":"При зажатом Shift","color":"gold"}]
# Spanish
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 3 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Estado: ","color":"gray"},{"text":"Activado","color":"green"},{"text":" | Modo: ","color":"gray"},{"text":"Agacharse (Shift)","color":"gold"}]
# Chinese
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 4 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"状态: ","color":"gray"},{"text":"已启用","color":"green"},{"text":" | 模式: ","color":"gray"},{"text":"潜行 (按住Shift)","color":"gold"}]
# German
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 5 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Status: ","color":"gray"},{"text":"Aktiviert","color":"green"},{"text":" | Modus: ","color":"gray"},{"text":"Schleichen (Shift)","color":"gold"}]
# French
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 1 if score @s tsd.lang matches 6 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Statut: ","color":"gray"},{"text":"Activé","color":"green"},{"text":" | Mode: ","color":"gray"},{"text":"Accroupi (Shift)","color":"gold"}]

# ------------------------------------------------------------------------------
# 2. State: ENABLED (tsd.pref = 1) & Mode: ALWAYS (tsd.mode = 0)
# ------------------------------------------------------------------------------
# English
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 1 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Status: ","color":"gray"},{"text":"Enabled","color":"green"},{"text":" | Mode: ","color":"gray"},{"text":"Always (Standing)","color":"aqua"}]
# Russian
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 2 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Статус: ","color":"gray"},{"text":"Включен","color":"green"},{"text":" | Режим: ","color":"gray"},{"text":"В полный рост (Всегда)","color":"aqua"}]
# Spanish
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 3 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Estado: ","color":"gray"},{"text":"Activado","color":"green"},{"text":" | Modo: ","color":"gray"},{"text":"Siempre (De pie)","color":"aqua"}]
# Chinese
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 4 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"状态: ","color":"gray"},{"text":"已启用","color":"green"},{"text":" | 模式: ","color":"gray"},{"text":"总是启用 (站立)","color":"aqua"}]
# German
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 5 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Status: ","color":"gray"},{"text":"Aktiviert","color":"green"},{"text":" | Modus: ","color":"gray"},{"text":"Immer (Stehend)","color":"aqua"}]
# French
execute if score @s tsd.pref matches 1 if score @s tsd.mode matches 0 if score @s tsd.lang matches 6 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"green"},{"text":"Statut: ","color":"gray"},{"text":"Activé","color":"green"},{"text":" | Mode: ","color":"gray"},{"text":"Toujours (Debout)","color":"aqua"}]

# ------------------------------------------------------------------------------
# 3. State: DISABLED (tsd.pref = 0)
# ------------------------------------------------------------------------------
# English
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 1 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"Status: ","color":"gray"},{"text":"Disabled","color":"red"},{"text":" | Mode: ","color":"gray"},{"text":"Vanilla","color":"dark_gray"}]
# Russian
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 2 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"Статус: ","color":"gray"},{"text":"Выключен","color":"red"},{"text":" | Режим: ","color":"gray"},{"text":"Ванильный","color":"dark_gray"}]
# Spanish
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 3 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"Estado: ","color":"gray"},{"text":"Desactivado","color":"red"},{"text":" | Modo: ","color":"gray"},{"text":"Vanilla","color":"dark_gray"}]
# Chinese
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 4 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"状态: ","color":"gray"},{"text":"已禁用","color":"red"},{"text":" | 模式: ","color":"gray"},{"text":"原版","color":"dark_gray"}]
# German
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 5 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"Status: ","color":"gray"},{"text":"Deaktiviert","color":"red"},{"text":" | Modus: ","color":"gray"},{"text":"Vanilla","color":"dark_gray"}]
# French
execute if score @s tsd.pref matches 0 if score @s tsd.lang matches 6 run tellraw @s [{"text":"[Tree Shift-Down] ","color":"gold"},{"text":"Statut: ","color":"gray"},{"text":"Désactivé","color":"red"},{"text":" | Mode: ","color":"gray"},{"text":"Vanilla","color":"dark_gray"}]
