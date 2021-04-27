library(modelr)
library(broom)
library(tidyverse)
library(fitdistrplus)
install.packages("fitdistrplus")

data("mtcars")
glimpse(mtcars)

mod1 = lm(mpg ~ disp, data = mtcars)
summary(mod1)


ggplot(mtcars, aes(x=disp,y=mpg)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  theme_minimal()

mod2 = lm(mpg ~ qsec, data = mtcars)

ggplot(mtcars, aes(x=disp,y=qsec)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  theme_minimal()

mean(mod1$residuals^2)

mean(mod2$residuals^2)


df <- mtcars %>% 
  add_predictions(mod1) 
df[,c("mpg","pred")] %>% head()

newdf = data.frame(disp = c(500,600,700,800,900))

pred = predict(mod1, newdata = newdf)

hyp_preds <- data.frame(disp = newdf$disp,
                        pred = pred)
df$PredictionType <- "Real"
hyp_preds$PredictionType <- "Hypothetical"
fullpreds <- full_join(df,hyp_preds)

g <- ggplot(fullpreds,aes(x=disp,y=pred,color=PredictionType)) +
  geom_point() +
  geom_point(aes(y=mpg),color="Black") +
  theme_minimal()



