# Leaving Heart Behind — Minecraft Datapack

A high-stakes survival datapack for **Minecraft Java Edition (1.21.2+ through 26.3+)** where players lose half their health upon death, brew restorative potions to recover, and discover rare Heart Shards across ancient structures to permanently expand their maximum health pool.

---

## 📖 Overview & Gameplay Mechanics

### 1. Death Penalty & Health Halving
- **Configurable Death Reduction:** Whenever a player dies, both their **current health** (`lh_current_hp`) and **maximum health capacity** (`lh_max_hp`) are reduced by the configured loss percentage (`#death_loss_percent`, default: **50%**):
  $$\text{HP}_{\text{new}} = \left\lfloor \frac{\text{HP}_{\text{old}} \times (100 - \text{loss\_pct}) + 99}{100} \right\rfloor$$
- **Minimum Health Floor:** Health will never drop below the configured minimum (default: **1 HP** / half a heart).
- **Base Health Protection:** A player's maximum health capacity (`lh_max_hp`) will never drop below their initial base health (`lh_base_hp`, default: **20 HP** / 10 hearts).
- **Shard Loss on Death:**
  - Any extra heart containers granted by Heart Shards that fall into the **lost percentage** are permanently lost on death.
  - Any extra heart containers that remain in the **surviving percentage** (above base health) remain active and can be restored using potions.

#### Examples of Death Reduction (Default: 50% loss):
| Starting Health / Max | Respawn Health | Max Recoverable via Potions | Explanation |
| :--- | :--- | :--- | :--- |
| **20 HP** (10 hearts) | **10 HP** (5 hearts) | **20 HP** (10 hearts) | 50% lost. Halved from 20 to 10; potions restore back to base 20. |
| **24 HP** (12 hearts) | **12 HP** (6 hearts) | **20 HP** (10 hearts) | 50% of 24 is 12. The 4 HP from shards was in the lost 50%. Max capacity resets to base 20 HP. |
| **60 HP** (30 hearts) | **30 HP** (15 hearts) | **30 HP** (15 hearts) | 50% of 60 is 30. Since $30 > 20$ (base HP), the surviving 10 HP worth of shards remain in effect! |
| **10 HP** (5 hearts) | **5 HP** (2.5 hearts) | **20 HP** (10 hearts) | Second death. 50% of 10 is 5. |
| **3 HP** (1.5 hearts) | **2 HP** (1 heart) | **20 HP** (10 hearts) | Ceiling division: 3 HP reduced by 50% = 2 HP. |
| **2 HP** (1 heart) | **1 HP** (0.5 heart) | **20 HP** (10 hearts) | 2 HP reduced by 50% = 1 HP. |
| **1 HP** (0.5 heart) | **1 HP** (0.5 heart) | **20 HP** (10 hearts) | Reached minimum floor; cannot drop any lower. |

---

## 🧪 Custom Items & Recipes

### 1. Health Restoration Potion
Restores lost health containers up to the configured potion recovery limit (`#potion_max_hp`, default: **10 HP** / 5 hearts).

- **Effect:** Restores **12 HP (6 full hearts)** per bottle (configurable via `#potion_heal_hp`).
- **Configurable Healing Limit (`#potion_max_hp`):**
  - **Default (`10` HP / 5 hearts):** Potions can only heal a player up to 5 hearts! To regain health above 10 HP (up to 10 hearts or more), players must explore and find Heart Shards.
  - **`0`:** Potions will restore health all the way to full base health (`lh_base_hp`, default: 20 HP).
  - **Any custom number (e.g., `14`):** Sets a specific HP ceiling for potion healing.
- **No Waste / No Spam:** If consumed when the player's health is already at or above the potion ceiling ($\ge \text{effective\_cap}$), the potion is consumed with no effect and produces no chat spam.
- **Admin Command:**
  ```mcfunction
  /function leaving_heart:give_potion
  ```

