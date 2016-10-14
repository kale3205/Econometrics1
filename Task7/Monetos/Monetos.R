---
  title: "Monetos"
output: html_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Moneta. Tarkime metama moneta. Jeigu iškrenta herbas, tai laimite $12$ EUR. Jeigu skaičius, tai pralošiate $10$ EUR. Bus žaidžiama $100$ kartų ir gauti rezultatai sumuojami. Kokia tikimybė jums turėti teigiamą balansą po $100$ kartų? Koks balanso pasikliautinis $95%$ intervalas? Kaip atrodo balanso tankis?

```{r}
n <- 1000
balansas <- c(rep(0, times=n))
teigiamasBal <- c(rep(0, times=n))
for (i in 1:n){
  balansas[i] <- sum(sample(c(12, -10), 100, replace=TRUE))
  if (balansas[i] > 0) teigiamasBal <- 1
  else teigiamasBal[i] <- 0 }
mean(teigiamasBal)
mean(balansas) - qt(0.975, df=n-1)*(sd(balansas)/sqrt(n))
mean(balansas) + qt(0.975, df=n-1)*(sd(balansas)/sqrt(n))
plot(density(balansas), main="Tankis")
```

Sources : Kolegu pagalba