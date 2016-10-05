## TASK 6

Visų pirma nuskaitome duomenis : 
  
  ```
require (RCurl)

data <- read.csv(text=getURL("https://raw.githubusercontent.com/1vbutkus/Econometrics1/master/task6/R_programing_swirlResults.csv"), stringsAsFactors=FALSE)
```

Pasižiūrime ar visi duomenys nuskaityti ir kokiais tipais nuskaityti : 
  
  ```
class(data)

pavadinimai <- colnames(data)

pavadinimai

class(data$X)

class(data$name)

class(data$takeTime)

class(data$sysUser)

class(data$sysName)

class(data$sysTime)

class(data$user)

class(data$course_name)

class(data$lesson_name)

class(data$question_number)  

class(data$correct)

class(data$attempt)

class(data$datetime)

class(data$skipped)
```

Pastebėjome, kad kai kurie duomenys nuskaityti blogu tipu, todėl iš integer ir charakter tipų keičiame į datos tipą :
  
  ```
data$sysTime <- strptime(data$sysTime,"%Y-%m-%d %H:%M:%S") 

data$datetime <- strptime(data$datetime,"%Y-%m-%d %H:%M:%S")

```

Pastebime, kad duomenys, tokie kaip 'aaa', '1vbutkus', 'testas' yra nereikalingi, nes tai neidentifikuoti studentai, šiais pavadinimais, todėl ištriname šiuos duomenis : 
  
  ```
new.data <- data[( data$user!="1vbutkus" & data$user!="aaa" & data$user!="testas" ),]
```

Pažiūrime naują sudarytą 'data' ar nebėra nereikalingų duomenų : 
  
  ```
table(new.data$user)
```

Dabar pažiūrėsime ar nėra dublikavimose šioje lentelėje : 
  
  ```  
sum(duplicated(new.data)) 
```

Pastebime, kad 3 studentai yra atlikę užduotis/klausimus su skirtingais vardais, todėl kiekvieno studento duomenis sudedame į vis atskirą :
  
  ```
n <- length(new.data[(new.data$user=="j" | new.data$user=="ju" | new.data$user=="juste" | new.data$user=="Juste" ),("user")])

new.data[(new.data$user=="j" | new.data$user=="ju" | new.data$user=="juste" | new.data$user=="Juste" ),("user")]= c(replicate(n,"justinasasnauskaite"))

m <- length(new.data[(new.data$user=="gyse" | new.data$user=="gyse3054" ),("user")])

new.data[(new.data$user=="gyse" | new.data$user=="gyse3054" ),("user")]=c(replicate(m,"gyse3054"))

l <- length(new.data[(new.data$user=="rokasalek" | new.data$user=="rokasaleks" ),("user")])

new.data[(new.data$user=="rokasalek" | new.data$user=="rokasaleks" ),("user")]=c(replicate(l,"rokasaleks"))


``` 

Kai sutvarkėme ir suvienodinome studentų pavadinimus, galime pažiūrėti kas, kiek nepraleido klausimų :
  
  
  ```
no.skipping <- new.data[(new.data$user!="Dariukxas" & new.data$user!="Domante Bulovaite" & new.data$user!="gyse3054" & new.data$user!="Greta" & new.data$user!="gretajes" & new.data$user!="justinasasnauskaite" & new.data$user!="Karolina" & new.data$user!="kestous" & new.data$user!="ogadova" & new.data$user!="ojautakaite" & new.data$user != "Raigardas" & new.data$user!="rokasaleks" & new.data$user!="SandraKozlovskaja" & new.data$user!="simonalevickaite" & new.data$user!="sindeivydas"),]

table(no.skipping$user)

```


Pagal gautus rezultatus jau matosi, kad kai kurių studentų nepraleidimų skirtumai yra labai akivaizdūs, todėl pradedame tikrinti šiuos žmonės, kurie nepraleido mažiausiaiarba iš viso nepraleido : aipe00, edba2903, emru3000, MildaPie, simona333, zagnyte378 :
  
  Taigi sudarėme naują lentelą, kuria pavadinau 'min.skip.data', tai lentelė, kurioje daugiausiai nepraleidusių klausimų studentų vardai ir nepraleistų klausimų kiekis : 
  
  ```
min.skip.data <- new.data[ (new.data$user=="aipe00" | new.data $user=="edba2903" | new.data $user=="emru3000" | new.data $user=="MildaPie" | new.data $user=="simona1234" | new.data $user=="zagnyte"),]

table(min.skip.data$user)
```

Iš tos praeitos lentelės padarome dar vieną lentelę, kurioje įtraukiame ir pamokų pavadinimus ir jų skaičių : 
  
  ```
name.less.data <- data.frame(min.skip.data$user, min.skip.data$lesson_name)

table(name.less.data)
```

Išimame besidubliuojančius duomenis : 
  
  ```
name.less.dublic <- name.less.data[!duplicated(name.less.data), ]

```
Panaudosime vieną funkciją, kurios dėka galime pamatyti kiek, koks studentas atliko užduočių. Gauname, kad aipe00, emru300, simona1234, zagnyte atliko visas 16 užduotis nepraleisdamos.


```
table(name.less.dublic[,1])
```

Kadangi gavome, kad aipe00, emru300, simona1234, zagnyte atliko visas 16 užduotis, mums reikia padaryti naują lentelę be jų, kad galėtumėme pažiūrėti, kas, kiek nepadarė pamokų :
  
  ```
skip.new.data <- new.data[!(new.data$user=="aipe00" | new.data$user=="emru3000" | new.data$user=="simona1234" | new.data$user=="zagnyte"),]

```
Padarome naujos lentelės naujesnį variantą, kuriame nebūtų besidubliuojančių duomenų : 
  
  ```
skip.new.data1 <- data.frame(skip.new.data$user, skip.new.data$lesson_name)

skip.new.data2 <- skip.new.data1[!duplicated(skip.new.data1), ]

```

Pasižiūrime, kiek studentų atliko užduočių iš viso : 
  
  ```
table(skip.new.data2[,1])
```

Patikriname, kiek iš tų padariusių užduotis studentų, praleido klausimų :
  
  ```
skipping <- new.data[(new.data$skipped==TRUE),]

table(skipping$user) 

```



Sources : Ainos Petronytės pagalba ir Agnės Zavackaitės darbu ; 

https://github.com/opetchey/RREEBES/wiki/Reading-data-and-code-from-an-online-github-repository