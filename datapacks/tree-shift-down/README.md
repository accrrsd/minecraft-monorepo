# Tree Shift-Down (Minecraft 26+)

A lightweight and reliable Minecraft datapack that implements a natural **shift-down** tree harvesting mechanic. When you chop a log, the highest connected log shifts down into its place, allowing you to harvest the entire tree without towering up.

---

## Features

- **Shift-Down Logging:** Logs travel down branch-by-branch as you chop.
- **Building Protection:** Shift is required by default (`Sneak` mode). Chopping while standing breaks only a single block normally.
- **Customizable Modes:** Supports Sneak-only or Always-active logging per player.
- **Multi-Language Support:** English, Russian, Spanish, Chinese, German, and French.
- **Wide Compatibility:** Works with all vanilla axes and trees registered under `#minecraft:logs` (including Poplar and Nether fungi).

---

## Configuration (`config.mcfunction`)

Server defaults can be configured in `data/tree_shift_down/function/config.mcfunction`:

| Parameter | Values | Default | Description |
| :--- | :--- | :--- | :--- |
| `#default_enabled` | `1` / `0` | `1` (On) | Datapack enabled state for new players |
| `#default_mode` | `1` / `0` | `1` (Sneak) | `1` = Sneak (Hold Shift), `0` = Always (Standing) |
| `#default_lang` | `1`–`6` | `1` (EN) | `1`: EN, `2`: RU, `3`: ES, `4`: ZH, `5`: DE, `6`: FR |

---

## In-Game Player Commands

Players can customize their own settings at any time without OP permissions:

- `/trigger tsd_toggle` — Toggle mechanic on or off.
- `/trigger tsd_mode` — Switch mode between **Sneak (Hold Shift)** and **Always (Standing)**.
- `/trigger tsd_lang set <1-6>` — Set language (`1`: English, `2`: Russian, `3`: Spanish, `4`: Chinese, `5`: German, `6`: French).

---

## Installation

Place `tree_shift_down_datapack.zip` into the `datapacks` folder of your Minecraft world or server and run `/reload`.
