#BUGS ANalysis

attach.bugs (radon.2)
radon.2
names(radon.2)
str(radon.2$sims.array)
dim(radon.2$sims.array)
radon.2$sims.array[1:10,1:4,4] #iterations, simulation #, parameters

#Convergence Plot
ts.plot(radon.2$sims.array[1:50,1:4,4],
        main = "Illustration of Convergence for Slope Parameter",
        xlab= "Number of Iterations",
        ylab= "Estimate of Parameter (beta = 2)")
lines(radon.2$sims.array[,1,4], col= "blue")
lines(radon.2$sims.array[,2,4], col= "purple")
lines(radon.2$sims.array[,3,4], col= "dark blue")
lines(radon.2$sims.array[,4,4], col= "dark green")

layout(matrix(c(1, 2), nrow=1, byrow=TRUE))
layout.show(n=2)

#Metropolis Plot
radon.2$sims.array[6:9,1:4,1]; radon.2$sims.array[6:9,1:4,4]
plot(radon.2$sims.array[6:9,1,1], radon.2$sims.array[6:9,1,4], xlim= c(4, 6), ylim=c(1,3), type="l", col = "red",
     main = "4 Sequences of Gibbs Sampler for 2 Parameters",
     xlab = "Intercept Parameter for Group 1",
     ylab = "Slope Parameter for All Groups")
points(radon.2$sims.array[6,1,1], radon.2$sims.array[6,1,4], col = "red", pch = 19)
lines(radon.2$sims.array[6:9,2,1], radon.2$sims.array[6:9,2,4], col= "blue")
points(radon.2$sims.array[6,2,1], radon.2$sims.array[6,2,4], col = "blue", pch = 19)
lines(radon.2$sims.array[6:9,3,1], radon.2$sims.array[6:9,3,4], col= "green")
points(radon.2$sims.array[6,3,1], radon.2$sims.array[6,3,4], col = "green", pch = 19)
lines(radon.2$sims.array[6:9,4,1], radon.2$sims.array[6:9,4,4], col= "purple")
points(radon.2$sims.array[6,4,1], radon.2$sims.array[6,4,4], col = "purple", pch = 19)

#Metropolis Plot
plot(radon.2$sims.array[1,1,1], radon.2$sims.array[1,1,4], xlim= c(4, 6), ylim=c(0,3), type="l", col = "red",
     main = "Convergence to Bivariate Normal",
     xlab = "Intercept Parameter for Group 1",
     ylab = "Slope Parameter for All Groups")
points(radon.2$sims.array[8:300,1,1], radon.2$sims.array[8:300,1,4], col = "red", pch = 19, cex=.1)
points(radon.2$sims.array[8:300,2,1], radon.2$sims.array[8:300,2,4], col = "blue", pch = 19, cex=.1)
points(radon.2$sims.array[8:300,3,1], radon.2$sims.array[8:300,3,4], col = "green", pch = 19, cex=.1)
points(radon.2$sims.array[8:300,4,1], radon.2$sims.array[8:300,4,4], col = "purple", pch = 19, cex=.1)

