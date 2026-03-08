#!/usr/bin/env python3
"""
Sync B_Advanced_Overview ASCII tree to physical directory structure.
Creates 0-byte .ipynb placeholder files for all entries.
Phase 2: Focus on newly added 3.4 entries from latest upgrade.
"""

import os
import re
from pathlib import Path

# Base directory
BASE_DIR = Path(r"e:\New folder\Codes\Learning\Python_Programming\Py_Core\B_Advanced")
TREE_FILE = BASE_DIR / "0.0" / "B_Advanced_Overview"

def parse_tree_file(tree_path):
    """Parse ASCII tree file and extract file paths to create."""
    if not tree_path.exists():
        print(f"Tree file not found: {tree_path}")
        return []

    with open(tree_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    files_to_create = []
    current_path = []

    for line in lines:
        # Strip the line to get meaningful content
        stripped = line.rstrip()
        if not stripped:
            continue

        # Count leading spaces to determine depth
        leading_spaces = len(line) - len(line.lstrip())
        depth = leading_spaces // 4

        # Adjust current_path to match depth
        current_path = current_path[:depth]

        # Check if line contains directory marker or file
        if '+---' in stripped or '\\---' in stripped or '|   +---' in stripped or '|   \\---' in stripped:
            # Extract directory name
            match = re.search(r'+---(.+?)(?:\s|$)|\\---(.+?)(?:\s|$)', stripped)
            if match:
                dir_name = match.group(1) or match.group(2)
                dir_name = dir_name.strip()
                current_path.append(dir_name)
        elif '.ipynb' in stripped:
            # Extract file name
            match = re.search(r'(\S+\.ipynb)', stripped)
            if match:
                file_name = match.group(1)
                full_path = BASE_DIR / "sections" / "/".join(current_path) / file_name
                files_to_create.append(full_path)

    return files_to_create

def create_placeholder_files(files):
    """Create 0-byte placeholder .ipynb files."""
    created_count = 0
    skipped_count = 0

    for file_path in files:
        try:
            # Create parent directories
            file_path.parent.mkdir(parents=True, exist_ok=True)

            # Create empty file if it doesn't exist
            if not file_path.exists():
                file_path.touch()
                created_count += 1
            else:
                skipped_count += 1

        except Exception as e:
            print(f"Error creating {file_path}: {e}")

    return created_count, skipped_count

if __name__ == "__main__":
    print(f"Parsing tree file: {TREE_FILE}")
    files = parse_tree_file(TREE_FILE)
    print(f"Found {len(files)} files to create/check")

    print("\nCreating placeholder files...")
    created, skipped = create_placeholder_files(files)
    print(f"Created: {created}, Skipped (already exist): {skipped}")
