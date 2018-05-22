setlocal enabledelayedexpansion


:: Get user input and set it to "tiffFile"
set /p tiffFile=Enter full tif file name:


::Get everything before "." and set to var fileName
for /f "tokens=1 delims=." %%i in ("%tiffFile%") do (set fileName=%%i)


mkdir %fileName%

::move original file into new directory
move %tiffFile% %fileName%

cd %fileName%

::Run the tool
magick convert %tiffFile% %fileName%_page%%d.tif


