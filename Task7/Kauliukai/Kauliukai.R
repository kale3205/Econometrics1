---
  title: "Kauliukai"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


Du žaidėjai žaidžia tokį žaidimą. Pirmasis žaidėjas meta tris kauliukus ir fiksuoja iškritusių taškų sumą. Antrasis žaidėjas ridena du kauliukus ir skaičiuoja iškritusių taškų sumą. Laimi tas žaidėjas, kurio taškų suma yra didesnė. Jeigu taškų sumos yra lygios, tai ekspermentas kartojamas iš naujo (ir taip kartojama tol, kol galiausiai nustatomas laimėtojas). Kokia tikimybė laimėti pirmajam žaidėjui?


```{r}
n = 1000
i = 1
pirmasis <- c(rep(0, times = n))
antrasis <- c(rep(0, times = n))
laimi <- c(rep(0, times = n))
while (i<n+1) {
  pirmasis[i] <- sum(sample(1:6, 3, replace = TRUE))
  antrasis[i] <- sum(sample(1:6, 2, replace = TRUE))
  if(pirmasis[i] > antrasis[i]){
    laimi[i] <- 1
    i= i+1}
  else if (pirmasis[i] < antrasis[i]){
    laimi[i] <- 0
    i = i+1}
  else i=i
}
tikimybe_laim_pirmam <- mean(laimi)
tikimybe_laim_pirmam

```

Sources : Kolegu pagalba