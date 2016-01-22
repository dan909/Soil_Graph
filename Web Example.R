pkgTest <- function(x)
{
  if (!require(x, character.only = TRUE))
  {
    install.packages(x,dep = TRUE)
    if (!require(x, character.only = TRUE)) stop("Package not found")
  }
}


pkgTest("rgl")
pkgTest("rglwidget")
with(iris, plot3d(Sepal.Length, Sepal.Width, Petal.Length, 
                  type="s", col=as.numeric(Species)))
subid <- currentSubscene3d()
rglwidget(elementId="plot3drgl")