#Puntos clave

#Cambia el eje y de los gráficos de densidad a conteos de variables usando ..count.. como argumento y.

#La función case_when() define un factor cuyos niveles están definidos por una variedad de operaciones lógicas para agrupar datos.
#Haz gráficos de densidad apilados usando position="stack".

#Define un mapeo estético de peso para cambiar los pesos relativos de los gráficos de densidad - por ejemplo, esto permite ponderar los gráficos por población en lugar de por número de países.


#Código: gráficos de densidad suavizada facetados
# ver el código debajo del video anterior para definiciones de variables

# gráficos de densidad suavizada - el área bajo cada curva suma a 1
gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>% group_by(group) %>%
  summarize(n = n()) %>% knitr::kable()

# gráficos de densidad suavizada - conteos de variables en el eje y
p <- gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = group)) +
  scale_x_continuous(trans = "log2")
p + geom_density(alpha = 0.2, bw = 0.75) + facet_grid(year ~ .)


#Código: añadir nuevos grupos de regiones con case_when
# añadir grupo como factor, agrupando regiones
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))

# reordenar niveles de factores
gapminder <- gapminder %>%
  mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West"))



#Código: gráfico de densidad apilado

# nota que primero debes redefinir p con el nuevo objeto gapminder
p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  ggplot(aes(dollars_per_day, fill = group)) +
  scale_x_continuous(trans = "log2")

# gráfico de densidad apilado
p + geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
  facet_grid(year ~ .)

#Código: gráfico de densidad apilado ponderado

# gráfico de densidad apilado ponderado
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  group_by(year) %>%
  mutate(weight = population/sum(population*2)) %>%
  ungroup() %>%
  ggplot(aes(dollars_per_day, fill = group, weight = weight)) +
  scale_x_continuous(trans = "log2") +
  geom_density(alpha = 0.2, bw = 0.75, position = "stack") + facet_grid(year ~ .)