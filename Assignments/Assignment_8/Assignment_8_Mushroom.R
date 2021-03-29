library(modelr)
library(broom)
library(tidyverse)
library(fitdistrplus)

df <- read_csv("../../Data/mushroom_growth.csv")


ggplot(df,aes(x=GrowthRate,y=Light,color=Species)) +
  geom_smooth()


ggplot(df,aes(x=GrowthRate,y=Nitrogen,color=Species)) +
  geom_smooth()

# defines at least 2 models that explain the dependent variable “GrowthRate”
    # One must be a lm() and
    # one must be an aov()

mod1 = lm(GrowthRate ~ Species * Nitrogen * Humidity * Light * Temperature, data = df)
summary(mod1)


mod2 = aov(GrowthRate ~ Nitrogen, data = df)
summary(mod2)


mean(mod1$residuals^2)

mean(mod2$residuals^2)


pred = predict(mod1, newdata = newdf)

df2 <- df %>% 
  add_predictions(mod1) 
df[,c("GrowthRate","Species")] %>% head()

df3 <- df %>% 
  add_predictions(mod2) 
df[,c("GrowthRate","Nitrogen")] %>% head()


newdf <- data.frame(Species="P.cornucopiae")

add_predictions(df,mod1)


pred = predict(mod1, newdata = newdf)

hyp_preds <- data.frame(disp = newdf$Species)










































