# Zoom-Effects
Batch downloaders for .ZD2 / .ZIC / .ZIR effect files

This repository was inspired by the brilliant work put in by `@mungewell`, `@thammer` and `@fuzboxz` in order to make Zoom pedal effects available to non-iOS users and is designed to supplement the use of zoom-zt2. Below are the links to their respective work:  

[`Zoom Zt2`](https://github.com/mungewell/zoom-zt2/tree/master)  
[`Zoom FX List`](https://github.com/mungewell/zoom-zt2/tree/master/zoom_fx_HGL/zoom_fx)  
[`Zdownload`](https://github.com/fuzboxz/zdownload/tree/master)  
[`Zoom-explorer`](https://github.com/thammer/zoom-explorer)  

During my attempts to access the .lst effects lists using zdownload.py that I needed for zoom-zt2 I hit a brickwall, zoom.co.jp was refusing to allow any Python queries to access their servers in order to get the necessary files. I realised I lacked the Python knowledge to adapt the script in a way to access the effects I was hoping to download for my MS-50G+.

After a lot of research and many discussions with AI (my mentor in terminal commands) - I stumbled across the curl download query alternative to using Python.

Here is a collection of .bat files containing download commands for what I believe to be the entire range of Zoom+ pedals that rely on .ZD2 /.ZIC / .ZIR formats for their effects.

Here is an example of the curl commands contained within the .bat files:  
```batch
set "UA=User-Agent: HandyGuitarLab/1.0" && curl -L -H "%UA%" -o ZD2.zip "https://www.zoom.co.jp/archive/GUITAR_LAB/HGL_for_MS50G_Plus/ZDLF/EFFECTNAME.zip" && curl -L -H "%UA%" -o ZIC.zip "https://www.zoom.co.jp/archive/GUITAR_LAB/HGL_for_MS50G_Plus/EffectIcon/ZIC/EFFECTNAME.zip" && curl -L -H "%UA%" -o ZIR.zip "https://www.zoom.co.jp/archive/GUITAR_LAB/HGL_for_MS50G_Plus/ZIR/EFFECTNAME.zip" && mkdir EFFECTNAME && tar -xf ZD2.zip -C EFFECTNAME && tar -xf ZIC.zip -C EFFECTNAME && tar -xf ZIR.zip -C EFFECTNAME && del ZD2.zip ZIC.zip ZIR.zip
```
By replacing EFFECTNAME with the specific effect name (found in mungewell's zoom fx lists) for each effect on each pedal you can access the effects in the same manner that zdownload.py would.

These commands can access the entire effects collection for the following devices:  
MS-50G+ (102 Effects)  
MS-50G+ Expansion (24 Effects)  
MS-60B+ (112 Effects)  
MS-70CDR+ (122 Effects)  
MS-80IR+ (40 Effects)  
MS-200D+ (179 Effects)  
Zoom A1 Four (75 Effects) - Not currently available  
Zoom B1 Four (78 Effects) - Not currently available  
Zoom G1 Four (85 Effects) - Not currently available  

If I have missed any, or anyone wishes to add to this repository by making curl commands for Zoom pedals outside of the + range then feel free to contact me on here.
