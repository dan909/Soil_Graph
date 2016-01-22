pkgTest <- function(x)
{
  if (!require(x, character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if (!require(x, character.only = TRUE)) stop("Package not found")
  }
}

pkgTest("rgl") # install if nessesery

Shape_Testing <- read.csv("Shape Testing.csv")  # Test File



cols <- colorRampPalette(c("blue","yellow","red"))(256)

for (Row in 1:nrow(Shape_Testing)) {
  scail_temp <- round( ((Shape_Testing$TEMP[Row] / max(Shape_Testing$TEMP) ) * 256), digits = 1) # make whatever the max temp is 256 & round to int
  X <- Shape_Testing$X[Row]
  Y <- Shape_Testing$Y[Row]
  Z <- Shape_Testing$Z[Row]
  shade3d( translate3d( scale3d( cube3d(col = cols[scail_temp], alpha = 0.6), .3, .3, .3), X, Y, Z) )
  } ## to hear
