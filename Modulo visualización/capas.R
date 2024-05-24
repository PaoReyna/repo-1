#En ggplot2, los gráficos se crean agregando capas al objeto ggplot:
DATA %>% ggplot() + CAPA_1 + CAPA_2 + ... + CAPA_N

#La capa de geometría define el tipo de gráfico y toma el formato geom_X 
#donde X es el tipo de gráfico.

#Los mapeos estéticos describen cómo las propiedades de los datos se conectan 
#con características del gráfico (posición del eje, color, tamaño, etc.). 
#Define mapeos estéticos con la función aes().

#aes() usa nombres de variables del componente de objeto 
#(por ejemplo, total en lugar de murders$total).

#geom_point() crea un gráfico de puntos y requiere mapeos estéticos x e y.

#geom_text() y geom_label() añaden texto a un gráfico de puntos y 
#requieren mapeos estéticos x, y y label.

#Para determinar qué mapeos estéticos son necesarios para una geometría, 
#lee el archivo de ayuda para esa geometría.

#Puedes agregar capas con diferentes mapeos estéticos al mismo gráfico.

library(tidyverse)
library(dslabs)
data(murders)

murders %>% ggplot() +
  geom_point(aes(x = population/10^6, y = total))

# agregar capa de puntos a objeto ggplot predefinido

p <- ggplot(data = murders)
p + geom_point(aes(population/10^6, total))

# agregar capa de texto a gráfico de puntos

p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))

# no hay error en esta llamada

p_test <- p + geom_text(aes(population/10^6, total, label = abb))

# error - "abb" no es una variable globalmente definida y no se puede 
#encontrar fuera de aes

p_test <- p + geom_text(aes(population/10^6, total), label = abb)
