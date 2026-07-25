@echo off
setlocal

REM =====================================
REM Add black borders to make images 4:5
REM Output: JPEG, Quality 90
REM =====================================

for %%F in (*.jpg *.jpeg *.png *.webp *.bmp *.tif *.tiff) do (
    echo Processing: %%F

    magick "%%F" ^
        -gravity center ^
        -background black ^
        -extent "%%[fx:w>h*4/5?w:h*4/5]x%%[fx:w>h*4/5?w*5/4:h]" ^
        -strip ^
        -quality 80 ^
        "%%~dpnF with border.jpg"
)

echo.
echo All done!
pause