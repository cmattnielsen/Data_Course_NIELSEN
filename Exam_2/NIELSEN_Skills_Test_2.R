library(tidyverse)
library(ggplot)
library(ggplot2)
library(modelr)
library(broom)
library(dplyr)
library(janitor)
library(readxl)

states <- read.csv(file= "landdata-states.csv")



# fig1
ggplot(states,aes(x=Year,y=Land.Value,color=region)) +
  geom_smooth() +
  ylab("Land Value (USD)") +
  ggsave("NIELSEN_Fig_1.jpg")
 
  
  
  
   # trying to get rid of the scientific notation
  format(x, scientific = FALSE) +
  formatC(x, digits = 0, format = "f")
  








# what  is NA Region

if(what == NA)
  
states %>%
  select(starts_with("NA")) %>%
  names()

filter(states)
?filter

filter(states, region == "NA")
as.numeric(states$region)

tidy_states$region


# clean unicef
unicef <- read.csv(file= "unicef-u5mr.csv")


as.numeric(as.character(unicef_clean))

unicef_clean <- unicef %>% 
  select(starts_with("NA")) 

unicef_clean2 <- as.numeric(as.character(unicef_clean)) %>%
  select(starts_with("NA"))



mutate(unicef,numeric.as())

(as.numeric(unicef))

as.numeric(as.character(unicef))

df2 <- pivat_longer(starts_with("U5MR"),
                    names_to


unicef2 <- unicef %>%
  select(unicef,starts_with("NA")) %>%
  pivot_longer(cols = c(CountryName)) +
  names_to = "Countries" +
  values_to = "Infant_Mortality"

yes %>%
  filter(is.na)

is.na.data.frame(unicef)

unicef %>%
  summarise(count = sum(is.na(unicef)))

df <- unicef %>%
  mutate(unicef = replace(unicef, NA ==  "--", NA))
is.na(df$unicef)
df$unicef



df <- unicef %>%
  mutate(unicef = replace(unicef, is.na(unicef), "unavailable"))




# clean unicef the right way


DFunicef <- unicef %>% 
  pivot_longer(starts_with("U5MR"),
               names_to="Year",
               values_to="MortalityRate",
               names_prefix="U5MR.") %>%
  mutate(Year=as.numeric(Year),
         MortalityRate=as.numeric(MortalityRate))



DFunicef %>% 
  ggplot(aes(x=Year,y=MortalityRate,color=Region)) +
  geom_smooth()



#fig 2
ggplot(DFunicef,aes(x=Year,y=MortalityRate,color=Continent)) +
  geom_point(size=2.5) +
  ggsave("NIELSEN_Fig_2.jpg")




#fig 3
DFunicef %>%
  group_by(Continent,Year) %>%
  summarise(MeanMR= mean(MortalityRate,na.rm = TRUE)) %>%
  ggplot(aes(x=Year,y=MeanMR,color=Continent,group=Continent)) +
  geom_line(size=3) +
  ggsave("NIELSEN_Fig_3.jpg")



#fig 4
DFunicef %>%
  ggplot(aes(x=Year,y=MortalityRate)) +
  geom_point(color="Blue",shape=1,alpha=1) +
  facet_wrap(~Region) +
  ggsave("NIELSEN_Fig_4.jpg")



































