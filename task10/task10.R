Uzduotis skirta ismokti tikrinti paprasta statistine hipoteze ir suprasti jos rezultatus.

a) Tegul $x_1, ..., X_{100} \sim N(1, 2)$. Susigeneruokite tokia imti ir patikrinkite nuline hipoteze, kad $H_0: \mu=1$, su alternatyva, kad $\mu\neq 1$. Tam rekalinga funkcija t.test. Detaliai paaiskinkite ka reiskia funkcijos isvestyje pateikti skaiciai.


```{r}
sampl <- rnorm(100, mean=1, sd=sqrt(2))
t.test(sampl, mu=1)
```
Funkcijos t.test gautame rezultate parodo, kad p reiksme p-value parodo ar bus atmetama ar neatmetame nuline hipoteze. Hipoteze reikia tikrinti su reiksmingumo lygmeniu 0,05, tai nuline hipoteze bus atmetama jei p-value < 0,05.Sioje uzduotyje nuline hipoteze μ=1 neatmetama.
Pagal 95% pasikliautina intervala jei patenka reiksme miu=1, tai tada nuline hipoteze neatmetama.

b) Kartokite a) dalies generavima daug kartu (pvz.10^4) ir suskaiciuokite kiek atveju buvo atmesta nuline hipoteze? Isreiskite si skaiciu procentais. Kokia isvada galite padaryti?

```{r}
fnct <- function() {
  sampl <- rnorm(100, mean=1, sd=sqrt(2))
  ttest <- t.test(sampl, mu=1)
  return(ttest$p.value < 0.05)
}

sampl2 <- replicate(10^4, fnct())
mean(sampl2)

```

5proc. nuline hipoteze atmetama.Hipoteze buvo tikrinama su reiksmingumo lygmeniu 0.05, tai tuo atveju tikimybe atmesti teisinga nuline hipoteze yra 0.05.



Source : https://www.r-bloggers.com/hypothesis-testing-on-normally-distributed-data-in-r/
  Grupioku pagalba.