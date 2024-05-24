#El argumento breaks permite establecer la ubicación de las etiquetas de los ejes y 
#las marcas de graduación.
#La transformación logística o logit se define como  f(p)=log p/1-p o el logaritmo de 
#las probabilidades. Esta escala es útil para resaltar diferencias cerca de 0 o cerca 
#de 1 y convierte cambios proporcionales en aumentos constantes.
#La falacia ecológica es asumir que las conclusiones hechas a partir del promedio de un 
#grupo se aplican a todos los miembros de ese grupo.
# definir gapminder
library(tidyverse)
library(dslabs)
data(gapminder)

# añadir casos adicionales
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))

# definir un dataframe con ingreso promedio del grupo y tasa promedio de supervivencia infantil
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
  group_by(group) %>%
  summarize(income = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income %>% arrange(income)

# gráfico de supervivencia infantil versus ingresos, con ejes transformados
surv_income %>% ggplot(aes(income, infant_survival_rate, label = group, color = group)) +
  scale_x_continuous(trans = "log2", limit = c(0.25, 150)) +
  scale_y_continuous(trans = "logit", limit = c(0.875, .9981),
                     breaks = c(.85, .90, .95, .99, .995, .998)) +
  geom_label(size = 3, show.legend = FALSE)