install.packages("tidyverse")
install.packages("ggplot")
library(tidyverse)
library(ggplot)
library(ggplot2)
library(dplyr) 
library(ggplot2)
library(reshape2)
install.packages("reshape2")
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
DNA_DF <- read.csv(file = 'DNA_Conc_by_Extraction_Date.csv')



ggplot(DNA_DF,aes(x= DNA_Concentration_Katy)) +
         geom_histogram() +labs(title= "DNA Concentration",
                                subtitle = "Katy's collection",
                                x= "DNA Concentration",
                                y= "Number of Occurrences")
  

ggplot(DNA_DF,aes(x= DNA_Concentration_Ben)) +
  geom_histogram() +labs(title= "DNA Concentration",
                         subtitle = "Ben's collections",
                         x= "DNA Concentration",
                         y= "Number of Occurrences")


\
ggplot(DNA_DF$DNA_Concentration_Katy,data = DNA_DF, mapping = aes(x=Year_Collected, y=DNA_Concentration_Katy)) +
  geom_boxplot() +
  labs(title= "Katy's Extractions", x="YEAR", y = "DNA Concentration")

\















#boxplot katy


every_nth = function(n) {
  return(function(x) {x[c(TRUE, rep(FALSE, n - 1))]})
}

ggplot(DNA_DF, aes(x=as.factor(Year_Collected), y=DNA_Concentration_Katy)) + 
  stat_boxplot(geom ='errorbar',linetype= 2) +
  geom_boxplot(linetype= "dashed", outlier.shape=1, ) + 
  labs(title= "Katy's Extractions", x="YEAR", y = "DNA Concentration") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(breaks = every_nth(n = 2)) +
  geom_boxplot(aes(ymin=..lower.., ymax=..upper..)) + 
  theme_bw() +
  ggsave("Katy's Extractions.png")
  





  
  
  panel.border = element_rect(linetype = "solid", 
  colour = "black", fill = "NA", size = 0.5)
 
  
#boxplot ben  
  
  every_nth = function(n) {
    return(function(x) {x[c(TRUE, rep(FALSE, n - 1))]})
  }
  
  ggplot(DNA_DF, aes(x=as.factor(Year_Collected), y=DNA_Concentration_Ben)) + 
    stat_boxplot(geom ='errorbar',linetype= 2) +
    geom_boxplot(linetype= "dashed", outlier.shape=1, ) + 
    labs(title= "Ben's Extractions", x="YEAR", y = "DNA Concentration") +
    theme(plot.title = element_text(hjust = 0.5)) +
    scale_x_discrete(breaks = every_nth(n = 2)) +
    geom_boxplot(aes(ymin=..lower.., ymax=..upper..)) + 
    theme_bw() +
    ggsave("Ben's Extractions.png")
  
  
  stat_boxplot(width= 0.5)
  
  
  panel.border = element_rect(linetype = "solid", 
                              colour = "black", fill = "NA", size = 0.5)  
  
  
  
  
  
   
  
#comparing ben vs katy

  
  
  
  
  
  
  
  dat <- as_tibble(DNA_DF)   
  
  dat %>% select(4:5)
  
L1 <- DNA_DF[[4,5]]
  
  df <- data.frame(index=c(1),
                   var1=c(4),
                   var2=c(5))
   ?data.frame
  
ggplot(DNA_DF,xx=Year_Collected)

ggplot(DNA_DF,aes(x=L1,y=Year_Collected)) +
   geom_histogram() +labs(title= "Katy vs Ben")

head(L1)

ggplot(DNA_DF,aes(x= DNA_Concentration_Katy)) +
  geom_histogram() +labs(title= "DNA Concentration",
                         subtitle = "Katy's collection",
                         x= "DNA Concentration",
                         y= "Number of Occurrences")


chart.RelativePerformance(DNA_DF[3, 4:5, drop=FALSE], DNA_DF[3, 4:5, drop=FALSE], colorset=rich8equal, legend.loc="bottomright", main="Relative Performanceof Ben and Katy")




every_nth2 = function(n) {
  return(function(x) {x[c(TRUE, rep(FALSE, n - 2))]})
}
 


#downstairs

Downstairs <- DNA_DF[DNA_DF$Lab == "Downstairs",]

ggplot(Downstairs, aes(x=Date_Collected,y=DNA_Concentration_Ben)) +
  geom_point(shape=1) + scale_x_discrete(breaks = every_nth(n = 2)) +
  ggsave("Ben_DNA_over_time.jpg")





  









  
  
  
  
  
  

  
    
Katy_vs_Ben <- setNames(Dat(as.list(1:6)), LETTERS[1:6])
Katy_vs_Ben[c("A","D","E")]

  
Katy_vs_Ben <- DNA_DF(4,5)  
  

  
  head(Katy_vs_Ben)
  
  
  
  
 # comparing data 
  
  
dat

dat %>% select(1,4,5)


dat = (Year_Collected=c(1), Extraction=c(4:5)) 
 
     barplot(height=dat$Year_collected, names=dat$DNA_Concentration_Katy, 
            col=rgb(0.8,0.1,0.1,0.6),
            xlab="categories", 
            ylab="values", 
            main="My title", 
            ylim=c(0,40)
    )
  plot(dat)  

  
  d <- read.delim(dat, sep="")
  install.package(reshape2)
  library(ggplot2)
  library(reshape2)
  d <- melt(d, id.vars="Year_Collected")
  
  # Everything on the same plot
  ggplot(dat, aes(x=Year_Collected,y)) + 
    geom_point() + 
    stat_smooth() 
  
  # Separate plots
  ggplot(d, aes(Xax,value)) + 
    geom_point() + 
    stat_smooth() +
    facet_wrap(~variable)  
  
  
  
  
  
  
  
  
  
  
  
     
    







































