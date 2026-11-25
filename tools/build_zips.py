#!/usr/bin/env python3
"""
Archive builder for Minecraft datapacks and resourcepacks in minecraft-monorepo.

Scans directories for:
    <path>/<name>_datapack/      -> <path>/<name>_datapack.zip
    <path>/<name>_resourcepack/  -> <path>/<name>_resourcepack.zip
    Or any folder containing pack.mcmeta directly

Usage:
    python3 tools/build_zips.py                # Build all packs across monorepo
    python3 tools/build_zips.py datapacks/CoreTools  # Build only specific project
    python3 tools/build_zips.py --clean        # Delete generated zip archives
    python3 tools/build_zips.py --dry-run      # Preview without creating zips
"""

import argparse
import os
import sys
import zipfile

IGNORED_DIRS = {".git", ".system_generated", "DEV", "dev", "REFS", "refs", "backups", "__pycache__", ".vscode", "my-configs", "cctweaked"}


def is_pack_dir(path):
    """Check if the given path is a valid datapack or resourcepack directory."""
    if not os.path.isdir(path):
        return False
    name = os.path.basename(path)
    # Check if named *_datapack or *_resourcepack with pack.mcmeta, or contains pack.mcmeta
    return os.path.isfile(os.path.join(path, "pack.mcmeta"))


def find_packs(base_dir, targets=None):
    """
    Find all pack directories to archive.
    Returns list of tuples: (pack_dir, zip_dest_path)
    """
    found = []

    if targets:
        for target in targets:
            abs_target = os.path.abspath(target)
            if not os.path.exists(abs_target):
                print(f"Warning: Target '{target}' not found.", file=sys.stderr)
                continue

            if is_pack_dir(abs_target):
                parent_dir = os.path.dirname(abs_target)
                zip_name = f"{os.path.basename(abs_target)}.zip"
                found.append((abs_target, os.path.join(parent_dir, zip_name)))
            elif os.path.isdir(abs_target):
                for root, dirs, _ in os.walk(abs_target):
                    dirs[:] = [d for d in dirs if d not in IGNORED_DIRS]
                    for d in sorted(dirs):
                        sub_path = os.path.join(root, d)
                        if is_pack_dir(sub_path):
                            zip_name = f"{d}.zip"
                            found.append((sub_path, os.path.join(root, zip_name)))
    else:
        for scan_folder in ["datapacks", "resourcepacks"]:
            scan_path = os.path.join(base_dir, scan_folder)
            if not os.path.exists(scan_path):
                continue
            for root, dirs, _ in os.walk(scan_path):
                dirs[:] = [d for d in dirs if d not in IGNORED_DIRS]
                for d in sorted(dirs):
                    sub_path = os.path.join(root, d)
                    if is_pack_dir(sub_path):
                        zip_name = f"{d}.zip"
                        dest_zip = os.path.join(root, zip_name)
                        found.append((sub_path, dest_zip))

    return found


def build_zip(pack_dir, dest_zip):
    """Create a zip archive from a pack directory."""
    if os.path.exists(dest_zip):
        os.remove(dest_zip)

    file_count = 0
    with zipfile.ZipFile(dest_zip, "w", zipfile.ZIP_DEFLATED) as z:
        for root, _, files in os.walk(pack_dir):
            for file in sorted(files):
                if file.startswith("."):
                    continue
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, pack_dir)
                z.write(full_path, rel_path)
                file_count += 1

    size_kb = os.path.getsize(dest_zip) / 1024
    return file_count, size_kb


def main():
    parser = argparse.ArgumentParser(
        description="Build zip archives for Minecraft datapacks and resourcepacks."
    )
    parser.add_argument(
        "targets",
        nargs="*",
        help="Optional specific pack/project directory names or paths to build (default: all)",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove generated .zip files instead of creating them",
    )
    parser.add_argument(
        "-n",
        "--dry-run",
        action="store_true",
        help="Show what would be built/cleaned without performing any disk changes",
    )
    args = parser.parse_args()

    repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    packs = find_packs(repo_root, targets=args.targets if args.targets else None)

    if not packs:
        print("No datapacks or resourcepacks found.")
        return 0

    if args.clean:
        print(f"Cleaning zip archives ({'dry run' if args.dry_run else 'active'}):")
        removed = 0
        for _, dest_zip in packs:
            rel_zip = os.path.relpath(dest_zip, repo_root)
            if os.path.exists(dest_zip):
                if not args.dry_run:
                    os.remove(dest_zip)
                print(f"  - Removed: {rel_zip}")
                removed += 1
            else:
                print(f"  - Not present: {rel_zip}")
        print(f"Done. Removed {removed} archive(s).")
        return 0

    print(f"Building zip archives ({'dry run' if args.dry_run else 'active'}):")
    for pack_dir, dest_zip in packs:
        rel_pack = os.path.relpath(pack_dir, repo_root)
        rel_zip = os.path.relpath(dest_zip, repo_root)

        if args.dry_run:
            print(f"  [DRY-RUN] {rel_pack} -> {rel_zip}")
        else:
            count, size_kb = build_zip(pack_dir, dest_zip)
            print(f"  ✓ {rel_zip:<60} ({count} files, {size_kb:.1f} KB)")

    print(f"Done. Successfully processed {len(packs)} pack(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
