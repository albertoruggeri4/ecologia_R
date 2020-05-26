# R code Patches

install.packages("raster")
library(raster)
install.packages("igraph")
library(igraph)
install.packages("ggplot2")
library(ggplot2)

# per entrare nella cartella di lavoro
setwd("D:/Lab") # windows

# per importare le due immagini
d1c <- raster("d1c.tif")
d2c <- raster("d2c.tif")

# plottare le due immagini 
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d2c,col=cl)

# riclassificazione della prima immagine
# land cover 1= agriculture; land cover 2=forest
d1c.for <- reclassify(d1c, cbind(1, NA))

# plottare l'immagine riclassificata con l'immagine originale
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d1c.for,col=cl)

dev.off()

# riclassificazione della seconda immagine
d2c.for <- reclassify(d2c, cbind(1, NA))

# plottare le due immagini riclassificate 
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c.for,col=cl)
plot(d2c.for,col=cl)

dev.off()

# funzione clump aggrage i pixels vicini per formare un'unica patche
d1c.for.patches <- clump(d1c.for)
d2c.for.patches <- clump(d2c.for)

# plottare le due immagini riclassificate 
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c.for.patches,col=cl)
plot(d2c.for.patches,col=cl)

# per salvare il raster nella cartella di lavoro
writeRaster(d1c.for.patches, "d1c.for.patches.tif")
writeRaster(d2c.for.patches, "d2c.for.patches.tif")

#Exercise: plottare con un'altra color palette
clp <- colorRampPalette(c('dark blue','blue','green','orange','yellow','red'))(100) # 
par(mfrow=c(1,2))
plot(d1c.for.patches, col=clp)
plot(d2c.for.patches, col=clp)

# max patches d1 = 301
# max patches d2 = 1212

# analisi multitemporale del numero di patches
time <- c("Before deforestation","After deforestation")
npatches <- c(301,1212)

output <- data.frame(time,npatches)
attach(output)

ggplot(output, aes(x=time, y=npatches, color="red")) + geom_bar(stat="identity", fill="white")

