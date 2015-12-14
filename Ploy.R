
install.packages("rgl")
library("rgl")

Soil.Teating <- read.csv("~/GitHub/Soil_Graph/Soil_Graph/Soil Teating.csv")

Wid <- max(Soil.Teating$Width) ## max vals
Len <- max(Soil.Teating$Length)
Depth <- max(Soil.Teating$Depth)

Fild <- NA  ## Setup blank Data
Fild$pram <- list(1:Wid, 1:Len, 1:Depth)
for (Depth in Fild$pram[[3]]) {
  Fild$Soil[Depth] <- list(matrix(NA,max(Fild$pram[[1]]),max(Fild$pram[[2]])))
}

# Make Data
for (Rw in 1:nrow(Soil.Teating)) {
  Fild$Soil[[Soil.Teating$Depth[Rw]]][Soil.Teating$Width[Rw], Soil.Teating$Length[Rw]] <- as.character(Soil.Teating$Type[Rw])
}

with(Fild$pram, plot3d(x = Fild$pram[[1]], y = Fild$pram[[2]], Fild$pram[[3]] + 1, type = "n", size = 0, col = "red", cex = 2, box = FALSE, aspect = "iso")) # Makes a corectly sised plot
planes3d(a = c(0,max(Fild$pram[[1]])), b = c(0,max(Fild$pram[[2]])), c = -1, d = max(Fild$pram[[3]]) + .5, col = "chocolate4", alpha = 0.8) # puts a soil top on it
Lst <- list(c("Sandy Clay", "red"), c("Clay", "goldenrod1"), c("Silty Clay", "darkslategray1"), c("Clay Loam", "olivedrab1"), c("Silty Clay Loam", "turquoise4"), c("Sandy Clay Loam", "tomato"), c("Sandy Loam", "thistle4"), c("Loamy Sand", "thistle2"), c("Sand", "tan1"), c("Medium Loam", "sienna2"), c("Silty Loam", "mediumseagreen"), c("Silt", "limegreen"))

for (i in 1:length(Lst)) {
  Sub.Testing <- Soil.Teating[Soil.Teating$Type == Lst[[i]][1], ] # Lst name
  sprites3d( Sub.Testing$Width, Sub.Testing$Length, Sub.Testing$Depth, color = Lst[[i]][2], lit = FALSE, alpha = .4,
               textype = "alpha", texture = system.file("textures/particle.png", package = "rgl") )
}
