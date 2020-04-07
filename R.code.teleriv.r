#Codice R per analisi di immagini satellitari

#packages: raster

library(raster)

#prima di partire con dati dall'esterno, ricordiamoci il settaggio della working directory
setwd("C:/Lab")

#l'immagine che stiamo importando dall'esterno. 
#lo associamo con la funzione brick (dati dall'esterno e lo associa ad un immagine)

p224r63_2011 <- brick("p224r63_2011_masked.grd")

#per vedere i plot dell'immagine. In questo caso abbiamo diverse bande.
#B1 = Blue B2= verde B3= rosso B4..B7
plot(p224r63_2011)
