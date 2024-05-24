#La faceta permite crear múltiples gráficos uno al lado del otro, estratificados por 
#alguna variable. Esta es una manera de facilitar comparaciones.

#La función facet_grid() permite facetas por hasta dos variables, con filas facetadas 
#por una variable y columnas por la otra. Para faceta por una sola variable, 
#utiliza el operador punto como la otra variable.

#La función facet_wrap() faceta por una variable y envuelve automáticamente la serie de 
#gráficos para que tengan dimensiones legibles.

#La faceta mantiene los ejes fijos en todos los gráficos, facilitando las comparaciones 
#entre ellos.

#Los datos sugieren que la visión del mundo desarrollado versus el mundo en desarrollo 
#ya no tiene sentido en 2012.

# faceta por continente y año
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(continent ~ year)

# faceta solo por año
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(. ~ year)
# faceta por año, gráficos envueltos en múltiples filas
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
gapminder %>%
  filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_wrap(~year)