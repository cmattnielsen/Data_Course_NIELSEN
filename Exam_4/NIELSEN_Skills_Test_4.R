library(tidyverse)
library(reshape2)
library(PerformanceAnalytics)



DNA_DF <- read.csv(file = 'DNA_Conc_by_Extraction_Date.csv')


ggplot(DNA_DF,aes(x= DNA_Concentration_Katy)) +
  geom_histogram() + labs(title= "DNA Concentration",
                         subtitle = "Katy's collection",
                         x= "DNA Concentration",
                         y= "Number of Occurrences")


ggplot(DNA_DF,aes(x= DNA_Concentration_Ben)) +
  geom_histogram() + labs(title= "DNA Concentration",
                          subtitle = "Ben's collection",
                          x= "DNA Concentration",
                          y= "Number of Occurrences")








Ben_Plot <- ggplot(DNA_DF, aes(x=as.factor(Year_Collected), y=DNA_Concentration_Ben)) + 
  geom_boxplot() +
  labs(title= "Ben's Extractions", x="YEAR", y = "DNA Concentration") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ggsave("NIELSEN_Plot2.jpeg")

Katy_Plot <- ggplot(DNA_DF, aes(x=as.factor(Year_Collected), y=DNA_Concentration_Katy)) + 
  geom_boxplot() +
  labs(title= "Katy's Extractions", x="YEAR", y = "DNA Concentration") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ggsave("NIELSEN_Plot1.jpeg")



# task 4


COMP_BEN_KATY <- c("DNA_Concentration_Katy","DNA_Concentration_Ben")
barplot(DNA_DF, main="COMP_BEN_KATY",height = as.numeric("Year_Collected"),
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)


ggplot(data=DNA_DF, aes(x=as.factor(Year_Collected), y=COMP_BEN_KATY, fill=Lab)) +
  geom_bar(stat="identity", position=position_dodge())+
  geom_text(aes(label=len), vjust=1.6, color="white",
            position = position_dodge(0.9), size=3.5)+
  scale_fill_brewer(palette="Paired")+
  theme_minimal()

ggplot(DNA_DF, aes(x=as.factor(Year_Collected), y=COMP_BEN_KATY)) + 
  geom_bar(position-"dodge",fill= c("blue","red")) 


ggplot(DNA_DF, aes(fill = c("red", "blue", y=Year_Collected, x=COMP_BEN_KATY))) + 
  geom_bar(position="dodge", stat="identity")



mean(DNA_DF$DNA_Concentration_Ben[c(1:17)]) - mean(DNA_DF$DNA_Concentration_Katy[c(1:17)])


ben_extrac <- c(DNA_DF$DNA_Concentration_Ben)
katy_extrac <- c(DNA_DF$DNA_Concentration_Katy)
DNA_DF$differences <- ben_extrac-katy_extrac
DNA_DF$Year_Collected[DNA_DF$differences == min(DNA_DF$differences)]


#downstairs

Downstairs <- DNA_DF[DNA_DF$Lab == "Downstairs",]

ggplot(Downstairs, aes(x=Date_Collected,y=DNA_Concentration_Ben)) +
  geom_point(shape=1) + scale_x_discrete(breaks = every_nth(n = 2)) +
  ggsave("Ben_DNA_over_time.jpg")





