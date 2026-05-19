# Zoom-Effects
Batch downloaders for the .ZD2 and .ZIC films

This repository was inspired by the brilliant work put in by mungewell and fuzboxz in order to make Zoom pedal effects available to non-iOS users and is designed to supplement the use of zoom-zt2.

During my attempts to access the .lst effects lists using zdownload.py that I needed for zoom-zt2 I hit a brickwall, zoom.co.jp was refusing to allow any Python queries to access their servers in order to get the necessary files. I realised I lacked the Python knowledge to adapt the script in a way to access the effects I was hoping to download for my MS-50G+.

After a lot of research and many discussions with AI (my mentor in terminal commands) - I stumbled across the curl download query alternative to using Python.

Here is a collection of .bat files containing download commands for what I believe to be the entire range of Zoom+ pedals that rely on .ZD2 and .ZIC formats for their effects.

Here is an example of the curl commands contained within the .bat files: 
curl -H "User-Agent: HandyGuitarLab/1.0" -o EffectName.zip https://zoom.co.jp"

By replacing EffectName with the specific effect name for each effect on each pedal you can access the effects in the same manner that zdownload.py would.

These commands can access the entire effects collection for the following devices:
MS-50G+ (102 Effects)
MS-50G+ Expansion (24 Effects)
MS-60B+ (112 Effects)
MS-70CDR+ (122 Effects)
MS-80IR+ (40 Effects)
MS-200D+ (179 Effects)
Zoom A1 Four (75 Effects)
Zoom B1 Four (78 Effects)
Zoom G1 Four (85 Effects)

If I have missed any, or anyone wishes to add to this repository by making curl commands for Zoom pedals outside of the + range then feel free to contact me on here.
