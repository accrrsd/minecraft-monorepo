# Renewable Oxidation & Concrete (Copper & Concrete Hydration)

A lightweight, vanilla-friendly Minecraft datapack that enhances copper mechanics and concrete crafting with simple, logical, and symmetrical quality-of-life recipes.

Hydration and scraping mechanics come in both **Bulk (8:1)** shaped versions for mass crafting and **Single (1:1)** shapeless versions for on-the-go convenience in your 2×2 inventory, while Wax Removal is **Single (1:1)**.

---

## ✨ Features

### 💧 1. Hydration Recipes (Water Bucket — Increase Oxidation)
Skip the tedious waiting or world-placement steps:
* **Bulk (8:1)**:
  * **Concrete Solidification**: **8 Concrete Powder** (any color) + **1 Water Bucket** (shaped) ➔ **8 Concrete**.
  * **Copper Oxidation**: **8 Copper blocks or items** + **1 Water Bucket** (shaped) ➔ **8 Copper items of the next oxidation stage**.
* **Single Item (1:1)**:
  * **1 Concrete Powder** + **1 Water Bucket** (shapeless) ➔ **1 Concrete**.
  * **1 Copper block or item** + **1 Water Bucket** (shapeless) ➔ **1 Copper item of the next oxidation stage**.
  * *(The empty bucket is always returned!)*

Oxidation stages follow the standard progression:
* *Unaffected* ➔ *Exposed* ➔ *Weathered* ➔ *Oxidized*
* Works on full blocks, cut variants, stairs, slabs, chiseled blocks, grates, bulbs, doors, and trapdoors!

---

### 🪓 2. De-oxidation / Scraping (Iron Nugget — Decrease Oxidation)
Scrape off oxidation right inside your crafting grid without having to place blocks and swing an axe:
* **Bulk (8:1)**:
  * **8 Copper items** + **1 Iron Nugget** in the center (shaped) ➔ **8 Copper items of the previous stage**.
* **Single Item (1:1)**:
  * **1 Copper item** + **1 Iron Nugget** (shapeless) ➔ **1 Copper item of the previous stage** (closer to clean copper).

Progression:
* *Oxidized* ➔ *Weathered*
* *Weathered* ➔ *Exposed*
* *Exposed* ➔ *Clean / Unaffected Copper*

---

### 🐝 3. Wax Removal (Iron Nugget — Strip Wax)
Need to un-wax a copper item without placing it down and scraping it with an axe?
* **Single Item (1:1)**:
  * **1 Waxed Copper item** + **1 Iron Nugget** (shapeless) ➔ **1 Unwaxed Copper item** (retains its current oxidation stage).

---

## 🧱 Supported Copper Items & Families

All hydration, scraping, and de-waxing mechanics fully support all **9 vanilla copper families**:
* **Blocks of Copper** (`copper_block`)
* **Cut Copper** (`cut_copper`), **Stairs** (`cut_copper_stairs`), and **Slabs** (`cut_copper_slab`)
* **Chiseled Copper** (`chiseled_copper`)
* **Copper Grates** (`copper_grate`)
* **Copper Bulbs** (`copper_bulb`)
* **Copper Doors** (`copper_door`) & **Trapdoors** (`copper_trapdoor`)

---

## 🛠️ Generator Script & Templates

The repository includes a Python generator script ([`generate_recipes.py`](generate_recipes.py)) and JSON templates in [`templates/`](templates/).
* Reads [`templates/shaped.json`](templates/shaped.json), [`templates/shapeless.json`](templates/shapeless.json), and [`templates/advancement.json`](templates/advancement.json).
* Automatically detects the Minecraft pack format from `pack.mcmeta` (`recipe` for 26.2 and earlier, `recipes` for 26.3+).
* Re-generates all 176 recipe files, 176 advancements, and automatically rebuilds the release `.zip` archive.

To regenerate recipes:
```bash
python3 generate_recipes.py
```

---

## 📖 Recipe Book Integration
Every single recipe comes with matching advancement criteria. Recipes unlock automatically in your Recipe Book as soon as you pick up any relevant ingredient!