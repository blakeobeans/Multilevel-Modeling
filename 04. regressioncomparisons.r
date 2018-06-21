#Regression Line Comparison
uniq <- unique(group_id)

display8 <- c (1:3)
x.jitter <- x + runif(n,-.05,.05)
x.jitter <- x
x.range <- range (x.jitter)
y.range <- range (y[!is.na(match(county,display8))])


a.pooled <- lm.pooled$coefficients[1]           # complete-pooling intercept
b.pooled <- lm.pooled$coefficients[2]           # complete-pooling slope
a.nopooled <- lm.unpooled$coefficients[3:(J+1)] # no-pooling vector of intercepts

t.nopooled <- lm.unpooled$coefficients[3:(J+1)]
t.nopooled
a.nopooled



lm.unpooled[["coefficients"]][["(Intercept)"]] 

b.nopooled <- lm.unpooled[["coefficients"]][["indv_pred"]]       # no-pooling slope
b.nopooled
a.population <- c(0,6,10)           # complete-pooling intercept
b.population <- 2           # complete-pooling slope
a.lmer <- coef(M3)$group_id[1]           # complete-pooling intercept
b.lmer <- coef(M3)$group_id[2]           # complete-pooling slope
c.lmer <- coef(M3)$group_id[3]
d.lmer <- coef(M3)$group_id[4]

coef(M3)


attach.bugs (radon.2)
a.multilevel <- rep (NA, J)
for (j in 1:J){
  a.multilevel[j] <- median (a[,j])}
b.multilevel <- median (b)

par (mfrow=c(2,2))
for (j in display8){
  plot (x.jitter[county==j], y[county==j],
        xlab="floor", ylab="log radon level", main=uniq[j])
  curve (a.pooled + b.pooled*x, lwd=.5, lty=2, col="blue", add=TRUE)
  curve (coef(lm.unpooled)[j] + coef(lm.unpooled)[4]*x, lwd=.5, col="green", add=TRUE)
  curve (a.multilevel[j] + b.multilevel*x, lwd=1, col="red", add=TRUE)
  curve (a.population[j] + b.population*x, lwd=1, col="purple", add=TRUE)
}

#individual groups
for (j in 2){
  plot (x.jitter[county==j], y[county==j],
        cex=1.5,
        cex.lab=1.5,
        cex.axis=1.5,
        cex.main=1.5, 
        cex.sub=1.5,
        xlab="Predictor", 
        ylab="Response", 
        ylim=c(0, 12), 
        main="Group 2",
        col = "blue")
  curve (a.pooled + b.pooled*x, lwd=.5, lty=2, col="blue", add=TRUE)
  curve (coef(lm.unpooled)[j] + coef(lm.unpooled)[4]*x, lwd=3, lty=3, col="green", add=TRUE)
  curve (a.multilevel[j] + b.multilevel*x, lwd=3, col="purple", lty=3, add=TRUE)
  curve (a.population[j] + b.population*x, lwd=3, lty = 1, col="blue", add=TRUE)
}

a.multilevel[j]
b.multilevel
