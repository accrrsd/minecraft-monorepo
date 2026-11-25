#!/usr/bin/env python3
"""
Renewable Oxidation & Concrete - Recipe & Advancement Generator
Generates all shaped and shapeless JSON recipes and unlock advancements
based on templates in the templates/ directory.
"""

import argparse
import json
import os
import shutil
import zipfile

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATES_DIR = os.path.join(SCRIPT_DIR, "templates")
PACK_DIR = os.path.join(SCRIPT_DIR, "renewable_oxydation_and_concrete_datapack")
DATA_DIR = os.path.join(PACK_DIR, "data", "renewable_oxidation_concrete")
RECIPES_DIR = os.path.join(DATA_DIR, "recipe")
ADVANCEMENTS_DIR = os.path.join(DATA_DIR, "advancement")
PACK_MCMETA_PATH = os.path.join(PACK_DIR, "pack.mcmeta")
ZIP_PATH = os.path.join(SCRIPT_DIR, "renewable_oxydation_and_concrete_datapack.zip")

FAMILIES = [
    (
        "copper",
        ["copper_block", "exposed_copper", "weathered_copper", "oxidized_copper"],
        ["waxed_copper_block", "waxed_exposed_copper", "waxed_weathered_copper", "waxed_oxidized_copper"],
        "building"
    ),
    (
        "cut_copper",
        ["cut_copper", "exposed_cut_copper", "weathered_cut_copper", "oxidized_cut_copper"],
        ["waxed_cut_copper", "waxed_exposed_cut_copper", "waxed_weathered_cut_copper", "waxed_oxidized_cut_copper"],
        "building"
    ),
    (
        "cut_copper_stairs",
        ["cut_copper_stairs", "exposed_cut_copper_stairs", "weathered_cut_copper_stairs", "oxidized_cut_copper_stairs"],
        ["waxed_cut_copper_stairs", "waxed_exposed_cut_copper_stairs", "waxed_weathered_cut_copper_stairs", "waxed_oxidized_cut_copper_stairs"],
        "building"
    ),
    (
        "cut_copper_slab",
        ["cut_copper_slab", "exposed_cut_copper_slab", "weathered_cut_copper_slab", "oxidized_cut_copper_slab"],
        ["waxed_cut_copper_slab", "waxed_exposed_cut_copper_slab", "waxed_weathered_cut_copper_slab", "waxed_oxidized_cut_copper_slab"],
        "building"
    ),
    (
        "chiseled_copper",
        ["chiseled_copper", "exposed_chiseled_copper", "weathered_chiseled_copper", "oxidized_chiseled_copper"],
        ["waxed_chiseled_copper", "waxed_exposed_chiseled_copper", "waxed_weathered_chiseled_copper", "waxed_oxidized_chiseled_copper"],
        "building"
    ),
    (
        "copper_door",
        ["copper_door", "exposed_copper_door", "weathered_copper_door", "oxidized_copper_door"],
        ["waxed_copper_door", "waxed_exposed_copper_door", "waxed_weathered_copper_door", "waxed_oxidized_copper_door"],
        "building"
    ),
    (
        "copper_trapdoor",
        ["copper_trapdoor", "exposed_copper_trapdoor", "weathered_copper_trapdoor", "oxidized_copper_trapdoor"],
        ["waxed_copper_trapdoor", "waxed_exposed_copper_trapdoor", "waxed_weathered_copper_trapdoor", "waxed_oxidized_copper_trapdoor"],
        "building"
    ),
    (
        "copper_grate",
        ["copper_grate", "exposed_copper_grate", "weathered_copper_grate", "oxidized_copper_grate"],
        ["waxed_copper_grate", "waxed_exposed_copper_grate", "waxed_weathered_copper_grate", "waxed_oxidized_copper_grate"],
        "building"
    ),
    (
        "copper_bulb",
        ["copper_bulb", "exposed_copper_bulb", "weathered_copper_bulb", "oxidized_copper_bulb"],
        ["waxed_copper_bulb", "waxed_exposed_copper_bulb", "waxed_weathered_copper_bulb", "waxed_oxidized_copper_bulb"],
        "redstone"
    )
]

