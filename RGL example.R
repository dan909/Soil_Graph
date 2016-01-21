pkgTest <- function(x)
{
  if (!require(x, character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if (!require(x, character.only = TRUE)) stop("Package not found")
  }
}

pkgTest("rgl") # install if nessesery


cols <- colorRampPalette(c("blue","yellow","red","purple"))(256)
for (Len in Fild$pram[[1]]) {
  for (Wid in Fild$pram[[2]]) {
    for (Depth in Fild$pram[[3]]) {
      shade3d( translate3d( scale3d( cube3d(col = cols[(1/((Len-1) + (Wid-1) + (Depth-1)))*256], alpha = 0.3), .5, .5, .5), Len, Wid, Depth ) )
    }
    
  }
  
} ## to hear