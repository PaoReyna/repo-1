#Los gráficos de series temporales tienen el tiempo en el “eje x” y una variable de interés 
#en el “eje y”.

#La geometría geom_line() conecta puntos de datos adyacentes para formar una línea continua. Un gráfico de líneas es apropiado cuando los puntos están espaciados regularmente, densamente empaquetados y provienen de una única serie de datos.

#Puedes trazar múltiples líneas en el mismo gráfico. Recuerda agrupar o colorear por una 
#variable para que las líneas se tracen independientemente.

#Generalmente, se prefiere el etiquetado sobre las leyendas. Sin embargo, las leyendas son 
#más fáciles de hacer y aparecen por defecto. Añade una etiqueta con geom_text(), 
#especificando las coordenadas donde la etiqueta debe aparecer en el gráfico.

#Código: serie temporal única
# gráfico de puntos de fertilidad de EE. UU. por año
gapminder %>%
  filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_point()

# gráfico de línea de fertilidad de EE. UU. por año
gapminder %>%
  filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_line()

#Código: múltiples series temporales

# gráfico de línea de series temporales de fertilidad para dos países - solo una línea (incorrecto)
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility)) +
  geom_line()

# gráfico de línea de series temporales de fertilidad para dos países - una línea por país
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group = country)) +
  geom_line()

# series temporales de fertilidad para dos países - líneas coloreadas por país
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country)) +
  geom_line()

#Código: añadir etiquetas de texto a un gráfico

# serie temporal de esperanza de vida - líneas coloreadas por país y etiquetadas, sin leyenda
labels <- data.frame(country = countries, x = c(1975, 1965), y = c(60, 72))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position = "none")