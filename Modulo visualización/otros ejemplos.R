#geom_histogram() crea un histograma. Utiliza el argumento binwidth para cambiar el 
#ancho de las barras, fill para cambiar el color de relleno de las barras y col para 
#cambiar el color del contorno de las barras.

#geom_density() crea gráficos de densidad suavizados. 
#Cambia el color de relleno del gráfico con el argumento fill.

#geom_qq() crea un gráfico cuantil-cuantil. Esta geometría requiere el argumento sample. 
#Por defecto, los datos se comparan con una distribución normal estándar con una media de 0 
#y una desviación estándar de 1. Esto se puede cambiar con el argumento dparams, 
#o los datos de muestra pueden escalarse.

#Los gráficos se pueden organizar adyacentes entre sí utilizando la función grid.arrange() 
#del paquete gridExtra. Primero, crea los gráficos y guárdalos en objetos (p1, p2, ...). 
#Luego, pasa los objetos de gráficos a grid.arrange().



#Código: histogramas en ggplot2
# cargar datos de alturas
library(tidyverse)
library(dslabs)
data(heights)

# definir p
p <- heights %>%
  filter(sex == "Male") %>%
  ggplot(aes(x = height))
# histogramas básicos
p + geom_histogram()
p + geom_histogram(binwidth = 1)

# histograma con relleno azul, contorno negro, etiquetas y título
p + geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  xlab("Alturas masculinas en pulgadas") +
  ggtitle("Histograma")

#Código: gráficos de densidad suavizada en ggplot2
p + geom_density()
p + geom_density(fill = "blue")

#Código: gráficos cuantil-cuantil en ggplot2
# gráfico QQ básico
p <- heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = height))
p + geom_qq()

# gráfico QQ contra una distribución normal con la misma media/desviación estándar que los datos
params <- heights %>%
  filter(sex == "Male") %>%
  summarize(mean = mean(height), sd = sd(height))
p + geom_qq(dparams = params) +
  geom_abline()

# gráfico QQ de datos escalados contra la distribución normal estándar
heights %>%
  ggplot(aes(sample = scale(height))) +
  geom_qq() +
  geom_abline()

#Código: rejillas de gráficos con el paquete grid
# definir gráficos p1, p2, p3
p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")

# organizar gráficos uno al lado del otro en 1 fila, 3 columnas
library(gridExtra)
grid.arrange(p1, p2, p3, ncol = 3)
