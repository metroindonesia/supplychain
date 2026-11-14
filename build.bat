@echo off
setlocal enabledelayedexpansion

:: usage:
::           build.bat --module <namamodule>
::           build.bat --all

set "BUILD_ALL=false"
set "MODULE_NAME="

:: 1. Ambil argumen menggunakan flag
:parse_args
if "%~1"=="" goto :execute
if /i "%~1"=="--module" (
    if "%~2"=="" (
        echo Error: --module membutuhkan nama module
        exit /b 1
    )
    set "MODULE_NAME=%~2"
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--all" (
    set "BUILD_ALL=true"
    shift
    goto :parse_args
)
echo Argumen tidak dikenal: %~1
exit /b 1

:execute
:: 2. Logika Eksekusi
if "%BUILD_ALL%"=="true" (
    echo Memulai build untuk SEMUA module...
    :: Mencari semua file config rollup di dalam folder modules
    for /d %%D in ("public\modules\*") do (
        for %%F in ("%%D\__rollup.*.js") do (
            if exist "%%F" (
                echo Building: %%F
                call npx rollup -c "%%F"
            )
        )
    )
    goto :eof
)

if defined MODULE_NAME (
    :: 3. Definisikan path file config rollup untuk satu module
    set "CONFIG_PATH=public\modules\!MODULE_NAME!\__rollup.!MODULE_NAME!.js"

    :: 4. Cek apakah file config tersebut ada sebelum eksekusi
    if exist "!CONFIG_PATH!" (
        echo Memulai build untuk module: !MODULE_NAME!...
        call npx rollup -c "!CONFIG_PATH!"
    ) else (
        echo Error: File konfigurasi tidak ditemukan di !CONFIG_PATH!
        exit /b 1
    )
    goto :eof
)

:: Jika tidak ada argumen yang valid
echo Error: Gunakan --module ^<namamodule^> atau --all
echo Cara pakai: build.bat --module namamodule
echo             build.bat --all
exit /b 1
