#Una selección de estadísticas de salud y economía mundial del proyecto Gapminder 
#se puede encontrar en el paquete dslabs como data(gapminder).

#La mayoría de las personas tienen conceptos erróneos sobre la salud y la economía mundial, 
#que pueden ser abordados considerando datos reales.

# cargar e inspeccionar datos de gapminder
library(dslabs)
data(gapminder)
head(gapminder)

# comparar la mortalidad infantil en Sri Lanka y Turquía
gapminder %>%
  filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>%
  select(country, infant_mortality)

#Una visión mundial prevalente es que el mundo está dividido en dos grupos de países:
  
#Mundo occidental: alta esperanza de vida, baja tasa de fertilidad.
#Mundo en desarrollo: menor esperanza de vida, mayor tasa de fertilidad.

#Los datos de Gapminder se pueden utilizar para evaluar la validez de esta visión.

#Un gráfico de dispersión de la esperanza de vida frente a la tasa de fertilidad en 
#1962 sugiere que este punto de vista estaba basado en la realidad de hace 50 años. 
#¿Sigue siendo el caso hoy?

# gráfico de dispersión básico de esperanza de vida frente a fertilidad
ds_theme_set() # establecer tema del gráfico
filter(gapminder, year == 1962) %>%
  ggplot(aes(fertility, life_expectancy)) +
  geom_point()

# añadir color como continente
filter(gapminder, year == 1962) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
  geom_point()