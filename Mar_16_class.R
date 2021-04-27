library(tidyverse)
library(modelr)




# Some simulated data
sim1
ggplot(sim1,aes(x,y)) + geom_point() + geom_smooth(se=FALSE,method = "lm") # x is numeric



sim2
ggplot(sim2,aes(x,y)) + geom_point() # x is categorical



sim3
ggplot(sim3,aes(x1,y,color=x2)) + geom_point() # categorical AND numeric predictors



















