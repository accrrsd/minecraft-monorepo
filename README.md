# Minecraft Monorepo

Единый монорепозиторий для всех проектов Minecraft: датапаки, ресурспаки, скрипты для CC:Tweaked и конфигурации.

---

## Структура проекта

```text
minecraft-monorepo/
├── cctweaked/                       # Скрипты и программы для мода CC:Tweaked (Lua)
│   ├── shared/                      # Общие библиотеки (middleclass.lua и др.)
│   ├── perseus/                     # Автоматизация и управление механизмами (Perseus)
│   ├── x-vision/                    # Проекция и сканирование блоков (X-Vision)
│   ├── particles/                   # Отрисовка частиц
│   └── ship-mech/                   # Управление подвижными мехами и шагателями
│
├── datapacks/                       # Датапаки Minecraft (сгруппированы по проекту и версиям)
│   ├── CoreTools/                   # Молот 3x3, быстрая рубка деревьев, обтёска
│   │   ├── 1.21.1/
│   │   ├── 1.21.5/
│   │   ├── 26+/
│   │   ├── 26.3/
│   │   └── README.md
│   ├── dd_discs/                    # Кастомные музыкальные пластинки
│   ├── ghast-like-speed/            # Скорость для гастов
│   ├── invisible-item-frame/        # Невидимые рамки
│   ├── leaving-heart-behind/        # Осколки сердец и система жизней
│   ├── renewable-calcite-tuff-deepslate/ # Возобновляемые кальцит, туф, сланец
│   ├── renewable-oxydation-and-concrete/ # Возобновляемое окисление меди и бетон
│   ├── renewable-sand-gravel/       # Возобновляемый песок и гравий
│   ├── silk-touch-II/               # Шёлковое касание II (спавнеры, аметисты)
│   └── tree-shift-down/             # Сдвиг дерева вниз при рубке
│
├── resourcepacks/                   # Автономные ресурспаки (не привязанные к датапакам)
│   ├── outline-be-gone/             # Отключение контуров блоков
│   └── subaru-totem/                # Кастомный тотем бессмертия (Subaru)
│
├── my-configs/                      # Пользовательские конфигурации
│   └── datapacks/
│       └── versions/
│           └── veinminer/           # Конфигурации для Veinminer под разные версии
│
└── tools/                           # Вспомогательные скрипты сборки и автоматизации
    └── build_zips.py                # Сборщик zip-архивов для датапаков и ресурспаков
```

---

## Форматы версий Minecraft

| Версия Minecraft | Формат датапака (`pack_format`) | Формат ресурспака (`pack_format`) |
| :--- | :---: | :---: |
| **1.21 - 1.21.1** | `48` | `46` |
| **1.21.5** | `71` | `46` |
| **26+** | `121` | `97` |
| **26.3** | `121` | `97` |

---

## Сборка архивов (`tools/build_zips.py`)

Для сборки готовых к установке `.zip` файлов для всех датапаков и ресурспаков:

```bash
# Собрать все zip-архивы
python3 tools/build_zips.py

# Собрать конкретный датапак
python3 tools/build_zips.py datapacks/CoreTools

# Предпросмотр (dry-run)
python3 tools/build_zips.py --dry-run

# Очистить все созданные zip-архивы
python3 tools/build_zips.py --clean
```
