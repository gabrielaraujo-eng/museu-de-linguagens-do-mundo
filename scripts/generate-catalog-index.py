#!/usr/bin/env python3
"""Generate the static file manifest used by the in-site language browser."""

from __future__ import annotations

import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LANGUAGES_DIR = ROOT / "linguagens"
OUTPUT_FILE = ROOT / "catalog-files.json"


def natural_order(filename: str) -> tuple[int, str]:
    match = re.search(r"_(\d+)", Path(filename).stem)
    return (int(match.group(1)) if match else 0, filename.casefold())


def main() -> None:
    catalog: dict[str, dict[str, object]] = {}

    for language_dir in sorted(LANGUAGES_DIR.iterdir(), key=lambda path: path.name.casefold()):
        if not language_dir.is_dir():
            continue

        files = [path.name for path in language_dir.iterdir() if path.is_file()]
        readme = next((name for name in files if name.casefold() == "readme.md"), None)
        examples = sorted(
            (name for name in files if name.casefold().startswith("exemplo_")),
            key=natural_order,
        )
        exercises = sorted(
            (name for name in files if name.casefold().startswith("exercicio_")),
            key=natural_order,
        )
        other = sorted(
            (name for name in files if name != readme and name not in examples and name not in exercises),
            key=str.casefold,
        )

        catalog[language_dir.name] = {
            "readme": readme,
            "examples": examples,
            "exercises": exercises,
            "other": other,
        }

    OUTPUT_FILE.write_text(
        json.dumps({"version": 1, "languages": catalog}, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    file_count = sum(
        (1 if entry["readme"] else 0)
        + len(entry["examples"])
        + len(entry["exercises"])
        + len(entry["other"])
        for entry in catalog.values()
    )
    print(f"Generated {OUTPUT_FILE.name}: {len(catalog)} languages, {file_count} files")


if __name__ == "__main__":
    main()
