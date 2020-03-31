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
