# PRIMO CODICE R ECOLOGIA DEL PAESAGGIO
library (sp)
# in alternativa require(sp)

data(meuse)
meuse # tutte le informazioni

#solo le prime 6
head (meuse) 

#nomi variabili
name (meuse) 

#altre informazioni come media, valore massimo, mediana
summary (meuse) 

#mostra grafico di correlazione tra le variabili in ballo:
pairs (meuse)

#permette di visualizzare solo le variabili di nostro interesse. occorre fare la tilde "=", 
#la virgola è separatore di argomenti a funzione. cadmium/copper/lead uniche che teniamo in meuse
pairs(~ cadmium + copper + lead , data = meuse)

#richiamo names
names(meuse)

#esercizio rifaccio pairs mettendo cadium, copper, leaad e zinc
pairs(~ cadmium + copper + lead + zinc, data = meuse)

#in questo caso prendo un subset "[]" partendo da (",") colonna 3 a colonna 6(":"). Ci darà grafico uguale a prima
pairs(meuse[,3:6])

#per cambiare colore funzioni: "col"=red" o altri colori
pairs(meuse[,3:6], col="blue")

#per cambiare tipo di caratteri uso "point character
#ne esistono vari tipi: su "Google immagini"- point character, prendi il numero del simbolo ci sono diversi
pairs(meuse[,3:6], col="blue", pch=17)

#per cambiare dimensione punti uso argomento a funzione "character exageration"/ se cex=1 non cambia nulla
pairs(meuse[,3:6], col="blue", pch=17, cex=3)

#titolo al grafico: "main="
pairs(meuse[,3:6], col="blue", pch=17, cex=3, main="Primo pairs")

#ESERCIZIO inserire la variabile elevation

pairs(meuse[,3:7], col="blue", pch=17, cex=3, main="Primo pairs")


panel.correlations <- function(x, y, digits=1, prefix="", cex.cor)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r1=cor(x,y,use="pairwise.complete.obs")
    r <- abs(cor(x, y,use="pairwise.complete.obs"))

 

    txt <- format(c(r1, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex <- 0.9/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex * r)
}

 

panel.smoothing <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),
    cex = 1, col.smooth = "red", span = 2/3, iter = 3, ...)
{
    points(x, y, pch = pch, col = col, bg = bg, cex = cex)
    ok <- is.finite(x) & is.finite(y)
    if (any(ok))
        lines(stats::lowess(x[ok], y[ok], f = span, iter = iter),
            col = 1, ...)
}

 


panel.histograms <- function(x, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
}

#"lowess" è smooter locale: uso linea per mostrare relazione tra variabili
#"histograms" fa istogramma variabili

# "lower.panel" è parte inferiore del grafico pairs e decido cosa metterci, ad es. le correlazioni
# "upper.panel" è parte superiore e ci metto lo smoothing, ossia il grafico dei punti con le linee di correlazione
# "diag.panel" è diagonale e ci metto gli istogrammi

pairs(meuse[,3:6], lower.panel = panel.correlations, upper.panel = panel.smoothing, diag.panel = panel.histograms)

#Esercizio. mettere nel lower lo smoothing e nell'upper le correlation
pairs(meuse[,3:6], lower.panel = panel.smoothing, upper.panel = panel.correlations, diag.panel = panel.histograms)

plot(meuse$cadmium, meuse$copper)
#cercalo, ma non serve tanto conviene utilizzare la funzione attach(meuse)

attach(meuse)
plot(cadmium, copper)

#xlab e ylab cambiano il nome alle variabili
plot(cadmium, copper, pch=19, col="green", main="Primo plot", xlab="cadmio", ylab="rame")

#argomento che esagera i caratteri delle lables e cambio punti
plot(cadmium, copper, pch=19, col="green", main="Primo plot", xlab="cadmio", ylab="rame", cex.lab=1.5, cex=2)


plot(cadmium, copper, pch=19, col="green", main="Primo plot", xlab="cadmio", ylab="rame")
#con la funzione plot chiamiamo solo le due varibaili