COLORS = [
    "black", "blue", "brown", "cyan", "gray", "green", "light_blue", "light_gray",
    "lime", "magenta", "orange", "pink", "purple", "red", "white", "yellow"
]


def load_templates():
    with open(os.path.join(TEMPLATES_DIR, "shaped.json"), "r", encoding="utf-8") as f:
        shaped_tmpl = f.read()
    with open(os.path.join(TEMPLATES_DIR, "shapeless.json"), "r", encoding="utf-8") as f:
        shapeless_tmpl = f.read()
    with open(os.path.join(TEMPLATES_DIR, "advancement.json"), "r", encoding="utf-8") as f:
        advancement_tmpl = f.read()
    return shaped_tmpl, shapeless_tmpl, advancement_tmpl


def detect_recipe_key(override_version=None):
    if override_version:
        return "recipes" if override_version == "26.3" else "recipe"
    if os.path.exists(PACK_MCMETA_PATH):
        try:
            with open(PACK_MCMETA_PATH, "r", encoding="utf-8") as f:
                data = json.load(f)
            min_fmt = data.get("pack", {}).get("min_format")
            if isinstance(min_fmt, list):
                return "recipe"  # 26.2 format [121, 0]
            else:
                return "recipes"  # 26.3 format 121
        except Exception:
            pass
    return "recipes"


def write_json(path, data):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        f.write("\n")


def make_advancement(tmpl, recipe_name, trigger_items, recipe_key):
    content = tmpl.replace("{{recipe_name}}", recipe_name)
    content = content.replace("{{recipe_key}}", recipe_key)
    content = content.replace("{{trigger_items}}", json.dumps(trigger_items))
    return json.loads(content)


def make_shaped(tmpl, category, surrounding_item, center_item, result_item, count):
    content = tmpl.replace("{{category}}", category)
    content = content.replace("{{surrounding_item}}", surrounding_item)
    content = content.replace("{{center_item}}", center_item)
    content = content.replace("{{result_item}}", result_item)
    content = content.replace("{{count}}", str(count))
    return json.loads(content)


def make_shapeless(tmpl, category, base_item, catalyst_item, result_item, count):
    content = tmpl.replace("{{category}}", category)
    content = content.replace("{{base_item}}", base_item)
    content = content.replace("{{catalyst_item}}", catalyst_item)
    content = content.replace("{{result_item}}", result_item)
    content = content.replace("{{count}}", str(count))
    return json.loads(content)


