library(modelr)
library(broom)
library(tidyverse)
library(fitdistrplus)

df <- read_csv("../../Data/mushroom_growth.csv")


g1 <- ggplot(df,aes(x=GrowthRate,y=Light,color=Species)) +
  geom_smooth()


g2 <- ggplot(df,aes(x=GrowthRate,y=Nitrogen,color=Species)) +
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

df$PredictionType <- "Real"



hyp_preds$PredictionType <- "Hypothetical"
fullpreds <- full_join(df,hyp_preds)







mod1
add_predictions(df,mod1)

pred=predict(mod1, newdata=hype_df)


hype_df2 <- read_csv("./Hype_Data.csv")

hype_df %>%
  mutate(Species=as.numeric(Species),
      Temperature=as.numeric(Temperature),
      Light=as.numeric(Light),
      Nitrogen=as.numeric(Nitrogen),
      Growth=as.numeric(Growth))








df$Nitrogen
spp <- "P.Cornucopiae"
hum <- "High"
temp <- "30"
ligh <- "3"
nit <- "10"
Growth <- NA

hyp_data <- data.frame(Species=spp,
                       Humidity=hum,
                       Temperature=temp,
                       Light=ligh,
                       Nitrogen=ni)

add_predictions(Hype_Data,df)

hyp_preds$PredictionType <- "Hypothetical"



hyp_data

add_predictions(hype_df2,mod1)


#graph with my predictions!!! this took me way way to long I am so happy its working


hype_graph <- ggplot(df, aes(x=Light,y=GrowthRate)) +
  geom_point() +
  geom_smooth(method = "lm") +
  geom_point(data = hype_df2, aes(x=Light,y=pred),color="Blue")




patchwork <- ()



patchwork <- (g1 + g2) / hype_graph
patchwork + plot_annotation(
  title = 'Natural vs. Predictive Growth',
  subtitle = 'The top two show the real data the bottom is based of a predictive data set',
  caption = 'very insightful')





#linear model

nonlinear <- read_csv("../../Data/non_linear_relationship.csv")


ggplot(nonlinear)


ggplot(nonlinear,x=predictor,y=response) +
  geom_point()


lm(response ~ predictor, data = nonlinear)







