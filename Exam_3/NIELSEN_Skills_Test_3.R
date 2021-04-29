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

SalaryFromRank <- aov(AvgProfSalaryAll ~ Tier + State, data = df)

summary(SalaryFromRank) %>%
  capture.output(capture_a, file = "Salary_ANOVA_Summary.txt")



# Young Living
df2 <- read_csv("Juniper_Oils.csv")


CHEMS <- c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene","beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene","cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol","alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal")

# This stacks the chemicals on top of one another. This way there are more rows and far fewer columns but instead of them being horizontal all variables that are dependent on the chemical are all vertical. R can read it this way but it could not read it the previous way.
# the same chemical will repeat numerous times but that is a good thing. Means it is done correctly.
df2_correct <- df2 %>%
  pivot_longer(CHEMS, names_to="CHEMS", values_to="Amount")



MOD <- glm(data = df2_correct,
           formula = Amount ~ CHEMS + YearsSinceBurn)
#amount is based off the chemicals plus years since burn



Plot_CHEMS <- df2_correct %>%
  ggplot(aes(x=YearsSinceBurn,y=Amount)) + geom_smooth() +
  facet_wrap(~CHEMS,scales="free")



# now run the significant chems 

tidy(MOD)


MOD %>%
  tidy() %>%
  filter(p.value < 0.05) %>%
  mutate(term = str_remove(term,pattern="CHEMS"))



# just me vastly overthinking things like normal

mutate(YearsSinceBurn=as.numeric(YearsSinceBurn))


mutate_all(df2=as.numeric(df2))



df2 %>%
  ggplot(df2,aes(x=YearsSinceBurn,y=ChemTotal)) +
  geom_point(color="Blue",shape=1,alpha=1) +
  facet_wrap(~c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene","beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene","cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol","alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal")) +
  ggsave("NIELSEN_Fig_1.jpg")



which(is.na(as.numeric(as.character(df2[[1]]))))



Linear <- glm(formula = YearsSinceBurn ~ Yield_percent + CHEMS + ChemTotal , data = df2)

broom::tidy(Linear)

mutate(CHEMS=as.numeric(CHEMS))





knitr::











