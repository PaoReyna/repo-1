#define x y z
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]
z <- scale(x)

#proporción de datos por debajo de 69.5
mean(x <= 69.5)

#calcular cuantiles observados y teóricos
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))

#hacer QQ-plot
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)

#hacer QQ-plot con valores escalados
observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)