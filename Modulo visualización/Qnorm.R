#Definición de qnorm
#La función qnorm() proporciona el valor teórico de un cuantil con 
#probabilidad p de observar un valor igual o menor que ese valor cuantil, 
#dada una distribución normal con media μ y desviación estándar σ:

qnorm(p, mu, sigma)

#Por defecto, mμ=0 y σ=1. Por lo tanto, llamar a qnorm() sin argumentos 
#proporciona cuantiles para la distribución normal estándar.

qnorm(p)

#qnorm y pnomr son funciones inversas (una da el resultado de la otra)

pnorm(qnorm(0.025))

#cuantiles teoricos
#Puedes usar qnorm() para determinar los cuantiles teóricos de un conjunto de datos: 
#es decir, el valor teórico de los cuantiles suponiendo que un conjunto de datos sigue 
#una distribución normal. Ejecuta la función qnorm() con las probabilidades deseadas p, 
#la media μ y la desviación estándar σ.
#Supongamos que las alturas masculinas siguen una distribución normal con una media de 
#69 pulgadas y una desviación estándar de 3 pulgadas. Los cuantiles teóricos son:

p <- seq(0.01, 0.99, 0.01)
theoretical_quantiles <- qnorm(p, 69, 3)

