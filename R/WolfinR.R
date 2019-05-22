# Sompob Saralamba <saralamba@gmail.com>
# the main command - WolfinR
# idea : save the wolflang command and run it.
# if its output is graphics then
#    export as png
# else
#    print on screen
#
WolfinR <- function(input,graphics=FALSE) {
  tmpdir <- tempdir()
  outputpng <- paste0(tmpdir,'/WolfinR.png')
  outputpng2 <- paste0('\"',tmpdir,'/WolfinR.png','\"')
  wlfilepath <- paste0(tmpdir,'/WolfinR.wl')
  if(graphics==FALSE){
    inputTxt <- gsub("INPUT",input,wltext)
    wlfile <- file(wlfilepath,"w")
    writeLines(inputTxt,wlfile)
    close(wlfile)
  }else{
    inputGrp2 <- gsub("OUTPUT",outputpng2,gsub("INPUT",input,wlgrp),fixed = TRUE)
    inputGrp <- gsub("\\\\","/",inputGrp2)
    wlfile <- file(wlfilepath,"w")
    writeLines(inputGrp,wlfile)
    close(wlfile)
  }


  cmd <- paste0('wolframscript -file ',wlfilepath)
  shell(shQuote(cmd,type="cmd"))
  if(graphics==TRUE){
    grid::grid.raster(png::readPNG(outputpng))
  }
}


