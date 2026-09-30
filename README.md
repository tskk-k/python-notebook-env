# Python Notebook Environment

Dockerを使わず、各メンバーに同じPython/Jupyter環境を配布するためのテンプレートです。

## 含まれる主なライブラリ

- NumPy
- pandas
- matplotlib
- seaborn
- SciPy
- scikit-learn
- joblib
- openpyxl
- JupyterLab
- ipykernel

依存関係は `requirements.txt` に固定しています。

## 前提

- Git
- `uv`
- Python 3.12系

## セットアップ

### macOS / Linux

```bash
chmod +x setup.sh
./setup.sh
```

### Windows PowerShell

```powershell
Set-ExecutionPolicy -Scope Process Bypass
./setup.ps1
```

## JupyterLabの起動

### macOS / Linux

```bash
.venv/bin/jupyter lab
```

### Windows

```powershell
.venv\Scripts\jupyter.exe lab
```

Notebookでは次のkernelを選択してください。

```text
Python (python-notebook-env)
```

## requirements.txt を使って手動で環境構築する場合

### uv

```bash
uv venv --python 3.12
uv pip install -r requirements.txt
```

### pip

```bash
python -m venv .venv
```

macOS / Linux:

```bash
source .venv/bin/activate
pip install -r requirements.txt
```

Windows:

```powershell
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## ライブラリ追加

`requirements.txt` に追加して再実行してください。

例:

```text
xgboost==3.0.5
```

その後:

```bash
uv pip install -r requirements.txt
```

## 注意

Dockerを使わないため、OS自体は固定されません。
GPU、CUDA、OS固有ライブラリ、外部コマンドを使う場合は追加の環境管理が必要です。
