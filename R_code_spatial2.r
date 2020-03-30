#installa prima se la carica  
library("sp")

#dati da usare
data(meuse)

head(meuse)

#coordinate del dataset (per raggruppare il gruppo --> la tilde)
coordinates(meuse)=~x+y

#spplot dei dati di zinco (fatto già in spatial 1), ricordati " per le variabili)
spplot(meuse,"zinc")

#un'altra possibilità per vedere i nomi dei meuse è names
names(meuse)

#osserva la concentrazione sia per lo zinco precedente ed ora per il rame sulla parte sx del fiume
spplot(meuse,"copper")

#funzione bubble sempre su sp, stesso plottaggio precedente,
bubble(meuse,"zinc")

#foraminiferi (Sofia), carbon capture (Marco)
#array
foram <- c(10, 20, 35, 55, 67, 80)
carbon <- c(5, 15, 30, 70, 85, 99)
plot(foram, carbon, col="green",pch=1)

#dati dall'esterno sul covid-19
#cartella da creare su Windows: percorso:\lab
setwd("C:/Lab")

#leggere la tabella, se c'è il titolo si mette HEAD= T/TRUE o al contrario F/FALSE
covid <- read.table("covid_agg.csv", head= TRUE)
