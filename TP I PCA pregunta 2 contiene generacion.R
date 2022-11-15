##“Clase 02 20221021”##
### Data Mining
### 20221022

outDir<-"./"
getwd()
knitr::opts_chunk$set(echo = TRUE)

install.packages("devtools")
devtools::install_github("rstudio/EDAWR")
library(EDAWR)

library("sqldf")

##masterPath <- "/PCA datos/"

listofpackages <- c( "psych",     "ggplot2",    "knitr",
                     "pastecs",   "FactoMineR", "grid",
                     "gridExtra", "ggfortify",  "factoextra",
                     "corrplot",  "dplyr", "sqldf")
newPackages <- listofpackages[ !(listofpackages %in% installed.packages()[, "Package"])]
if(length(newPackages)) install.packages(newPackages)
for (paquete in listofpackages) {
  suppressMessages(library(paquete, character.only = TRUE))
}



library(readr)
damas <- read_delim("./damas.txt", delim = "\t", 
                    escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                           grouping_mark = ""), trim_ws = TRUE)
View(damas)

#damas$ANCHOJA <- (damas$SUPHOJA/damas$LONANCHO)^0.5
#damas$LARHOJA <- (damas$SUPHOJA/damas$ANCHOJA)

knitr::kable(head(damas))

VAR <- damas$VAR


damasoriginal = damas

damas <- damas [,-1]  

pairs.panels(damas, 
             method = "pearson", # correlation method
             hist.col = "#00AFBB",
             density = TRUE,  # show density plots
             ellipses = F # show correlation ellipses
)


dfInd<-stack(damas)
names(dfInd)<-c("valor","variable")
ggplot(dfInd, aes(x = variable, y = valor)) +
  geom_boxplot()+  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


damas
logdamas <- log(damas)


dfInd<-stack(logdamas)
names(dfInd)<-c("valor","variable")
ggplot(dfInd, aes(x = variable, y = valor)) +
  geom_boxplot()+  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))



##PCA con funciones

damasPCA <- prcomp(as.matrix(damas),center = T, scale. = T)

summary(damasPCA)

plot(damasPCA)



##Matriz de Cargas:
knitr::kable(as.data.frame(unclass(damasPCA$rotation)))


##Datos transformados (primeros registros)
knitr::kable(head(damasPCA$x))



fviz_pca_var(damasPCA, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE # Avoid text overlapping
)


eig.val <- factoextra::get_eigenvalue(damasPCA)
eig.val


fviz_eig(damasPCA, addlabels = TRUE, ylim = c(0, 50))



##################################################################################################
##Pregunta 2: Cuál es la variabilidad explicada por cada componente? Con cuantas sugiere trabajar?
##################################################################################################

summary(damasPCA)


#Si nos guiamos por el criterio de Kaiser (utilizar los componentes proncipales con valores propios mayores a 1) deberíamos tomar los 4 primeros componentes:

  sqldf("select * from [eig.val] where eigenvalue >1 order by eigenvalue desc")

#4 componentes serán difíciles de representar en 2 D (máximo 3D) por lo que nos quedamos con los Componentes que acumulan una variablidad >80%

  sqldf("select * from [eig.val] where eigenvalue >1 and round([cumulative.variance.percent],0) <=80 order by eigenvalue desc")

#El campo variance.percent representa la proporción de variablidad en los datos que se explica a través del componente; en nuestro caso para PC1 a 3 
  # la proporcion de variabilidad es 54.85%; 15.86% y 9.45% respectivamente por lo que los conservamos porque estimamos que nos ayudarán a explicar
  #la mayor cantidad de variabilidad de los datos. Entonces, volviendo al punto antertior en el cual elegíamos según el criterio de Kaiser, podemos
  #observar que la variabilidad marginal (aporte extra) del COmponente PC4 es, además 7.78, bastante menor que el 10% y teniendo el cuenta el acumulado,
  #se decide eliminar.
  
"Analisis"  
  damasPCA  
  
  #El primer Componenete principal tiene asociaciones negativas Con:
    #TAMFLOR, LONGPET, ANCHOPET, LONANCHO, PESOF, LONGF, ANCHOF, ESPESORF, PESOEND, LONGEND, ANCHOEND
  #El segundo Componenete principal tiene asociaciones muy positivas  Con:
    #ANCHOPET(0.4271) y SUPHOJA (0.4818)++
  #En tanto que el tercer componente principal tiene asociación muy positiva con 
    #PECLIMBO (0.7577); siendo que se trata de la relación de tamaño peciolo-limbo (PECLIMBO), podemos vernos tentados a dejar esta Variable; ergo el PC3 fuera del análisis y quedarno con la yunta PC1 / PC2
  
  
  
    