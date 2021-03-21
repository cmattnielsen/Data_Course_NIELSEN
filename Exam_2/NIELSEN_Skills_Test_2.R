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





