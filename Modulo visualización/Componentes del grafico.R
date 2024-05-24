#Los gráficos en ggplot2 consisten en 3 componentes principales:
  
#Datos: El conjunto de datos que se está resumiendo.
#Geometría: El tipo de gráfico (gráfico de puntos, diagrama de caja, 
#gráfico de barras, histograma, qqplot, densidad suavizada, etc.)
#Mapeo estético: Variables mapeadas a señales visuales, como valores 
#del “eje x” y “eje y” y color.

#Hay componentes adicionales:
#Escala
#Etiquetas, Título, Leyenda
#Tema/Estilo

#Puedes asociar un conjunto de datos x con un objeto ggplot con 
#cualquiera de los 3 comandos:

ggplot(data = x)
ggplot(x)
x %>% ggplot()

#Puedes asignar un objeto ggplot a una variable. Si el objeto no se asigna a una 
#variable, se mostrará automáticamente.
#Puedes mostrar un objeto ggplot asignado a una variable imprimiendo esa variable.

library(tidyverse)
library(dslabs)
data(murders)

ggplot(data = murders)
murders %>% ggplot()
p <- ggplot(data = murders)
class(p)
print(p) # esto es equivalente a simplemente escribir p
p