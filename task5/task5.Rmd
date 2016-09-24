## TASK 5


install.packages("prob")

library(prob)

n <- 10^5

S <- replicate(n,sum(sample(1:6, 3, replace = TRUE)))

head(S, 15)


## Teorinis skirstinys


St <- rolldie(3, nsides = 6, makespace = TRUE)

St <- addrv(St, sum = X1 + X2 + X3)

teor <- marginal(St, vars="sum")

teor



##Tankis ir santykinis daznis


cbind(as.data.frame(table(S)/n), teor)

plot(table(S)/n, xlab="Suma", ylab="Tikimybė")

points(teor, col=2)


## Vidurkis ir dispersija


average <- sum(teor$probs * teor$sum)

average


disp <- sum(teor$probs * (teor$sum-average)^2)

disp


plot(cumsum(S)/1:n, type="l", xlab="n", ylab = "S / n", main="Vidurkio artėjimas į teorinį")

abline(h=average, col=2)


a=S*0

for(i in 1:10000){
  a[i]=var(S[1:i])
}

plot(a[1:10000], type="l", xlab="n", ylab="varS", main="Dispersijos artėjimas į teorinę")

abline(h=disp, col=2)


## Sources


https://cran.r-project.org/web/packages/IPSUR/vignettes/IPSUR.pdf

http://stackoverflow.com/questions/14820203/simulating-rolling-two-dice

http://ditraglia.com/Econ103Public/Rtutorials/Rtutorial4.html

https://cran.r-project.org/web/packages/dice/dice.pdf

https://cran.r-project.org/web/packages/prob/vignettes/prob.pdf

Emilija Rudytė

Simona Gritytė, Orinta Jautakaitė, Sandra Kozlovskaja, Agnė Zavackaitė
