#Puntos clave

#Un gráfico dinamita - un gráfico de barras de promedios de grupos con barras de 
#error que denotan errores estándar - proporciona casi ninguna información sobre 
#una distribución.
#Al mostrar los datos, proporcionas a los espectadores información adicional sobre
#las distribuciones.
#La dispersión aleatoria (jitter) consiste en añadir un pequeño desplazamiento 
#aleatorio a cada punto para minimizar la cantidad de puntos superpuestos. 
#Para añadir dispersión aleatoria, usa la geometría geom_jitter() en lugar de geom_point(). (Ver ejemplo a continuación).
#La mezcla de alfa (alpha blending) consiste en hacer que los puntos sean algo 
#transparentes, ayudando a visualizar la densidad de puntos superpuestos. 
#Añade un argumento alpha a la geometría.
#Código:
# gráfico de puntos mostrando los datos
heights %>% ggplot(aes(sex, height)) + geom_point()

# gráfico de puntos con dispersión aleatoria y mezcla de alfa
heights %>% ggplot(aes(sex, height)) + geom_jitter(width = 0.1, alpha = 0.2)

#Las señales visuales comparadas deben estar adyacentes
#Puntos clave
#Cuando se vayan a comparar dos grupos, es óptimo colocarlos adyacentes en el gráfico.
#Utiliza color para codificar grupos que van a ser comparados.
#Considera usar una paleta amigable para daltónicos como la que se muestra en este video.

color_blind_friendly_cols <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

p1 <- data.frame(x = 1:8, y = 1:8, col = as.character(1:8)) %>%
  ggplot(aes(x, y, color = col)) +
  geom_point(size = 5)
p1 + scale_color_manual(values = color_blind_friendly_cols)