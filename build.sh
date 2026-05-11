#!/bin/bash
# DinghyGo Manuals — multi-language build script
# Run from repo root. Output goes to: public/
# Coolify serves the public/ directory.
#
# MkDocs always uses a file named "index.md" as the site root page.
# To avoid all languages inheriting the English index.md, each build gets
# a temporary docs dir with the correct language files renamed to generic names.
# A temporary yml is created per language with docs_dir overridden to that dir.

set -e

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
MKDOCS_DIR="$REPO_ROOT/published/mkdocs"
DOCS_DIR="$MKDOCS_DIR/docs"
OUTPUT_DIR="$REPO_ROOT/public"
TYPST_DIR="$REPO_ROOT/published/typst"

echo "=== DinghyGo Manuals build ==="

# Install MkDocs if not present (Coolify build container)
if ! command -v mkdocs &> /dev/null; then
  echo "Installing mkdocs-material..."
  pip install mkdocs-material --quiet
fi

# Clean output
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# ─── Helper: build one language ───────────────────────────────────────────────
# Usage: build_lang <suffix> <yml_file> <output_subdir>
#   suffix     "" for EN, "_DE" for DE, "_NL" for NL, etc.
#   yml_file   yml filename (relative to MKDOCS_DIR)
#   out        output subdirectory name: "en", "de", "nl", "fr", "es"
build_lang() {
  local suffix="$1"
  local yml_file="$2"
  local out="$3"

  echo "Building $out site..."

  # 1. Create a temporary docs dir with language files as generic names
  local tmpdir
  tmpdir=$(mktemp -d /tmp/dinghygo_docs_XXXXXX)

  cp -r "$DOCS_DIR/images"       "$tmpdir/"
  cp -r "$DOCS_DIR/stylesheets"  "$tmpdir/"
  cp "$DOCS_DIR/DinghyGo_Orca_375_DoC_2026.pdf" "$tmpdir/" 2>/dev/null || true

  if [ -z "$suffix" ]; then
    cp "$DOCS_DIR/index.md"    "$tmpdir/index.md"
    cp "$DOCS_DIR/contents.md" "$tmpdir/contents.md"
    cp "$DOCS_DIR/manual.md"   "$tmpdir/manual.md"
  else
    cp "$DOCS_DIR/index${suffix}.md"    "$tmpdir/index.md"
    cp "$DOCS_DIR/contents${suffix}.md" "$tmpdir/contents.md"
    cp "$DOCS_DIR/manual${suffix}.md"   "$tmpdir/manual.md"
  fi

  # 2. Create a temporary yml that appends docs_dir to override the default
  local tmp_yml
  tmp_yml=$(mktemp /tmp/mkdocs_XXXXXX.yml)
  cat "$MKDOCS_DIR/$yml_file" > "$tmp_yml"
  echo "docs_dir: '$tmpdir'" >> "$tmp_yml"

  # 3. Build
  mkdocs build -f "$tmp_yml" -d "$OUTPUT_DIR/$out"

  # 4. Cleanup
  rm -rf "$tmpdir" "$tmp_yml"
}

build_lang ""    mkdocs_EN.yml en
build_lang "_DE" mkdocs_DE.yml de
build_lang "_NL" mkdocs_NL.yml nl
build_lang "_FR" mkdocs_FR.yml fr
build_lang "_ES" mkdocs_ES.yml es

# Copy PDF manuals → public/downloads/
echo "Copying PDF manuals..."
mkdir -p "$OUTPUT_DIR/downloads"
cp "$TYPST_DIR/manual.pdf"    "$OUTPUT_DIR/downloads/DinghyGo_Orca_Manual_EN.pdf"
cp "$TYPST_DIR/manual_DE.pdf" "$OUTPUT_DIR/downloads/DinghyGo_Orca_Manual_DE.pdf"
cp "$TYPST_DIR/manual_NL.pdf" "$OUTPUT_DIR/downloads/DinghyGo_Orca_Manual_NL.pdf"
cp "$TYPST_DIR/manual_FR.pdf" "$OUTPUT_DIR/downloads/DinghyGo_Orca_Manual_FR.pdf"
cp "$TYPST_DIR/manual_ES.pdf" "$OUTPUT_DIR/downloads/DinghyGo_Orca_Manual_ES.pdf"

# Root redirect → /en/ (default language)
cat > "$OUTPUT_DIR/index.html" << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="refresh" content="0; url=en/">
  <title>DinghyGo Manual</title>
</head>
<body>
  <p>Redirecting to <a href="en/">English manual</a>…</p>
</body>
</html>
EOF

echo "=== Build complete ==="
echo "Output in: $OUTPUT_DIR/"
ls -la "$OUTPUT_DIR/"
