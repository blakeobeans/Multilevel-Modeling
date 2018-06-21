#winBUGSinference
attach(model)
names(model) #variables in the WinBUGS model.
#str(model$median)
dim(model$sims.array) #number of iterations, chains and parameters
model$sims.array[1:10,1,1:9] #First 10 for chain 1 for all parameters

par(mfrow=c(3,2)) 
layout.show(n=6)
#Uncertainty Intervals
a1 <- model$sims.array[,1,1]
median(a1)
a1q<- quantile(a1, c(0.05, 0.95))
hist(a1, prob=T, col="skyblue2", breaks=100, xlim=c(-1.2,.4), main = "95% CI (-1.3, .3)", cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = a1q, lty="dashed", lwd=2, col="red")
lines(density(a1), col="blue", lwd=2, lty="dotted")

a2 <- model$sims.array[,1,2]
median(a2)
a2q<- quantile(a2, c(0.05, 0.95))
hist(a2, prob=T, col="skyblue2", breaks=100, xlim=c(4.3,6.3), main = "95% CI (4.5, 6.1)", cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = a2q, lty="dashed", lwd=2, col="red")
lines(density(a2), col="blue", lwd=2, lty="dotted")

a3 <- model$sims.array[,1,3]
median(a3)
a3q<- quantile(a3, c(0.05, 0.95))
hist(a3, prob=T, col="skyblue2", breaks=200, xlim=c(11.6,13.2), main = "95% CI (11.6, 13.2)", cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = a3q, lty="dashed", lwd=2, col="red")
lines(density(a3), col="blue", lwd=2, lty="dotted")

b <- model$sims.array[,1,4]
bq<- quantile(b, c(0.05, 0.95))
hist(b, prob=T, col="skyblue2", xlim=c(0.8, 2.4), breaks=200, main = "95% CI (0.8, 2.4)", 
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = bq, lty="dashed", lwd=2, col="red")
lines(density(b), col="blue", lwd=2, lty="dotted")

model$median$sigma.y

model$sigma.y

#par(mfrow=c(2,1))
sigma.y <- model$sims.array[,1,7]
sigma.yq<- quantile(sigma.y, c(0.05, 0.95))
hist(sigma.y, prob=T, col="skyblue2", xlim=c(1.6, 2.3), breaks=500, main = "95% CI (1.7, 2.5)", cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = sigma.yq, lty="dashed", lwd=2, col="red")
lines(density(sigma.y), col="blue", lwd=2, lty="dotted")

sigma.a <- model$sims.array[,1,8]
sigma.aq<- quantile(sigma.a, c(0.05, 0.95))
hist(sigma.a, prob=T, col="skyblue2", xlim=c(0, 4), breaks=25, main = "95% CI (0, 1.8)", cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
abline(v = sigma.aq, lty="dashed", lwd=2, col="red")
lines(density(sigma.a), col="blue", lwd=2, lty="dotted")


par(mfrow=c(1,2))
#intra-class correlation
ic <- sigma.a^2/(sigma.a^2 + sigma.y^2)
ic.aq<- quantile(ic, c(0.05, 0.95))
hist(ic, prob=T, col="skyblue2", xlim=c(0, 1), breaks=50, main = "Posterior Distribution of Intraclass Correlation",
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5,
     xlab = "Intraclass Correlation")
abline(v = ic.aq, lty="dashed", lwd=2, col="red")
lines(density(ic), col="blue", lwd=2, lty="dotted")


#cloud
plot(model$sims.array[1,1,7], model$sims.array[1,1,8], xlim= c(1, 4), ylim=c(0,3), type="l", col = "red",
     main = "Bivariate Distribution of Variances",
     xlab = "Individual-Level Variance",
     ylab = "Group-Level Variance",
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5)
points(model$sims.array[8:1000,1,7], model$sims.array[8:1000,1,8], col = "red", pch = 19, cex=.1)
points(model$sims.array[8:1000,2,7], model$sims.array[8:1000,2,8], col = "blue", pch = 19, cex=.1)
points(model$sims.array[8:1000,3,7], model$sims.array[8:1000,3,8], col = "green", pch = 19, cex=.1)
points(model$sims.array[8:1000,4,7], model$sims.array[8:1000,4,8], col = "purple", pch = 19, cex=.1)
abline(v = sigma.yq, lty="dashed", lwd=2, col="red")
abline(h = sigma.aq, lty="dashed", lwd=2, col="red")


