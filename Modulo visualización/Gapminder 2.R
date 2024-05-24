#Puntos clave

#Usa intersect() para encontrar la intersección entre dos vectores.

#Para hacer diagramas de caja donde las variables agrupadas son adyacentes, colorea el diagrama de caja por un factor en lugar de facetar por ese factor. Esto facilita las comparaciones.

#Los datos sugieren que la brecha de ingresos entre los países ricos y pobres se ha estrechado, no expandido.


#Código: histograma de ingresos en el mundo occidental versus en desarrollo, 1970 y 2010

# añadir variable de dólares por día y definir año pasado
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970

# definir países occidentales
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

# facetar por Oeste versus desarrollo
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ group)

# facetar por Oeste/desarrollo y año
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

#Código: distribución de ingresos del mundo occidental versus en desarrollo, solo países con datos
# definir países que tienen datos disponibles en ambos años
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1, country_list_2)

# hacer histograma incluyendo solo países con datos disponibles en ambos años
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

#Código: Diagramas de caja de ingresos en el mundo occidental versus en desarrollo, 1970 y 2010

p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + scale_y_continuous(trans = "log2")

p + geom_boxplot(aes(region, dollars_per_day, fill = continent)) +
  facet_grid(year ~ .)

# organizar diagramas de caja coincidentes uno al lado del otro, coloreados por año
p + geom_boxplot(aes(region, dollars_per_day, fill = factor(year)))