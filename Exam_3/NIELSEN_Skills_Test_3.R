library(ggplot2)
library(tidyverse)
library(broom)
library((tidyselect::))


df <- read_csv("FacultySalaries_1995.csv")
names(df)
df %>%
  select(FedID, UnivName, State, Tier, contains("Salary")) %>%
  select( -contains("ALL")) %>%
  pivot_longer(starts_with("Avg"),names_to = "Rank",values_to = "Salary") %>%
  mutate(Rank = Rank %>% str_remove_all("Avg")) %>%
  mutate(Rank = Rank %>% str_remove_all("ProfSalary")) %>%
  filter(Tier != "VIIB") %>%
  ggplot(aes(x=Rank,y=Salary,fill=Rank)) +
  geom_boxplot() +
  facet_wrap(~Tier) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 60,hjust = 1))

Tier <- mean(c())

SalaryFromRank <- aov(AvgProfSalaryAll ~ Tier + State, data = df) %>%
  capture.output(capture_a, file = "Salary_ANOVA_Summary.txt")



}






















