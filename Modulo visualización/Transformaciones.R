#Puntos clave

#Utilizamos datos del PIB para calcular ingresos en dólares estadounidenses por día, 
#ajustados por inflación.

#Las transformaciones logarítmicas convierten cambios multiplicativos en cambios aditivos.

#Las transformaciones comunes son la transformación logarítmica base 2 y la base 10. 
#La elección de la base depende del rango de los datos. No se recomienda el logaritmo 
#natural para la visualización porque es difícil de interpretar.

#La moda de una distribución es el valor con la frecuencia más alta. La moda de una 
#distribución normal es el promedio. Una distribución puede tener múltiples modas locales.

#Hay dos formas de usar transformaciones logarítmicas en gráficos: transformar los datos 
#antes de graficar o transformar los ejes del gráfico. Las escalas logarítmicas tienen la 
#ventaja de mostrar los valores originales como etiquetas de los ejes, mientras que los 
#valores transformados facilitan la interpretación de valores intermedios entre etiquetas.

#Escala el “eje x” usando las capas scale_x_continuous() o scale_x_log10() en ggplot2. 
#Funciones similares existen para el “eje y”.

#En 1970 la distribución de ingresos es bimodal, consistente con la visión del mundo 
#dicotómica de Occidente versus el mundo en desarrollo.

#Nota: En el video, cuando se afirma que el valor desconocido en la escala logarítmica es 
#igual a 10^1.5, en realidad debería ser 10^0.5.

# añadir variable de dólares por día
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

# histograma de dólares por día
past_year <- 1970
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")

# repetir histograma con datos escalados log2
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")

# repetir histograma con eje x escalado log2
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")