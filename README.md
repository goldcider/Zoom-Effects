# Zoom-Effects
Batch downloaders for .ZD2 / .ZIC / .ZIR effect files

This repository was inspired by the brilliant work put in by `@mungewell`, `@thammer` and `@fuzboxz` in order to make Zoom pedal effects available to non-iOS users and is designed to supplement the use of zoom-zt2. Below are the links to their respective work:  

[`Zoom Zt2`](https://github.com/mungewell/zoom-zt2/tree/master)  
[`Zoom FX List`](https://github.com/mungewell/zoom-zt2/tree/master/zoom_fx_HGL/zoom_fx)  
[`Zdownload`](https://github.com/fuzboxz/zdownload/tree/master)  
[`Zoom-explorer`](https://github.com/thammer/zoom-explorer)  

During my attempts to access the .lst effects lists using zdownload.py that I needed for zoom-zt2 I hit a brickwall, zoom.co.jp was refusing to allow any Python queries to access their servers in order to get the necessary files. I realised I lacked the Python knowledge to adapt the script in a way to access the effects I was hoping to download for my MS-50G+.

After a lot of research and many discussions with AI (my mentor in terminal commands) - I stumbled across the curl download query alternative to using Python.

Each device category contains instructions, a downloader batch file, a device specific wordlist and details on each effects category. The downloader will download any available .ZD2 / .ZIC / .ZIR formats for the specified effects.

Here is an example of the curl command contained within the .bat files:  
```batch
@echo off
set "UA=User-Agent: HandyGuitarLab/1.0"
set CURL=curl -L -H "%UA%" -o

set "URL=https://www.zoom.co.jp/archive/GUITAR_LAB"
set "MOD=%URL%/HGL_for_MS50G_Plus"
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
```
Each device has it's own associated wordlist.txt that is required in order to fetch the effects for the specified device - if you are after an individual effect then you will need to identify the effect name in the wordlist and create your own wordlist.txt containing just that effect's name - some devices share effects so downloading them all to the same folder may overwrite existing files.

These commands can access the entire effects collection for the following devices:  
MS-50G+ (102 Effects)  
MS-50G+ Expansion (24 Effects)  
MS-60B+ (112 Effects) - In Progress
MS-70CDR+ (122 Effects) - In Progress
MS-80IR+ (40 Effects) - In Progress
MS-200D+ (73 Effects)
Zoom A1 Four (75 Effects) - Not currently available  
Zoom B1 Four (78 Effects) - Not currently available  
Zoom G1 Four (85 Effects) - Not currently available  

If I have missed any, or anyone wishes to add to this repository by making curl commands for Zoom pedals outside of the + range then feel free to contact me on here.
