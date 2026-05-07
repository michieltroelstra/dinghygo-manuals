#!/bin/bash
# DinghyGo Manuals — multi-language build script
# Run from repo root. Output goes to: public/
# Coolify serves the public/ directory.

set -e

MKDOCS_DIR="trial/mkdocs"
OUTPUT_DIR="public"

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

cd ../..

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
