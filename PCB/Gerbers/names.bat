REM Rename the Gerber files for processing by SeeedStudio.

set name=Stenokey
del "%name%.GBL"
del "%name%.GBS"
del "%name%.GBO"
del "%name%.GTL"
del "%name%.GTS"
del "%name%.GTO"
del "%name%.GML"
del "%name%.TXT"

rename "%name%-b.cu.gbr" "%name%.GBL"
rename "%name%-b.mask.gbr" "%name%.GBS"
rename "%name%-b.silks.gbr" "%name%.GBO"
rename "%name%-f.cu.gbr" "%name%.GTL"
rename "%name%-f.mask.gbr" "%name%.GTS"
rename "%name%-f.silks.gbr" "%name%.GTO"
rename "%name%-edge.cuts.gbr" "%name%.GML"
rename "%name%.drl" "%name%.TXT"