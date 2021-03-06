Pakete datasets yra duomenų masyvas longley. Iš šio kintamųjų padarykite tiesinę regresiją, kur prognozuojamas kintamasis būtų GNP, o regresosius Employed. Jums reikia:
  
 1. Įvertinti paprastosios tiesinės regresijos modelį. Pateikti modelio summary ir pakomentuoti ką reiškia gauti skaičiai. Kaip interpretuoti gautus rezultatus?

```{r}
library('datasets')
data.frame(longley$GNP, longley$Employed) # sukuriama lentele is GNP ir Employed
x <- longley$Employed  # x'ui priskiriame Employed
y <- longley$GNP       # y'ui priskiriame GNP
modelis <- lm(y~x)         # sukuriame tiesines regresijos modeli lm, kuriame yra GNP ir Employed
summary(modelis)           # Modelio suvestine
```

Isvesties paaiskinimas :
  
Residuals: is esmes rodo skirtuma, kiek prognozuojami duomenys gali skirtis nuo stebimu.

Coefficients: si isvesties dalis yra apie koeficientus. Teoriskai, paprastoje tiesineje regresijoje, koeficientai yra dvi nezinomos konstantos pateikiancios intercept (-1430.482) ir slope (27.836) terminus tiesineje regresijoje.

Residual standard error: yra tiesines regresijos kokybes matmuo. Teoriskai, kiekviena tiesine regresija turi error termina E. Neimanoma visiskai tiksliai prognozuoti.

Multiple R-squared, Adjusted R-squared: determinacijos koeficientas; R kvadratu statistika nurodo kaip modelis priema esamus duomenis. Visalaika tarp 0 ir 1. Musu atveju R kvadratu yra 0.9674 arba 97% pakitimas, rastas regresoriuje(Employed) gali but paaiskinamas prognozuojanciojo kintamojo(GNP).



2. Padarykite modelio prognozes taškuose 62,65,68.

```{r}
naujasx <- c(62, 65, 68)                          #norimu prognozuoti reiksmiu vektorius
z = predict(modelis, newdata=data.frame(x=naujasx)) #prognozuojamos reiksmes
z                                           #isvedamos prognozuojamos reiksmes
```

3. Išbrėžkite kintamųjų sklaidos diagramą kartu su tiesinės regresijos tiese ir naujomis prognozėmis. Grafiką pateikite su pilna legenda, kurioje būtų nurodyti visi žymėjimai.

```{r}
plot(x,y, xlab="Employed", ylab="GNP")             #grafikas
abline(modelis, col="red")                           #tiesines regresijos tiese
points(naujasx, z, col="purple", pch=17)                 #prognozuojamos reiksmes
legend(x="topleft", legend = c("Tiesines regresijos tiese", "Prognozuotos reiksmes", "Esamos reiksmes"), col = c("red", "purple", "black"), lty = c(1, NA, NA), pch = c(NA, 17, 1), merge = FALSE, cex = 1)#legenda

```


Source : Grupioku pagalba