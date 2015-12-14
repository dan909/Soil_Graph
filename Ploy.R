
install.packages("rgl")
library("rgl")

Soil.Teating <- read.csv("~/GitHub/Soil_Graph/Soil_Graph/Soil Teating.csv")


particles3d( rnorm(5), rnorm(5), rnorm(5), color=rainbow(5) )

polygon3d(c(1,5,7), y = c(2,4,6), z = c(3,6,7))
open3d()
particles3d( rnorm(5), rnorm(5), rnorm(5), color=rainbow(5) )
