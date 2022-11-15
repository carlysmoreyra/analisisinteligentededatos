#carga de archivos a trabajar
setwd("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)")

library(haven)
bbatj <- read_sas("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/bbatj.sas7bdat", 
                  NULL)
View(bbatj)

library(readr)
porsuigieco <- read_delim("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/porsuigieco.txt", 
                          delim = "|", escape_double = FALSE, trim_ws = TRUE)
View(porsuigieco)

library(readxl)
albums <- read_excel("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/albums.xlsx")
View(albums)

library(readxl)
serugiran <- read_excel("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/serugiran.xlsx")
View(serugiran)

library(readr)
suigeneris <- read_csv("suigeneris.csv")
View(suigeneris)

setwd("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/solista")
library(readr)
Clics_Modernos <- read_delim("Clics Modernos.txt",
                             delim = "\t", escape_double = FALSE, 
                             trim_ws = TRUE)
library(readr)



Como_Conseguir_Chicas <-read_delim("Como Conseguir Chicas.txt",
                                   delim = "\t", escape_double = FALSE, 
                                   trim_ws = TRUE)

library(readr)
Cuarenta_Obras_Fundamentales_Volumen_1_ <-  read_delim("Cuarenta Obras Fundamentales (Volumen 1).txt",
                                                       delim = "\t", escape_double = FALSE, 
                                                       trim_ws = TRUE)#mal

Cuarenta_Obras_Fundamentales_Volumen_2_ <- read_delim("Cuarenta Obras Fundamentales (Volumen 2).txt",
                                                      delim = "\t", escape_double = FALSE, 
                                                      trim_ws = TRUE)#mal
El_Aguante <- read_delim("El Aguante.txt",
                         delim = "\t", escape_double = FALSE, 
                         trim_ws = TRUE)#mal
El_Album <- read_delim("El Álbum.txt",
                       delim = "\t", escape_double = FALSE, 
                       trim_ws = TRUE)#mal

Filosofia_Barata_y_zapatos_de_goma <- read_delim("Filosofía Barata y Zapatos de Goma.txt",
                                                 delim = "\t", escape_double = FALSE, 
                                                 trim_ws = TRUE)#mal





Garcia_87_93 <- read_delim("García 87-93.txt",
                           delim = "\t", escape_double = FALSE, 
                           trim_ws = TRUE)#mal





Garcia_el_mas_grande <-read_delim("García, el Más Grande.txt",
                                  delim = "\t", escape_double = FALSE, 
                                  trim_ws = TRUE)#mal




Influencia <- read_delim("Influencia.txt",
                         delim = "\t", escape_double = FALSE, 
                         trim_ws = TRUE)#mal






La_hija_de_la_lagrima <- read_delim("La Hija De La Lagrima.txt",
                                    delim = "\t", escape_double = FALSE, 
                                    trim_ws = TRUE)#mal







Musica_del_alma <-read_delim("Música del Alma (En vivo).txt",
                             delim = "\t", escape_double = FALSE, 
                             trim_ws = TRUE)#mal







Parte_de_religion <-  read_delim("Parte de la Religion.txt",
                                 delim = "\t", escape_double = FALSE, 
                                 trim_ws = TRUE)#mal



Piano_Bar <-  read_delim("Piano Bar.txt",
                         delim = "\t", escape_double = FALSE, 
                         trim_ws = TRUE)#mal



Random <-  read_delim("Random.txt",
                      delim = "\t", escape_double = FALSE, 
                      trim_ws = TRUE)#mal




Rock_And_Roll_Yo <- read_delim("Rock And Roll Yo.txt",
                               delim = "\t", escape_double = FALSE, 
                               trim_ws = TRUE)#mal






Say_No_More <- read_delim("Say No More.txt",
                          delim = "\t", escape_double = FALSE, 
                          trim_ws = TRUE)#mal







Tango_4 <-  read_delim("Tango 4.txt", 
                       delim = "\t", escape_double = FALSE, 
                       trim_ws = TRUE) #mal



Terapia_Intensiva <- read_delim("Terapia Intensiva.txt", 
                                delim = "\t", escape_double = FALSE, 
                                trim_ws = TRUE) #bien

Unplugged <- read_delim("Unplugged.txt", 
                        delim = "\t", escape_double = FALSE, 
                        trim_ws = TRUE) #bien

Yendo_De_La_Cama_Al_Living <- read_delim("Yendo De La Cama Al Living.txt", 
                                         delim = "\t", escape_double = FALSE, 
                                         trim_ws = TRUE) #mal









#discos de carpeta principal 
setwd("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)")
library(readxl)
albums <- read_excel("~/Austral/Analisis inteligentes de datos/tp1/datos_charly(1)/albums.xlsx")


library(haven)
bbatj <- read_sas("bbatj.sas7bdat", NULL)
