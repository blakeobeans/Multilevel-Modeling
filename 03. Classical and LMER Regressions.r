#classical regression
library("lme4") #for lmer function, automatically installs matrix package
lm.unpooled <- lm(formula = y~x + factor(group)); summary(lm.unpooled) #unpooled regression 
group_predt <- as.numeric(rep(0:2, each=2*n)) #transform group level predictor to fit regression matrix
M4 <- lmer (y ~ x + group_predt + (1 | group));display(M4) #Varying-intercept and slope model with an individual-level predictor
coef(M4)