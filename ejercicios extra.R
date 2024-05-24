#Modify the tile plot to show the rate of 
#smallpox cases instead of measles cases.
#Exclude years in which cases were reported 
#in fewer than 10 weeks from the plot.

library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(dslabs)
data(us_contagious_diseases)

the_disease = "Smallpox"
dat <- us_contagious_diseases %>% 
  filter(!state%in%c("Hawaii","Alaska") & disease == the_disease & weeks_reporting >= 10) %>% 
  mutate(rate = count / population * 10000) %>% 
  mutate(state = reorder(state, rate))

dat %>% ggplot(aes(year, state, fill = rate)) + 
  geom_tile(color = "grey50") + 
  scale_x_continuous(expand=c(0,0)) + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") + 
  theme_minimal() + 
  theme(panel.grid = element_blank()) + 
  ggtitle(the_disease) + 
  ylab("") + 
  xlab("")


#El código de muestra proporcionado crea un gráfico 
#de serie temporal que muestra la tasa de 
#casos de sarampión por población por estado. Vamos a 
#modificar nuevamente este gráfico para observar los 
#casos de viruela.

#Modifique el código de ejemplo del gráfico de series 
#temporales para representar datos de viruela en lugar 
#de sarampión.
#Una vez más, restrinja el gráfico a años en los que 
#los casos se informaron en al menos 10 semanas.

library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

the_disease = "Measles"
dat <- us_contagious_diseases %>%
  filter(!state%in%c("Hawaii","Alaska") & disease == the_disease) %>%
  mutate(rate = count / population * 10000) %>%
  mutate(state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease==the_disease) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm=TRUE)/sum(population, na.rm=TRUE)*10000)

dat %>% ggplot() +
  geom_line(aes(year, rate, group = state),  color = "grey50", 
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate),  data = avg, size = 1, color = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5,25,125,300)) + 
  ggtitle("Cases per 10,000 by state") + 
  xlab("") + 
  ylab("") +
  geom_text(data = data.frame(x=1955, y=50), mapping = aes(x, y, label="US average"), color="black") + 
  geom_vline(xintercept=1963, col = "blue")


#con las modificaciones
the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state%in%c("Hawaii","Alaska") & disease == the_disease & weeks_reporting >= 10) %>%
  mutate(rate = count / population * 10000) %>%
  mutate(state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease==the_disease) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm=TRUE)/sum(population, na.rm=TRUE)*10000)

dat %>% ggplot() +
  geom_line(aes(year, rate, group = state),  color = "grey50", 
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate),  data = avg, size = 1, color = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5,25,125,300)) + 
  ggtitle("Cases per 10,000 by state") + 
  xlab("") + 
  ylab("") +
  geom_text(data = data.frame(x=1955, y=50), mapping = aes(x, y, label="US average"), color="black") + 
  geom_vline(xintercept=1963, col = "blue")


#Ahora vamos a ver las tasas de todas las enfermedades en un estado. 
#Nuevamente, modificará el código de muestra para producir el gráfico deseado.

#Para el estado de California, haga un gráfico de series de tiempo que muestre 
#las tasas de todas las enfermedades.
#Incluya sólo los años con informes de 10 o más semanas.
#Utilice un color diferente para cada enfermedad.
#Incluya su aesfunción dentro de ggplotsu capa en lugar de dentro de ella geom.

library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

us_contagious_diseases %>% filter(state=="California") %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year, rate)) + 
  geom_line()

#Modificado
us_contagious_diseases %>% filter(state=="California" & weeks_reporting >= 10) %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year, rate, color=disease)) + 
  geom_line(aes(year, rate, color=disease))


#Ejercicio 4: Gráfico de series temporales: todas las enfermedades en los 
#Estados Unidos
#Ahora vamos a hacer un gráfico de series temporales de las tasas de todas 
#las enfermedades en los Estados Unidos. Para este ejercicio, proporcionamos 
#menos código de muestra; puede consultar el ejercicio anterior para comenzar.

#Calcule la tasa de EE. UU. usando summarizepara sumar los estados. 
#Llame a la variable rate.
#La tasa estadounidense para cada enfermedad será el número total de 
#casos dividido por la población total.
#Recuerde convertir a casos por 10.000.
#Deberá filtrar para !is.na(population)obtener todos los datos.
#Traza cada enfermedad en un color diferente.


library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)
us_contagious_diseases

