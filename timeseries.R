## Time series 

rm(list=ls())
library(dynlm)

## 12.14 
load(url("http://www.principlesofeconometrics.com/poe5/data/rdata/gdp5.rdata"))

# A
# is GDP stationary or nonstationary? 

head(gdp5)

# making a time series for every Q from 1984 to 2017. 
gdp <- ts(gdp5$gdp, start = c(1984,1), frequency = 4)

plot(gdp)

t <- 0:length(gdp)
t <- ts(t, start = c(1984,1), frequency = 4)
summary(dynlm(d(gdp) ~ t + L(gdp)+d(L(gdp,1:2))))

#H0:unit root, Reject Ho if tau(t-value) <= t_Cv, (t_Cv=-3.41 at 5% level). 
#conclusion: t-value for Lag1 = -1.999 <-3.41, 
#Hence, GDP follows a nonstationary random walk. 
#Thus,there is insufficient evidence to conclude that GDP is trend stationary. 

