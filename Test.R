
install.packages("rgl")
library("rgl")

Soil.Testing <- read.csv("Soil Testing.csv")  # Test File

Wid <- max(Soil.Testing$Width) ## max vals
Len <- max(Soil.Testing$Length)
Depth <- max(Soil.Testing$Depth)

Fild <- NA  ## Setup blank Data
Fild$pram <- list(1:Wid, 1:Len, 1:Depth)
for (Depth in Fild$pram[[3]]) {
  Fild$Silt[Depth] <- list(matrix(0,max(Fild$pram[[1]]),max(Fild$pram[[2]])))
  Fild$Sand[Depth] <- list(matrix(0,max(Fild$pram[[1]]),max(Fild$pram[[2]])))
  Fild$Clay[Depth] <- list(matrix(0,max(Fild$pram[[1]]),max(Fild$pram[[2]])))
}

# Make Data
for (Rw in 1:nrow(Soil.Testing)) {
  Fild$Silt[[Soil.Testing$Depth[Rw]]][Soil.Testing$Width[Rw], Soil.Testing$Length[Rw]] <- round(Soil.Testing$Silt[Rw]*255,0)
  Fild$Sand[[Soil.Testing$Depth[Rw]]][Soil.Testing$Width[Rw], Soil.Testing$Length[Rw]] <- round(Soil.Testing$Sand[Rw]*255,0)
  Fild$Clay[[Soil.Testing$Depth[Rw]]][Soil.Testing$Width[Rw], Soil.Testing$Length[Rw]] <- round(Soil.Testing$Clay[Rw]*255,0)
}

with(Fild$pram, plot3d(x = Fild$pram[[1]], y = Fild$pram[[2]], Fild$pram[[3]] + 1, type = "n", size = 0, col = "red", cex = 2, box = FALSE, aspect = "iso")) # Makes a corectly sised plot
planes3d(a = c(0,max(Fild$pram[[1]])), b = c(0,max(Fild$pram[[2]])), c = -1, d = max(Fild$pram[[3]]) + .5, col = "chocolate4", alpha = 0.8) # puts a soil top on it

## This last section can he run alone just to make cubes
for (Len in Fild$pram[[1]]) {
  for (Wid in Fild$pram[[2]]) {
    for (Depth in Fild$pram[[3]]) {
      shade3d( translate3d( scale3d( cube3d(col = rgb(Fild$Sand[[Depth]][Len,Wid], Fild$Silt[[Depth]][Len,Wid], Fild$Clay[[Depth]][Len,Wid], maxColorValue = 255), alpha = 0.3), .5, .5, .5), Len, Wid, Depth ) )
    }
    
  }
  
}

