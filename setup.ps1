$ErrorActionPreference = "Stop"

$KernelName = "python-notebook-env"
$KernelDisplayName = "Python (python-notebook-env)"

Write-Host "==> Checking uv..."
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "uv is not installed."
    Write-Host "Install it from: https://docs.astral.sh/uv/getting-started/installation/"
    exit 1
}

Write-Host "==> Creating/syncing virtual environment from requirements.txt..."
uv venv --python 3.12
uv pip install --python .venv\Scripts\python.exe -r requirements.txt

Write-Host "==> Registering Jupyter kernel..."
.venv\Scripts\python.exe -m ipykernel install `
    --user `
    --name $KernelName `
    --display-name $KernelDisplayName

Write-Host ""
Write-Host "Setup complete."
Write-Host "Start JupyterLab with:"
Write-Host "  .venv\Scripts\jupyter.exe lab"
Write-Host ""
Write-Host "Then select kernel:"
Write-Host "  $KernelDisplayName"
