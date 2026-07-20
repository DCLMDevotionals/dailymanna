@echo off
setlocal EnableDelayedExpansion

set SUCCESS=0
set FAILED=0

echo ============================================
echo      QPDF Linearize and Verify Tool
echo ============================================
echo.

for %%F in (*.pdf) do (
    echo --------------------------------------------
    echo Processing: %%F

    qpdf --linearize "%%F" "%%~nF.tmp.pdf"

    if errorlevel 1 (
        echo [FAILED] Linearization failed.
        if exist "%%~nF.tmp.pdf" del "%%~nF.tmp.pdf"
        set /a FAILED+=1
    ) else (
        move /Y "%%~nF.tmp.pdf" "%%F" >nul

        qpdf --check "%%F" >nul 2>&1

        if errorlevel 1 (
            echo [FAILED] Verification failed.
            set /a FAILED+=1
        ) else (
            echo [SUCCESS] %%F has been linearized and verified.
            set /a SUCCESS+=1
        )
    )

    echo.
)

echo ============================================
echo Finished!
echo.
echo Successful : %SUCCESS%
echo Failed     : %FAILED%
echo ============================================
echo.
echo Press any key to exit...
pause >nul