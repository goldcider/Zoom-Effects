@echo off
set "UA=User-Agent: HandyGuitarLab/1.0"
set CURL=curl -L -H "%UA%" -o

set "URL=https://www.zoom.co.jp/archive/GUITAR_LAB"
set "MOD=%URL%/HGL_for_MS80IR_Plus"
set "ZD2=%MOD%/ZDLF"
set "ZIC=%MOD%/EffectIcon/ZIC"
set "ZIR=%MOD%/ZIR"

for /f "tokens=*" %%i in (wordlist.txt) do (
    echo ----------------------------------------
    echo Downloading Effect: %%i
    echo ----------------------------------------
    
    :: Use clean, standard % tags without any delayed expansion bugs
    %CURL% "%%i_ZD2.zip" "%ZD2%/%%i.zip"
    %CURL% "%%i_ZIC.zip" "%ZIC%/%%i.zip"
    %CURL% "%%i_ZIR.zip" "%ZIR%/%%i.zip"
    
    mkdir "%%i" 2>nul
    tar -xf "%%i_ZD2.zip" -C "%%i" 2>nul
    tar -xf "%%i_ZIC.zip" -C "%%i" 2>nul
    tar -xf "%%i_ZIR.zip" -C "%%i" 2>nul
    
    del "%%i_ZD2.zip" "%%i_ZIC.zip" "%%i_ZIR.zip" 2>nul
)
pause
