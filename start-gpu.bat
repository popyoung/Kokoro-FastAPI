@echo off
setlocal

:: Get project root directory
:: 获取项目根目录
set "PROJECT_ROOT=%CD%"

:: Set environment variables
:: 设置环境变量
set "USE_GPU=true"
set "USE_ONNX=false"
set "PYTHONPATH=%PROJECT_ROOT%;%PROJECT_ROOT%\api"
set "MODEL_DIR=src\models"
set "VOICES_DIR=src\voices\v1_0"
set "WEB_PLAYER_PATH=%PROJECT_ROOT%\web"
set "DOWNLOAD_MODEL=true"
:: Install dependencies (assuming pip is in PATH)
:: 安装依赖（假设 pip 已在 PATH 中）
:: Note: espeak may still require manual installation,
:: 注意：espeak 可能仍需要手动安装
@REM echo Installing Python dependencies...
@REM pip install -e ".[gpu]" -i https://mirrors.aliyun.com/pypi/simple/
@REM IF %ERRORLEVEL% NEQ 0 (
@REM     echo Failed to install Python dependencies. Please ensure Python and pip are installed and in your PATH.
@REM     goto :eof
@REM )

:: Run FastAPI with GPU extras (assuming uvicorn is in PATH)
:: 运行 FastAPI（假设 uvicorn 已在 PATH 中）
echo Starting FastAPI application...
uvicorn api.src.main:app --host 0.0.0.0 --port 8000
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to start FastAPI application. Please ensure uvicorn is installed (e.g., pip install uvicorn).
    goto :eof
)

endlocal