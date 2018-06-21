'Before running code, copy and paste "WinBUGS Model.bug" into working directory'
setwd("D:/Google Drive/Life/Statistics/Multi-Level Modeling") 
library(R2WinBUGS)
model.data <- list ("N", "J", "x", "y", "group", "group_pred")
model.inits <- function (){
  list (a=rnorm(J), b=rnorm(1), g.0=rnorm(1), g.1=rnorm(1),
        sigma.y=runif(1), sigma.a=runif(1))
}
modeled.parameters <- c ("a", "b", "g.0", "g.1", "sigma.y", "sigma.a")
model <- bugs (model.data, model.inits, modeled.parameters, "WinBUGS Model.bug", n.chains=4, n.burnin=0, n.thin = 1, n.iter=1000, bugs.directory="C:/Users/blake/Downloads/winbugs14_unrestricted/WinBUGS14")
plot (model); options("max.print"=10000); print (model); options("max.print")