#### Crafting Recipe:
Crafted on a standard 3x3 Crafting Table:
```
[ Fermented Spider Eye ]  [  Honey Bottle  ]  [ Fermented Spider Eye ]
[    Amethyst Shard    ]  [  Golden Apple  ]  [    Amethyst Shard    ]
[    Redstone Dust     ]  [  Honey Bottle  ]  [    Redstone Dust     ]
```
- **Top Corners (Left & Right):** 2× Fermented Spider Eye (`minecraft:fermented_spider_eye`)
- **Top & Bottom Center:** 2× Honey Bottle (`minecraft:honey_bottle`)
- **Center:** 1× Golden Apple (`minecraft:golden_apple`)
- **Middle Sides (Left & Right):** 2× Amethyst Shard (`minecraft:amethyst_shard`)
- **Bottom Corners (Left & Right):** 2× Redstone Dust (`minecraft:redstone`)
- **Recipe Book:** Unlocks automatically in the vanilla recipe book when the player obtains any of its ingredients (Golden Apple, Honey Bottle, Fermented Spider Eye, Amethyst Shard, or Redstone Dust).
- **Advancement:** Unlocks the *Elixir of Life* (`leaving_heart:obtain_potion`) advancement under the Adventure tab.


---

### 2. Heart Shard
A rare mystical crystal item that permanently grants additional heart containers.

- **Edible Crystal:** Heart Shards are consumed as **food** rather than potions. They play the crunching food eating animation and sounds, and can be eaten at any time—even when your hunger bar is completely full (`can_always_eat: true`).
- **Crystalline Sound Effect:** Upon consumption, a rich crystalline chime resonates (`minecraft:block.amethyst_block.chime` & `minecraft:block.amethyst_cluster.place`) alongside sparkling heart and star particles!
- **Effect:** Permanently grants **+#shard_hp HP** (configurable, default: **+2 HP** / 1 full heart container) to both maximum health capacity (`lh_max_hp`) and current health (`lh_current_hp`).
- **Immediate Healing:** Instantly fills the newly unlocked heart container with health upon consumption.
- **Essential Progression:** With potions capped at 10 HP by default, Heart Shards are the essential progression tool to climb from 5 hearts back to 10 hearts and beyond!
- **Stackable:** Stacks up to 64 items per slot and leaves no empty bottles behind.
- **Server Cap:** Consumption is capped at the server maximum health limit (default: **60 HP** / 30 hearts).
- **Advancements:** Unlocks *Heart Shard* (`leaving_heart:obtain_shard`) under the Adventure tab upon obtaining, and the challenge *Heart of a Titan* (`leaving_heart:consume_shard`) upon expanding maximum health to 40 HP (10 additional hearts / 20 hearts total)!
- **Admin Command:**
  ```mcfunction
  /function leaving_heart:give_shard
  ```

---

## 🗺️ Chest Loot Locations & Spawn Rates

Heart Shards naturally generate inside loot chests across the world using **non-destructive loot injection** (the same modern technique used by *Hero's Journey* and *Jake's Build Tools*). Instead of overriding vanilla `data/minecraft/loot_table/chests/*.json` files, the datapack detects when a player opens and generates container loot via the `minecraft:player_generates_container_loot` advancement trigger and injects shards using fast vector raycasting directly into the chest container!

This provides **100% compatibility** with all other datapacks and structure mods (e.g., Terralith, Better Dungeons, Repurposed Structures) without any loot conflicts. All drop percentages are configurable in `config.mcfunction`.

| Tier | Structures & Chest Locations | Shard Quantity / Chance | Expected Yield per Structure |
| :--- | :--- | :--- | :--- |
| **Common Structures** | Dungeons (Monster Spawners)<br>Abandoned Mineshafts<br>Pillager Outposts<br>Desert Pyramids<br>Jungle Temples<br>Shipwrecks (Supply & Treasure)<br>Underwater Ruins<br>Nether Fortresses<br>Woodland Mansions<br>Igloos | **5% chance** per chest (`#loot_chance_common`)<br>Drops: **1 Shard** | Rare occasional find |
| **End Dimensions** | End City Treasure Chests | **7% chance** per chest (`#loot_chance_end_city`)<br>Drops: **1 Shard** | ~1 Shard per End City |
| **Good Structures** | Strongholds (Corridors, Crossings, Libraries)<br>Trial Chambers (Reward Vaults & Ominous Vaults) | **10% chance** per chest/vault (`#loot_chance_good`)<br>Drops: **1 Shard** | **~1 to 2 Shards** across the whole structure |
| **Super Structures** | Ancient Cities<br>Bastion Remnants (Treasure Rooms, Stables, Bridges) | **10% chance** per chest (`#loot_chance_super`)<br>Drops: **1 Shard** | **~2 to 4 Shards** across the whole Ancient City |

