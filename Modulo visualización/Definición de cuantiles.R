#Dado un conjunto de datos data y un cuantil deseado q, 
#puedes encontrar el cuantil q-ésimo de data con:
quantile(data,q)

#Percentiles

#Los percentiles son los cuantiles que dividen un conjunto de datos en 100 intervalos,
#cada uno con una probabilidad del 1%. Puedes determinar todos los percentiles de un 
#conjunto de datos “data” de esta manera:
  
p <- seq(0.01, 0.99, 0.01)
quantile(data, p)

#Cuartiles

#Los cuartiles dividen un conjunto de datos en 4 partes, cada una con un 25% de 
#probabilidad. Son iguales a los percentiles 25, 50 y 75. El percentil 25 también 
#se conoce como el primer cuartil, el percentil 50 también se conoce como la mediana 
#y el percentil 75 también se conoce como el tercer cuartil.

#La función summary() devuelve el mínimo, cuartiles y máximo de un vector.

#carga el conjunto de datos de alturas del paquete dslabs:
library(dslabs)
data(heights)

#Usa summary() en la variable heights$height para encontrar los cuartiles:
summary(heights$height)

#Encuentra los percentiles de heights$height:
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile(heights$height, p)

#Confirma que los percentiles 25 y 75 coinciden con los cuartiles 1 y 3. 
#Ten en cuenta que quantile() devuelve un vector nombrado. 
#Puedes acceder a los percentiles 25 y 75 de esta manera 
#(adapta el código para otros valores de percentiles):
percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

