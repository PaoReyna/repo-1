#El estilo de un gráfico ggplot se puede cambiar utilizando la función theme().
#El paquete ggthemes añade temas adicionales.
#El paquete ggrepel incluye una geometría que repele las etiquetas de texto, 
#asegurando que no se solapen entre sí: geom_text_repel().
#Añdiendo temas

# tema utilizado para gráficos en el libro de texto y el curso
library(dslabs)
ds_theme_set()

# temas de ggthemes
install.packages("ggthemes")
library(ggthemes)
p + theme_economist() # estilo de la revista The Economist
p + theme_fivethirtyeight() # estilo del sitio web FiveThirtyEight

#Código: uniendo todo para ensamblar el gráfico

# cargar librerías
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)

# definir la intersección
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  .$rate

# crear el gráfico, combinando todos los elementos
murders %>%
  ggplot(aes(population/10^6, total, label = abb)) +
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Población en millones (escala logarítmica)") +
  ylab("Número total de asesinatos (escala logarítmica)") +
  ggtitle("Asesinatos por Armas de Fuego en EE.UU. en 2010") +
  scale_color_discrete(name = "Región") +
  theme_economist()

