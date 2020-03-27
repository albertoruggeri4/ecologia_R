# Multipanel in R: the second lecture of monitoring Ecosystem changes

install.packages("sp")
install.packages("GGally") #this

library(sp) #also require(sp)
library(GGally)


data(meuse) #there is a dataset avaible named meuse

attach(meuse)

#Exercise: see the names of the variable and plot cadmium versus zinc
plot(cadmium,zinc,pch=15,col='red',cex=0.7)

#Exercise: make all the possible paiwis plots of the dataset
#plot(x,cadmium)
#plot(x,zinc) ecc is not a good idea.
#If we use pairs(meuse) we have all combination

pairs(meuse)

#in case we receive the error "the size is too large" reshape with the mouse the graph window

#tilde ~ per poter comparare le variabili

pairs(~cadmium + copper + lead + zinc)


pairs(~cadmium + copper + lead + zinc, data=meuse)

pairs(meuse[,3:6], col = "green", pch=18, cex=0.7)

#GGally package will prettify the graph

ggpairs(meuse[,3:6])
