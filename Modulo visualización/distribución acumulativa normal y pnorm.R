#Código: Uso de pnorm para calcular probabilidades
# Dadas alturas masculinas x:
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

#Podemos estimar la probabilidad de que un hombre sea 
#más alto que 70.5 pulgadas con:
1 - pnorm(70.5, mean(x), sd(x))

#Código: Discretización y la aproximación normal
#trazar distribución de alturas exactas en datos
plot(prop.table(table(x)), xlab = "a = Altura en pulgadas", ylab = "Pr(x = a)")

#probabilidades en datos reales en rangos de longitud 1 que contienen un entero
mean(x <= 68.5) - mean(x <= 67.5)
mean(x <= 69.5) - mean(x <= 68.5)
mean(x <= 70.5) - mean(x <= 69.5)

#probabilidades en la aproximación normal coinciden bien
pnorm(68.5, mean(x), sd(x)) - pnorm(67.5, mean(x), sd(x))
pnorm(69.5, mean(x), sd(x)) - pnorm(68.5, mean(x), sd(x))
pnorm(70.5, mean(x), sd(x)) - pnorm(69.5, mean(x), sd(x))

#probabilidades en datos reales en otros rangos no coinciden tan bien con la aprox normal
mean(x <= 70.9) - mean(x <= 70.1)
pnorm(70.9, mean(x), sd(x)) - pnorm(70.1, mean(x), sd(x))