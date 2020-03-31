#Codici per analisi dei patterns
setwd("C:/Lab")

#importare dati
covid <- read.table("covid_agg.csv", head=T)

head(covid)

# il "$" collega la colonna ad un data set o 
#l'avremmo potuto saltare con attach(covid) e poi plot (country,cases)

plot(covid$country, covid$cases)

#per invertire "las". Con las =0 è di default e rimangono paralleli
plot(covid$country, covid$cases, las=0) #etichette X e Y parallele

plot(covid$country, covid$cases, las=1) #etichette Y orizzontali

plot(covid$country, covid$cases, las=2) #Etichette perpendicolari

plot(covid$country, covid$cases, las=3) #Etichette 


plot(covid$country, covid$cases, las=2, cex.axis= 0.7) #modifica dimensione carattere

install.packages("ggplot2")
install.packages("spatstat")

library("ggplot2")
library("spatstat")

#mpg
data("mpg")
head("mpg")

ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()
ggplot(covid,aes(x=lon,y=lat,size=cases)) + geom_point()

#density
#create dataset for spatstat, c per i vettori/range in questo caso della long e lat
attach(covid) #in modo da allegare il nostro dataset con anche lon e lat
covids <- ppp(lon, lat, c(-180,180), c(-90,90))

d <- density(covids)
plot(d) #andiamo a plottare la densità che abbiamo chiamato d

points(covids) #se vuoi pch puoi aggiungerlo