---

## ⚙️ Configuration & Server Settings

To ensure 100% predictable behavior, all configuration settings are managed **strictly via the configuration file** and automatically loaded when the world starts or whenever `/reload` is executed.

### Configuration File Location:
```text
leaving_heart_behind_datapack/data/leaving_heart/function/config.mcfunction
```

### Configurable Parameters:
Open [config.mcfunction](file:///workspace/leaving_heart_behind_datapack/data/leaving_heart/function/config.mcfunction) in any text editor to modify the values:

```mcfunction
# 1. Minimum health limit (default: 1 HP = 0.5 heart, cannot drop lower on death)
scoreboard players set #min_hp lh_values 1

# 2. Maximum health limit (default: 60 HP = 30 hearts, cap for heart shard expansions)
scoreboard players set #max_hp lh_values 60

# 3. Default base health for new players (default: 20 HP = 10 hearts)
scoreboard players set #default_base_hp lh_values 20

# 4. Default server language for new players (1=ru, 2=en, 3=es, 4=zh, 5=de; default: 1 = Russian)
scoreboard players set #server_lang lh_values 1

# 5. Health gained per Heart Shard (default: 2 HP = 1 full heart container)
scoreboard players set #shard_hp lh_values 2

# 6. Health restored per Health Restoration Potion (default: 12 HP = 6 hearts)
scoreboard players set #potion_heal_hp lh_values 12

# 7. Maximum health that Health Restoration Potions can restore
# 0 = restores up to full base health (default: 20 HP = 10 hearts)
# Any number = maximum HP threshold potion can heal up to (default: 10 HP = 5 hearts)
scoreboard players set #potion_max_hp lh_values 10

# 8. Health reduction percentage upon death (default: 50 = 50% health lost / *0.5)
# Value represents the percentage of health lost on death (e.g. 50 = 50%, 25 = 25%, 75 = 75%)
scoreboard players set #death_loss_percent lh_values 50

# 9. Show chat notifications toggle (1 = enabled [default], 0 = disabled / silent mode)
# When set to 0, gameplay notifications (death penalty, heart shard gain, limit reached) and load alerts are disabled.
scoreboard players set #show_chat_messages lh_values 1

# 10. Shard Chest Loot Drop Chances (percentage 0-100% per generated chest/vault)
scoreboard players set #loot_chance_common lh_values 5
scoreboard players set #loot_chance_end_city lh_values 7
scoreboard players set #loot_chance_good lh_values 10
scoreboard players set #loot_chance_super lh_values 10
```

### Applying Changes:
After editing `config.mcfunction`, simply run in-game or via server console:
```mcfunction
/reload
```

---

## 🧹 Admin Reset & Uninstallation

Before removing or disabling the datapack from your world or server, administrators can run a clean reset command to restore all players' health back to original base health and wipe all datapack-specific scoreboards and tags.

### Reset Command:
```mcfunction
/function leaving_heart:reset
```

### What the Reset Command Does:
1. **Restores Player Health:** Sets every online player's max health attribute back to their original base health (`lh_base_hp`, default: 20 HP / 10 hearts).
2. **Instant Full Heal:** Heals all restored heart containers immediately so players are at full health.
3. **Removes Custom Tags & Advancements:** Clears `lh_initialized`, `lh_dead`, and revokes custom item consumption advancements.
4. **Deletes Scoreboard Objectives:** Safely removes all 11 `lh_*` scoreboard objectives.
5. **Clean Tick Freeze:** Halts the tick loop cleanly, preventing any errors in console if the datapack files are deleted or disabled.

---

## 🌐 Localization & Language Menu

The datapack features multi-language localization for all system messages:
1. **Russian (Русский)** — Language ID: `1`
2. **English** — Language ID: `2`
3. **Spanish (Español)** — Language ID: `3`
4. **Chinese Simplified (简体中文)** — Language ID: `4`
5. **German (Deutsch)** — Language ID: `5`

### Changing Your Language:
Any player can open the interactive clickable chat menu:
```mcfunction
/function leaving_heart:lang/menu
```
Clicking on any language flag in chat instantly updates the player's preference.

Players can also set their preferred language directly via command trigger:
```mcfunction
/trigger lh_select_lang set 1   # Русский (Russian)
/trigger lh_select_lang set 2   # English
/trigger lh_select_lang set 3   # Español (Spanish)
/trigger lh_select_lang set 4   # 简体中文 (Chinese)
/trigger lh_select_lang set 5   # Deutsch (German)
```

## 🎨 Custom Textures & Resource Pack Setup

The project is split into two clean components:
- `leaving_heart_behind_datapack/`: Place directly into your world's `datapacks/` directory.
- `leaving_heart_behind_resourcepack/`: Place directly into your `.minecraft/resourcepacks/` directory and activate it in Minecraft's **Options ➔ Resource Packs** menu!

### 📂 Where to Place Your Custom Textures:
Put your 16×16 (or higher resolution) PNG images into:
```text
leaving_heart_behind_resourcepack/assets/leaving_heart/textures/item/
├── heart_shard.png      <-- Custom texture for Heart Shard
└── health_potion.png    <-- Custom texture for Health Restoration Potion
```

*(Pre-made 16×16 pixel art placeholder textures are already generated in these locations, ready to be replaced with your own artwork anytime!)*

### 🏗️ Resource Pack File Hierarchy:
Modern Minecraft (1.21.4+ / 26.2+) uses the `items/` definition system alongside `models/`:
```text
leaving_heart_behind_resourcepack/
├── pack.mcmeta
└── assets/
    └── leaving_heart/
        ├── items/
        │   ├── heart_shard.json       (Item model definition)
        │   └── health_potion.json     (Item model definition)
        ├── lang/
        │   ├── en_us.json             (English US)
        │   ├── ru_ru.json             (Русский)
        │   ├── uk_ua.json             (Українська)
        │   ├── de_de.json             (Deutsch)
        │   ├── fr_fr.json             (Français)
        │   ├── es_es.json             (Español)
        │   ├── es_mx.json             (Español México)
        │   ├── pt_br.json             (Português Brasil)
        │   ├── zh_cn.json             (简体中文)
        │   ├── ja_jp.json             (日本語)
        │   └── pl_pl.json             (Polski)
        ├── models/
        │   └── item/
        │       ├── heart_shard.json   (Parent: minecraft:item/generated)
        │       └── health_potion.json (Parent: minecraft:item/generated)
        └── textures/
            └── item/
                ├── heart_shard.png    (Heart Shard texture)
                └── health_potion.png  (Health Potion texture)
```

---

## 📦 Compatibility & Technical Details

- **Supported Minecraft Versions:** Java Edition **1.21.2** up to **26.3+**.
- **Attribute Identifier:** Uses standard `minecraft:max_health` attribute with macro execution (`/attribute @s minecraft:max_health base set $(val)`).
- **Modded Health Compatibility:** Fully compatible with mods modifying initial player base health (e.g., Origins, Terralith). The datapack dynamically captures the player's true base health on their initial spawn.
- **Pack Formats:**
  - Datapack: `pack_format: 107` (`min_format: [101, 0]`, `max_format: [121, 0]`, `id: "leaving-heart"`).
  - Resource Pack: `pack_format: 88` (`min_format: [84, 0]`, `max_format: [97, 1]`, `id: "leaving-heart-rp"`).
- **Non-Destructive Loot Injection:** Uses `minecraft:player_generates_container_loot` + Iris voxel raycasting + `/loot replace block` macro to insert shards into unopened chests dynamically, eliminating any vanilla loot table overrides and guaranteeing total compatibility with all third-party datapacks and mods.
- **Loot Table Format:** Fully compliant with 26.3 specifications using `"modifier"` arrays and `"type": "minecraft:set_components"` / `"type": "minecraft:set_count"`.
