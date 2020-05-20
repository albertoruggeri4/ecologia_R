#R_code_snow.r

setwd("C:/Lab")

#new library ncdf4 che permette di vedere i dati con estensione NC
install.packages("ncdf4")

library(ncdf4)
library(raster)

#brick porta diverse bande della riflettanza/ raster una singola banda con tutte le componenti

snowmay <- raster("c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc")

cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)
 
plot(snowmay, col=cl)

###### import snow data #####
#new wd

setwd("C:/Lab/snow")

#da iol lApply, ci sono dei comandi per portare tutti i dati
# put all files into the folder

#nella nostra cartella abbiamo file tif
rlist=list.files(pattern=".tif", full.names=T)

#save raster into list
#con lappy che praticamente non fa altro che applicare una serie di comandi a tutti gli elementi, la funzione è raster, la lista è rlist
list_rast=lapply(rlist, raster)
EN <- stack(list_rast)
plot(EN)

snow.multitemp <- stack(rlist)
snow.multitemp

plot(snow.multitemp, col=cl)

#il 2000 ed il 2010 sono dati simulati

#facciamo il plot della prima e l'ultima -- zlim rappresenta il limmite delle bande (la c per i vettori)

par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl)
plot(snow.multitemp$snow2020r, col=cl)

#- zlim rappresenta il limmite delle bande (la c per i vettori)

par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl,  zlim=c(0,250))
plot(snow.multitemp$snow2020r, col=cl, zlim=c(0,250))

#andiamo a fare una differenza delle due immagini
diffsnow = snow.multitemp$snow2020r - snow.multitemp$snow2000r

cldiff <- colorRampPalette(c('blue', 'white', 'red'))(100)
plot(diffsnow, col=cldiff)

#prediction 
#go to IOL and download preiction.r
#funzione source per caricare UN CODICE dall'esterno
source("prediction.r")

#since the code need time, download pre... from iol
plot(predicted.snow.2025.norm, col=cl)

#con la funz raster lo leghiamo al file scaricato nella cartella snow
predicted.snow.2025.norm <- raster("predicted.snow.2025.norm.tif")

plot(predicted.snow.2025.norm, col=cl)
