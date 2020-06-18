#Codice R per analisi di immagini satellitari

##### 5. R_CODE_TELERIV

#   AR - CODICE R PER L'ANALISI DI IMMAGINI SATELLITARI
    
#   AR -  PACCHETTI UTILIZZATI: "raster", "RStoolbox"

# install.packages("raster")
# install.packages("RStoolbox")
library(raster)
library(RStoolbox)

setwd("C:/Lab")

#   AR -  FUNZIONE brick() PER IMPORTARE DATI DALL'ESTERNO E ASSOCIARLI AD UNA CERTA IMMAGINE
#   AR - BRICK --> IMPORTA TUTTE LE BANDE // RASTER --> SOLO UNA BANDA
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)

# B1: blue
# B2: green
# B3: red
# B4: near infrared (nir)
# B5: medium infrared
# B6: thermal infrared
# B7: medium infrared

#  AR -  SALVARE L'.RData

#  AR -  FUNZIONE load("") PER RICARICARE L'.RData
load("teleril.RData")
ls()


plot(p224r63_2011)

cl <- colorRampPalette(c('black','grey','light grey'))(100) 
plot(p224r63_2011, col=cl)
    
#  AR -  ESERCIZIO: plottare l'immagine con una palette differente
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) 

#   AR - NOTE: la funzione attach(dataframe) non è utilizzabile con il pacchetto raster
#  AR -  "$" LEGA LA COLONNA (LA BANDA) AL DATASET (IMMAGINE SATELLITARE) (es. p224r63$B1_sre)
plot(p224r63_2011$B1_sre, col=clb)

#ESERCIZIO: plottare la banda del NIR con colorRampPalette che varia dal rosso all'arancione al giallo
clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(p224r63_2011$B4_sre, col=clnir)

#   AR - MULTIFRAME con 4 bande (blu, rosso, verde, nir(
par(mfrow=c(2,2))
# blue
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)
# green
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B1_sre, col=clg)
# red
clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B1_sre, col=clr)
# nir
clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(p224r63_2011$B4_sre, col=clnir)

dev.off()

#   AR - NATURAL COLOR:
#  AR -  tre bande: R= banda del rosso, G= banda del verde, B= banda del blu
plotRGB(p224r63_2011, r=3, g=2, b=1) # plotRGB: no!

#  AR -  STRETCH DEI COLORI CON TIPOLOGIA Lineare ("Lin")
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

#   AR - FALSE COLOR (andiamo ad introdurre la banda nir, non visibile ad occhio nudo)
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#   AR - FUNZIONE pdf""() PER SALVARE L'IMMAGINE IN PDF
pdf("primo_grafico")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

dev.off()
    
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#   AR - ESERCIZIO: nir nella componente green
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
#   AR - ESERCIZIO2: nir nella componente blue
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")


### GIORNO 2

setwd("C:/Lab") 

library(raster)
load("teleril.RData")
ls()

p224r63_1988 <- brick("p224r63_1988_masked.grd")
plot(p224r63_1988)

    
# B1: blue
# B2: green
# B3: red
# B4: near infrared (nir)
# B5: medium infrared
# B6: thermal infrared
# B7: medium infrared

par(mfrow=c(2,2))
# blue
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_1988$B1_sre, col=clb)
# green
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_1988$B1_sre, col=clg)
# red
clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_1988$B1_sre, col=clr)
# nir
clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(p224r63_1988$B4_sre, col=clnir)


dev.off()

    
# B1: blue - 1
# B2: green - 2
# B3: red - 3
# B4: near infrared (nir) - 4

# NATURAL COLOR
# tre componenti: R G B
# tre bande: R= banda del rosso, G= banda del verde, B= banda del blu
plotRGB(p224r63_1988, r=3, g=2, b=1)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")

#   AR - ESERCIZIO: plottare l'immagine usando il sensore nir al posto della componente r nello spazio RGB
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

#   AR - PLOTTARE LE IMMAGINI DEL 1988 E DEL 2011 PER ANALIZZARE I CAMBIAMENTI
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

dev.off()

#  AR -  SPECTRAL INDICES
#  AR -  dvi1988 = nir1988 - red1988
dvi1988 <- p224r63_1988$B4_sre - p224r63_1988$B3_sre

plot(dvi1988)
#   AR - ESERCIZIO: plottare l'indice dvi per il 2011
#   AR - dvi2011 = nir2011 - red2011
dvi2011 <- p224r63_2011$B4_sre - p224r63_2011$B3_sre

plot(dvi2011)

dev.off()

cldvi <- colorRampPalette(c('light blue','light green','green'))(100) 
plot(dvi2011, col=cldvi)

#   AR - MULTITEMPORAL ANALYSIS
difdvi <- dvi2011 - dvi1988
plot(difdvi)

cldifdvi <- colorRampPalette(c('red','white','blue'))(100)  
plot(difdvi, col=cldifdvi)

dev.off()

#  AR -  VISUALIZZARE GLI OUTPUTS
#  AR -  multiframe 1988rgb, 2011rgb, difdvi
par(mfrow=c(3,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plot(difdvi, col=cldifdvi)

dev.off()

#  AR -  RICAMPIONARE L'IMMAGINE DEL 2011
p224r63_2011lr <- aggregate(p224r63_2011, fact=10)


par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
dev.off()

#   AR - LOWER RESOLUTION
p224r63_2011lr50 <- aggregate(p224r63_2011, fact=50)
# original 30m <- resampled 1500m 

#   AR - PLOT DELLE TRE IMMAGINI CON RISOLUZIONI DIVERSE
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr50, r=4, g=3, b=2, stretch="Lin")

dev.off()
    
#   AR - CALCOLARE IL dvi2011lr50
dvi2011lr50 <- p224r63_2011lr50$B4_sre - p224r63_2011lr50$B3_sre
plot(dvi2011lr50)

dev.off()

#  AR -  RICAMPIONARE L'IMMAGINE DEL 1988
p224r63_1988lr50 <- aggregate(p224r63_1988, fact=50)

#   AR - CALCOLARE IL dvi1988lr50
dvi1988lr50 <- p224r63_1988lr50$B4_sre - p224r63_1988lr50$B3_sre
plot(dvi1988lr50)

#  AR -  multitemporal analysis lr50 (low resolution)
difdvilr50 <- dvi2011lr50 - dvi1988lr50
plot(difdvilr50)

plot(difdvilr50,col=cldifdvi)

dev.off()

#   AR - PLOTTARE LA difdvi (ad alta definizione) CON LA difdvilr50 (a bassa risoluzione)
par(mfrow=c(2,1))
plot(difdvi, col=cldifdvi)
plot(difdvilr50, col=cldifdvi)
    
dev.off()
