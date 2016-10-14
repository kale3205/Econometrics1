---
  title: "CRT"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

CRT. Generuojame $n$ atsitiktinių dydžių turinčių Beta skirstinį su parametrais $\alpha=\beta=0.5$ Iš šių atsitiktinių dydžių suskaičiuojamas aritmetinis vidurkis. Kaip atrodo aritmetinio vidurkio tankis, kai $n=100$?


```{r}
b <- 100000
a <- 100
vidurkis <- replicate(b, mean(rbeta(a, 0.5, 0.5)))
plot(density(vidurkis))

```

Sources : Kolegu pagalba