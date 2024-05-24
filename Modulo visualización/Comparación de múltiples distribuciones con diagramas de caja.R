#Puntos clave

#Haz diagramas de caja estratificados por una variable categórica utilizando la 
#geometría geom_boxplot().

#Rota las etiquetas de los ejes cambiando el tema a través de element_text(). 
#Puedes cambiar el ángulo y la justificación de las etiquetas de texto.

#Considera ordenar tus factores por un valor significativo con la función reorder(), 
#que cambia el orden de los niveles del factor basado en un vector numérico relacionado. 
#Esto facilita las comparaciones.

#Muestra los datos agregando puntos de datos al diagrama de caja con una capa geom_point(). 
#Esto añade información más allá del resumen de cinco números a tu gráfico, 
#pero demasiados puntos de datos pueden oscurecer tu mensaje

#Código: diagrama de caja del PIB por región
# añadir variable de dólares por día
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

# número de regiones
length(levels(gapminder$region))

# diagrama de caja del PIB por región en 1970
past_year <- 1970
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day))
p + geom_boxplot()

# rotar nombres en el eje x
p + geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))



#Código: la función reorder
# por defecto, el orden de los factores es alfabético
fac <- factor(c("Asia", "Asia", "West", "West", "West"))
levels(fac)

# reordenar el factor por las medias de las categorías
value <- c(10, 11, 12, 6, 4)
fac <- reorder(fac, value, FUN = mean)
levels(fac)






#Código: diagrama de caja mejorado ordenado por ingreso medio, escalado y mostrando datos

# reordenar por ingreso medio y colorear por continente
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>% # reordenar
  ggplot(aes(region, dollars_per_day, fill = continent)) + # colorear por continente
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
p

# escalar el eje y en log2
p + scale_y_continuous(trans = "log2")

# añadir puntos de datos
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE)