#Puntos clave
#Considera usar un gráfico de pendientes o un gráfico de Bland-Altman cuando 
#compares una variable en dos momentos diferentes, especialmente para un pequeño 
#número de observaciones.
#Los gráficos de pendientes usan el ángulo para codificar el cambio. Usa geom_line() 
#para crear gráficos de pendientes. Es útil cuando se comparan un pequeño número de 
#observaciones.
#El gráfico de Bland-Altman (gráfico de diferencia media de Tukey, gráfico MA) 
#grafica la diferencia entre condiciones en el “eje y” y la media entre condiciones en 
#el “eje x”. Es más apropiado para un gran número de observaciones que los gráficos de 
#pendientes.

#Código: gráfico de pendientes
library(tidyverse)
library(dslabs)
data(gapminder)

west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")
dat <- gapminder %>%
  filter(year %in% c(2010, 2015) & region %in% west & !is.na(life_expectancy) & population > 10^7)
dat %>%
  mutate(location = ifelse(year == 2010, 1, 2),
         location = ifelse(year == 2015 & country %in% c("United Kingdom", "Portugal"),
                           location + 0.22, location),
         hjust = ifelse(year == 2010, 1, 0)) %>%
  mutate(year = as.factor(year)) %>%
  ggplot(aes(year, life_expectancy, group = country)) +
  geom_line(aes(color = country), show.legend = FALSE) +
  geom_text(aes(x = location, label = country, hjust = hjust), show.legend = FALSE) +
  xlab("") +
  ylab("Life Expectancy")




#Código: gráfico de Bland-Altman
library(ggrepel)
dat %>%
  mutate(year = paste0("life_expectancy_", year)) %>%
  select(country, year, life_expectancy) %>% spread(year, life_expectancy) %>%
  mutate(average = (life_expectancy_2015 + life_expectancy_2010)/2,
         difference = life_expectancy_2015 - life_expectancy_2010) %>%
  ggplot(aes(average, difference, label = country)) +
  geom_point() +
  geom_text_repel() +
  geom_abline(lty = 2) +
  xlab("Average of 2010 and 2015") +
  ylab("Difference between 2015 and 2010")
