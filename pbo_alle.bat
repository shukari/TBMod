SET armaFolder="C:\Arma3mods\@TBMod_dev\addons"

:: -BD statt -B; -P wenn keine Pause
FOR /D %%G in ("addons\TBMod*") DO MakePbo.exe -A -B -D -P -X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar addons\%%~nxG %armaFolder%
