#Puedes modificar argumentos en funciones de geometría distintos de aes() y los datos. 
#Se pueden encontrar argumentos adicionales en la documentación de cada geometría.

#Estos argumentos no son mapeos estéticos: afectan a todos los puntos de datos de la 
#misma manera.

#Los mapeos estéticos globales se aplican a todas las geometrías y se pueden definir 
#cuando inicialmente llamas a ggplot(). Todas las geometrías añadidas como capas tomarán 
#por defecto este mapeo. Los mapeos estéticos locales añaden información adicional o 
#sobrescriben los mapeos por defecto.

#Puedes modificar argumentos en funciones de geometría distintos de aes() y los datos. 
#Se pueden encontrar argumentos adicionales en la documentación de cada geometría.

# cambiar el tamaño de los puntos
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb))

# mover etiquetas de texto ligeramente a la derecha
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)

# simplificar código añadiendo mapeo estético global
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))
p + geom_point(size = 3) +
  geom_text(nudge_x = 1.5)

# los mapeos estéticos locales sobrescriben los globales
p + geom_point(size = 3) +
  geom_text(aes(x=10, y=800, label="Hello there"))