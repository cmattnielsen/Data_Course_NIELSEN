library(ggplot)
library(ggplot2)



library(ggplot2)

points <- 
  data.frame(
    x = rep(1:9,2), 
    y = rep(1:9,2), 
    z = sort(rep(letters[1:5], 10)),
    w = rep(letters[2:7], 10)
  )

ggplot(data = points, 
       mapping = aes(x = y, y = x, col = factor(y))) + 
  geom_point(size = 69) + 
  facet_grid(w ~ z, switch = "y") +
  theme_light() +
    
  labs(title = "Ugly",
       subtitle = "Very ugly",
       x = "ya",
       y = "ok",
       caption = "okay is spelled ok",
       col = "legend of zelda") 



















