@echo off
setlocal

set "OUT=output"

if not exist "%OUT%" mkdir "%OUT%"

for %%F in (*.webp) do (
    copy "%%F" "%OUT%\%%~nxF.png" >nul
)

echo Done!
echo Files saved in "%OUT%" folder.
pause