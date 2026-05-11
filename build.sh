#!/bin/bash
# DinghyGo Manuals — multi-language build script
# Run from repo root. Output goes to: public/
# Coolify serves the public/ directory.

set -e

MKDOCS_DIR="published/mkdocs"
OUTPUT_DIR="public"
TYPST_DIR="published/typst"

echo "=== DinghyGo Manuals build ==="

# Install MkDocs if not present (Coolify build container)
if ! command -v mkdocs &> /dev/null; then
  echo "Installing mkdocs-material..."
  pip install mkdocs-material --quiet
fi

# Clean output
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

cd "$MKDOCS_DIR"

# Build English site → public/en/
echo "Building EN site..."
mkdocs build -f mkdocs_EN.yml -d "../../$OUTPUT_DIR/en"

# Build German site → public/de/
echo "Building DE site..."
mkdocs build -f mkdocs_DE.yml -d "../../$OUTPUT_DIR/de"

# Build Dutch site → public/nl/
echo "Building NL site..."
mkdocs build -f mkdocs_NL.yml -d "../../$OUTPUT_DIR/nl"

# Build French site → public/fr/
echo "Building FR site..."
mkdocs build -f mkdocs_FR.yml -d "../../$OUTPUT_DIR/fr"

# Build Spanish site → public/es/
echo "Building ES site..."
mkdocs build -f mkdocs_ES.yml -d "../../$OUTPUT_DIR/es"

cd ../..

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
