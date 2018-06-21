'This code creates the data set for analysis.' 
n = 15; std.dev = 2 ; N = as.integer(6 * n) #Set parameters for simulated normal distributions
#Generating sample regression lines for groups 1, 2 and 3
set.seed(1234)
group_1A <- rnorm(n, 0, std.dev) ; group_1B <- rnorm(n, 2, std.dev) #sample for pop. reg. line: E(x)= 2x
group_2A <- rnorm(n, 6, std.dev) ; group_2B <- rnorm(n, 8, std.dev) #sample for pop. reg. line: E(x)= 6 + 2x
group_3A <- rnorm(n, 12, std.dev); group_3B <- rnorm(n, 14, std.dev) #sample for pop. reg. line: E(x)= 12 + 2x
y <- c(group_1A, group_1B, group_2A, group_2B, group_3A, group_3B) #Response variable
x <- as.numeric(rep(0:1, times=3, each=n)) #individual predictors for each reg line at x=(0,1)
#generating group-level data
group_1 = 0; group_2= 1; group_3 = 2 #group predictor
group <- as.numeric(rep(1:3, each=2*n)) #group ID
group_pred <- c(group_1, group_2, group_3) #vector of group predictors
J = as.integer(length(unique(group_pred))) #number of groups