def generate(version=None):
    recipe_key = detect_recipe_key(version)
    shaped_tmpl, shapeless_tmpl, adv_tmpl = load_templates()

    # Clear old recipes and advancements
    if os.path.exists(RECIPES_DIR):
        shutil.rmtree(RECIPES_DIR)
    if os.path.exists(ADVANCEMENTS_DIR):
        shutil.rmtree(ADVANCEMENTS_DIR)
    os.makedirs(RECIPES_DIR, exist_ok=True)
    os.makedirs(ADVANCEMENTS_DIR, exist_ok=True)

    recipe_count = 0

    def add_recipe(rec_name, rec_data, triggers):
        nonlocal recipe_count
        write_json(os.path.join(RECIPES_DIR, f"{rec_name}.json"), rec_data)
        adv_data = make_advancement(adv_tmpl, rec_name, triggers, recipe_key)
        write_json(os.path.join(ADVANCEMENTS_DIR, f"unlock_{rec_name}.json"), adv_data)
        recipe_count += 1

    # 1. Concrete Hydration
    # 1.1 Bulk (8:1)
    for color in COLORS:
        powder = f"minecraft:{color}_concrete_powder"
        concrete = f"minecraft:{color}_concrete"
        rec_data = make_shaped(shaped_tmpl, "building", powder, "minecraft:water_bucket", concrete, 8)
        add_recipe(f"{color}_concrete", rec_data, [powder, "minecraft:water_bucket", concrete])

    # 1.2 Single (1:1)
    for color in COLORS:
        powder = f"minecraft:{color}_concrete_powder"
        concrete = f"minecraft:{color}_concrete"
        rec_data = make_shapeless(shapeless_tmpl, "building", powder, "minecraft:water_bucket", concrete, 1)
        add_recipe(f"hydrate_single_{color}_concrete", rec_data, [powder, "minecraft:water_bucket", concrete])

    # 2. Copper Hydration
    for fam_name, stages, waxed_stages, cat in FAMILIES:
        for lower_idx, higher_idx in [(0, 1), (1, 2), (2, 3)]:
            from_item = f"minecraft:{stages[lower_idx]}"
            to_item = f"minecraft:{stages[higher_idx]}"

            # Bulk (8:1)
            rec_name = stages[higher_idx] if fam_name == "copper" else f"hydrate_{stages[higher_idx]}"
            bulk_data = make_shaped(shaped_tmpl, cat, from_item, "minecraft:water_bucket", to_item, 8)
            add_recipe(rec_name, bulk_data, [from_item, "minecraft:water_bucket", to_item])

            # Single (1:1)
            single_name = f"hydrate_single_{stages[higher_idx]}"
            single_data = make_shapeless(shapeless_tmpl, cat, from_item, "minecraft:water_bucket", to_item, 1)
            add_recipe(single_name, single_data, [from_item, "minecraft:water_bucket", to_item])

    # 3. Copper De-oxidation / Scraping
    for fam_name, stages, waxed_stages, cat in FAMILIES:
        for higher_idx, lower_idx in [(3, 2), (2, 1), (1, 0)]:
            from_item = f"minecraft:{stages[higher_idx]}"
            to_item = f"minecraft:{stages[lower_idx]}"

            # Single (1:1)
            single_name = f"scrape_{stages[higher_idx]}"
            single_data = make_shapeless(shapeless_tmpl, cat, from_item, "minecraft:iron_nugget", to_item, 1)
            add_recipe(single_name, single_data, [from_item, "minecraft:iron_nugget", to_item])

            # Bulk (8:1)
            bulk_name = f"scrape_bulk_{stages[higher_idx]}"
            bulk_data = make_shaped(shaped_tmpl, cat, from_item, "minecraft:iron_nugget", to_item, 8)
            add_recipe(bulk_name, bulk_data, [from_item, "minecraft:iron_nugget", to_item])

    # 4. Copper Wax Removal (Single 1:1 only)
    for fam_name, stages, waxed_stages, cat in FAMILIES:
        for idx in range(4):
            from_item = f"minecraft:{waxed_stages[idx]}"
            to_item = f"minecraft:{stages[idx]}"

            # Single (1:1)
            single_name = f"unwax_{waxed_stages[idx]}"
            single_data = make_shapeless(shapeless_tmpl, cat, from_item, "minecraft:iron_nugget", to_item, 1)
            add_recipe(single_name, single_data, [from_item, "minecraft:iron_nugget", to_item])

    # Rebuild zip
    with zipfile.ZipFile(ZIP_PATH, "w", zipfile.ZIP_DEFLATED) as z:
        for root, dirs, files in os.walk(PACK_DIR):
            for f in files:
                full_path = os.path.join(root, f)
                rel_path = os.path.relpath(full_path, PACK_DIR)
                z.write(full_path, rel_path)

    print(f"Generated {recipe_count} recipes and {recipe_count} advancements.")
    print(f"Advancement condition key: '{recipe_key}'")
    print(f"Rebuilt zip: {ZIP_PATH}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate Minecraft datapack recipes and advancements.")
    parser.add_argument("--version", choices=["26.2", "26.3"], default=None,
                        help="Target Minecraft version standard (defaults to auto-detecting from pack.mcmeta)")
    args = parser.parse_args()
    generate(args.version)
