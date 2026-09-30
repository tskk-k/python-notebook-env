#!/usr/bin/env bash
set -euo pipefail

KERNEL_NAME="python-notebook-env"
KERNEL_DISPLAY_NAME="Python (python-notebook-env)"

echo "==> Checking uv..."
if ! command -v uv >/dev/null 2>&1; then
  echo "uv is not installed."
  echo "Install it from: https://docs.astral.sh/uv/getting-started/installation/"
  exit 1
fi

echo "==> Creating/syncing virtual environment from requirements.txt..."
uv venv --python 3.12
uv pip install --python .venv/bin/python -r requirements.txt

echo "==> Registering Jupyter kernel..."
.venv/bin/python -m ipykernel install \
  --user \
  --name "$KERNEL_NAME" \
  --display-name "$KERNEL_DISPLAY_NAME"

echo
echo "Setup complete."
echo "Start JupyterLab with:"
echo "  .venv/bin/jupyter lab"
echo
echo "Then select kernel:"
echo "  $KERNEL_DISPLAY_NAME"
