library(datasets)
data(iris)
summary(iris)
library(tidyverse)


library(ggplot)




p <- ggplot(iris, aes(x=, y=Petal.Length)) + geom_point() + geom_smooth(method = "lm")
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + geom_point() + geom_smooth(method = "lm")
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + geom_point() + geom_smooth(method = "lm")
ggplot(iris, aes(x=Petal.Length, y=Sepal.Length)) + geom_point() + geom_smooth(method = "lm")



p <- ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + geom_point() + geom_smooth(method = "lm")
p



p + labs(title="Sepal length vs petal length", 
          subtitle="for three iris species", 
          y="Sepal.Length", 
          x="Petal.Length", 
          caption="Species")
          geom_point(aes(color=species,size=3)) + 
          geom_smooth(method="lm",color="firebrick") + 
p
p2 <- p

          p2 <- ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + 
            geom_point(aes(color=Species),size=3) + 
            geom_smooth(method="lm",color="firebrick") + 
            labs(title="Sepal length vs petal length", subtitle="for three iris speciest", y="Sepal.Length", x="Petal.Length",) 
          p2

p4 <- p




p3 = ggplot(iris, aes(x=mean(iris$Sepal.Length),y=iris$Sepal.Length*iris$Sepal.Width, fill=Species)) + labs(x="Sepal length deviance from the mean of all observations",y="Ratio of Sepal Width to Petal Width")
p3

p3 + geom_boxplot()














p + facet_wrap(~ Species)
p + facet_wrap(~ Species, scales = "free") + theme(legend.position = "none")
p + facet_wrap(~ Species) + theme(legend.position = "none", strip.text.x = element_text(size = 12, face="bold"))
p + facet_wrap(~ Species) + theme(legend.position = "none", 
                                 strip.text.x = element_text(size = 12, face="bold"),
                                 strip.background = element_rect(fill = "lightblue"))

p







































jpeg("./Sepal_vs_Petal.jpg")
plot(x=dat$Sepal.Length,
     y=dat$Petal.Width,
     col=dat$Species,
     main = "Length vs Width",
     xlab = "Length",
     ylab = "Width")
dev.off()




