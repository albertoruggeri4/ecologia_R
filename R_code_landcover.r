# R code land cover

### 6. R CODE LAND COVER

# ANALISI LAND COVER

setwd("C:/Lab")

library(raster)
library(RStoolbox)

# AR - Funzione che si chiama brick (impila tutti i dati e importali dentro R). Si utilizzano le virgolette perchè usciamo da R
# AR - p = path r= row dell'immagine landsat scaricata (sud America)
p224r63_2011 <- brick ("p224r63_2011_masked.grd")

# AR - facciamo un plot veloce con le componenti RGB e prima utilizziamo il pacchetto RStoolbox)
# AR - bande di landsat: 1b, 2g, 3r, 4nir
# AR - in questo modo quello che riflette l'infrarosso lo vediamo in ROSSO con r=4
library(RStoolbox)
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# AR - decidiamo di mettere 4 classi, uno agricolo/nudo, uno di vegetazione, uno di vegetazione separativa
# AR - questa funzione la chiamiamo con il nome dell'immagine ma con una c per dire classificato
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=4)

p224r63_2011c #così vediamo tutte le informazioni del raster. (att. $map il $ indica che c'è stata un'unione)

# AR - adesso per plottare la mappa
plot(p224r63_2011c$map)

# AR - per stabilire noi una leggenda, colorRampPalette
clclass <- colorRampPalette(c('red', 'green', 'blue', 'black'))(100)
# AR - per riplottarlo
plot(p224r63_2011c$map, col=clclass)


# AR - rifacciamo lo stesso processo, ma con numero classi ridotto
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=2)
plot(p224r63_2011c$map)

# AR - in funzione del numero di classi, aumenta l'incertezza dell'algoritmo automatico
# AR - Con 2 classi l'incertezza è più bassa che con 4
