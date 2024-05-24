#Puntos clave
#Las vacunas salvan millones de vidas, pero la desinformación ha llevado a algunos 
#a cuestionar la seguridad de las vacunas. Los datos apoyan a las vacunas como seguras 
#y efectivas. Visualizamos datos sobre la incidencia del sarampión para demostrar el 
#impacto de los programas de vacunación en la tasa de enfermedades.
#El paquete RColorBrewer ofrece varias paletas de colores. Las paletas de colores 
#secuenciales son las más adecuadas para datos que van de alto a bajo. Las paletas 
#de colores divergentes son las más adecuadas para datos que están centrados y 
#divergen hacia valores altos o bajos.
#La geometría geom_tile() crea una cuadrícula de baldosas de colores.
#La posición y la longitud son indicaciones más fuertes que el color para valores 
#numéricos, pero el color puede ser apropiado en ocasiones.
#Código: Gráfico de baldosas de la tasa de sarampión por año y estado

# importar datos e inspeccionar
library(tidyverse)
library(dslabs)
data(us_contagious_diseases)
str(us_contagious_diseases)

# asignar dat a la tasa por 10,000 de sarampión, quitando Alaska y Hawái y ajustando por semanas reportadas
the_disease <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & disease == the_disease) %>%
  mutate(rate = count / population * 10000 * 52/weeks_reporting) %>%
  mutate(state = reorder(state, rate))

# graficar tasas de enfermedad por año en California
dat %>% filter(state == "California" & !is.na(rate)) %>%
  ggplot(aes(year, rate)) +
  geom_line() +
  ylab("Casos por 10,000") +
  geom_vline(xintercept=1963, col = "blue")

# gráfico de mosaicos de la tasa de enfermedad por estado y año
dat %>% ggplot(aes(year, state, fill=rate)) +
  geom_tile(color = "grey50") +
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_gradientn(colors = RColorBrewer::brewer.pal(9, "Reds"), trans = "sqrt") +
  geom_vline(xintercept = 1963, col = "blue") +
  theme_minimal() + theme(panel.grid = element_blank()) +
  ggtitle(the_disease) +
  ylab("") +
  xlab("")

#Código: Gráfico de líneas de la tasa de sarampión por año y estado

# calcular la tasa media de sarampión en EE.UU. por año
avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE)*10000)

# hacer gráfico de líneas de la tasa de sarampión por año por estado
dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50",
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1, col = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  ggtitle("Cases per 10,000 by state") +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1955, y = 50),
            mapping = aes(x, y, label = "US average"), color = "black") +
  geom_vline(xintercept = 1963, col = "blue")