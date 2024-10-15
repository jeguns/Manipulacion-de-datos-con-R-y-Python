

# Archivos de texto plano -------------------------------------------------

## DATOS01 ----------------------------------------------------------------

# El archivo U3 - DATOS01.txt contiene 3 columnas del conjunto de datos de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e

datos1a = read.table('U3 - DATOS01.txt', 
                     header = TRUE, 
                     sep    = "\t", 
                     dec    = ",",
                     col.names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
head(datos1a)
datos1a |> head()
head(datos1a,10)
datos1a |> head(10)
datos1a |> View()

install.packages("readr") # Basta ejecutar una sola vez. Luego de ello, comentar la línea
library(readr)

datos1b = read_tsv('U3 - DATOS01.txt',
                   skip   = 1, 
                   locale = locale(decimal_mark = ","),
                   col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos1b |> head()

datos1c = read_delim('U3 - DATOS1.txt',
                     skip   = 1, 
                     delim  = "\t",
                     locale = locale(decimal_mark = ","),
                     col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos1c |> head()

## DATOS02 ----------------------------------------------------------------

# El archivo U3 - DATOS02.txt se refiere al conjunto de datos completo de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e

datos2a = read.table('U3 - DATOS02.txt', 
                     header = TRUE, 
                     sep    = "\t", 
                     dec    = ",")
datos2a |> head()

datos2b = read_tsv('U3 - DATOS02.txt',
                   locale = locale(decimal_mark = ","))
datos2b |> head()

datos2c = read_delim('U3 - DATOS02.txt',
                     delim  = "\t",
                     locale = locale(decimal_mark = ","))
datos2c |> head()

## DATOS03 ----------------------------------------------------------------

# El archivo U3 - DATOS03.txt contiene datos (sin etiquetar) acerca de la encuesta de 
# intención de voto municipal en agosto 2022, llevada a cabo por Ipsos
# Fuente: https://www.ipsos.com/es-pe/intencion-de-voto-municipal-agosto-2022

datos3a = read.table('U3 - DATOS03.txt', 
                     header = TRUE, 
                     sep    = "\t", 
                     dec    = ",",
                     na.strings = "No precisa")
datos3a |> head()

datos3b = read_tsv('U3 - DATOS03.txt',
                   locale = locale(decimal_mark = ","),
                   na     = 'No precisa')
datos3b |> head()

datos3c = read_delim('U3 - DATOS03.txt',
                     delim  = "\t",
                     locale = locale(decimal_mark = ","),
                     na     = 'No precisa')
datos3c |> head()

## DATOS04 ----------------------------------------------------------------

# El archivo U3 - DATOS04.txt contiene datos (etiquetados) acerca de la encuesta de 
# intención de voto municipal en agosto 2022, llevada a cabo por Ipsos
# Fuente: https://www.ipsos.com/es-pe/intencion-de-voto-municipal-agosto-2022

datos4a = read.table('U3 - DATOS04.txt', 
                     header = TRUE, 
                     dec    = ",",
                     na.strings = "99")
datos4a |> head()

datos4b = read_tsv('U3 - DATOS04.txt',
                   locale = locale(decimal_mark = ","),
                   na     = "99")
datos4b |> head()

datos4c = read_delim('U3 - DATOS04.txt',
                     delim  = "\t",
                     locale = locale(decimal_mark = ","),
                     na     = "99")
datos4c |> head()

## DATOS05 ----------------------------------------------------------------

# El archivo U3 - DATOS05.txt contiene datos acerca de las condiciones
# meteorológicas en la estación del SENAMHI ubicada en la UNALM
# Fuente: https://www.senamhi.gob.pe/?p=estaciones

datos5a = read.table('U3 - DATOS05.txt',
                     header = TRUE, 
                     skip   = 11,
                     dec    = ",",
                     sep    = "\t",
                     na.strings = "S/D",
                     col.names  = c("FECHA","HORA","TEMPERATURA",
                                    "PRECIP","HUMEDAD","DIREC",
                                    "VELOCIDAD"))
datos5a |> head()

datos5b = read_tsv('U3 - DATOS05.txt',
                   skip   = 12,
                   na     = 'No precisa',
                   col_names  = c("FECHA","HORA","TEMPERATURA",
                                  "PRECIP","HUMEDAD","DIREC",
                                  "VELOCIDAD"))
datos5b |> head()

datos5c = read_delim('U3 - DATOS05.txt',
                     skip   = 12,
                     delim  = "\t",
                     na     = 'No precisa',
                     col_names  = c("FECHA","HORA","TEMPERATURA",
                                    "PRECIP","HUMEDAD","DIREC",
                                    "VELOCIDAD"))
datos5c |> head()


# Archivos separados por comas --------------------------------------------


## DATOS06 ----------------------------------------------------------------

# El archivo U3 - DATOS06.csv contiene 3 columnas del conjunto de datos de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e

datos6a = read.csv('U3 - DATOS06.csv', 
                  col.names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos6a |> head()

datos6b = read.table('U3 - DATOS06.csv',
                     header = TRUE,
                     sep = ",",
                     col.names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos6b |> head()

datos6c = read_csv('U3 - DATOS06.csv', 
                   skip = 1,
                   col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos6c |> head()

datos6d = read_delim('U3 - DATOS06.csv', 
                     skip = 1,
                     delim = ",",
                     col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos6d |> head()

## DATOS07 ----------------------------------------------------------------

# El archivo U3 - DATOS7.csv se refiere al conjunto de datos completo de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e

datos7a = read.csv2('U3 - DATOS07.csv')
datos7a |> head()

datos7b = read.csv('U3 - DATOS07.csv', sep = ";")
datos7b |> head()

datos7c = read_csv2('U3 - DATOS07.csv')
datos7c |> head()

datos7c = read_delim('U3 - DATOS07.csv', delim = ";")
datos7c |> head()

## DATOS08 ----------------------------------------------------------------

# El archivo U3 - DATOS08.csv contiene datos (sin etiquetar) acerca de la encuesta de 
# intención de voto municipal en agosto 2022, llevada a cabo por Ipsos
# Fuente: https://www.ipsos.com/es-pe/intencion-de-voto-municipal-agosto-2022

datos8a = read.csv('U3 - DATOS08.csv', 
                     na.strings = "No precisa")
datos8a |> head()

datos8b = read_csv('U3 - DATOS08.csv',
                   na     = 'No precisa')
datos8b |> head()

datos8c = read_delim('U3 - DATOS08.csv',
                     delim  = ",",
                     na     = 'No precisa')
datos8c |> head()

## DATOS09 ----------------------------------------------------------------

# El archivo U3 - DATOS09.csv contiene datos (etiquetados) acerca de la encuesta de 
# intención de voto municipal en agosto 2022, llevada a cabo por Ipsos
# Fuente: https://www.ipsos.com/es-pe/intencion-de-voto-municipal-agosto-2022

# Lea este conjunto de datos usando al menos 2 funciones

## DATOS10 ----------------------------------------------------------------

# El archivo U3 - DATOS10.csv contiene datos acerca de las condiciones
# meteorológicas en la estación del SENAMHI ubicada en la UNALM
# Fuente: https://www.senamhi.gob.pe/?p=estaciones

# Lea este conjunto de datos usando al menos 2 funciones


# Hojas de cálculo --------------------------------------------------------


## DATOS11 ----------------------------------------------------------------

# Los archivos U3 - DATOS11.xlsx y U3 - DATOS11.xls contiene 3 columnas del conjunto de datos de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e

library(readxl)
datos_11a = read_excel('U3 - DATOS11.xlsx')
datos_11b = read_xlsx('U3 - DATOS11.xlsx')
datos_11c = read_xls('U3 - DATOS11.xls')


## DATOS12 ----------------------------------------------------------------

# El archivo U3 - DATOS12.xlsx se refiere al conjunto de datos completo de
# la ENDES del año 2022
# Fuente: https://www.datosabiertos.gob.pe/dataset/encuesta-demogr%C3%A1fica-y-de-salud-familiar-endes-2022-instituto-nacional-de-estad%C3%ADstica-e


## DATOS13 ----------------------------------------------------------------

# El archivo U3 - DATOS13.xlsx contiene datos (sin etiquetar en la primera hoja,
# y etiquetados en la segunda) acerca de la encuesta de 
# intención de voto municipal en agosto 2022, llevada a cabo por Ipsos
# Fuente: https://www.ipsos.com/es-pe/intencion-de-voto-municipal-agosto-2022

datos_13a = read_excel('U3 - DATOS13.xlsx')
datos_13b = read_excel('U3 - DATOS13.xlsx', sheet = 1)
datos_13b = read_excel('U3 - DATOS13.xlsx', sheet = 'SIN ETIQUETAS')
datos_13c = read_excel('U3 - DATOS13.xlsx', sheet = 2)
datos_13d = read_excel('U3 - DATOS13.xlsx', sheet = 'CON ETIQUETAS')

## DATOS14 -----------------------------------------------------------------

# El archivo U3 - DATOS14.xlsx contiene datos acerca de las condiciones
# meteorológicas en la estación del SENAMHI ubicada en la UNALM
# Fuente: https://www.senamhi.gob.pe/?p=estaciones

datos_14a = read_excel('U3 - DATOS14.xlsx', 
                       skip = 11)
datos_14b = read_excel('U3 - DATOS14.xlsx', 
                       range = "A15:G123")
datos_14c = read_excel('U3 - DATOS14.xlsx', 
                       skip = 15,
                       col_names = c("FECHA","HORA","TEMP","PREC","HUME",
                                     "DIREC","VELOC"))
datos_14d = read_excel('U3 - DATOS14.xlsx', 
                       range = "A16:G123",
                       col_names = c("FECHA","HORA","TEMP","PREC","HUME",
                                     "DIREC","VELOC"))
identical(datos_14a,datos_14b)
identical(datos_14c,datos_14d)


## DATOS15 -----------------------------------------------------------------

# El archivo U3 - DATOS15.dta contiene datos de la Encuesta Nacional de Hogares
# (ENAHO) correspondientes al módulo 1 en el segundo trimestre del 2024.
# Fuente: https://proyectos.inei.gob.pe/microdatos/

library(foreign)
datos_15a = read.dta("U3 - DATOS15.dta")

library(haven)
datos_15b = read_dta("U3 - DATOS15.dta")

datos_15a |> str()
datos_15b |> str()


## DATOS16 -----------------------------------------------------------------

# El archivo U3 - DATOS16.sav contiene datos de la Encuesta Nacional de Hogares
# (ENAHO) correspondientes al módulo 1 en el segundo trimestre del 2024.
# Fuente: https://proyectos.inei.gob.pe/microdatos/

datos_16a = read.spss("U3 - DATOS16.sav")
datos_16b = read.spss("U3 - DATOS16.sav", to.data.frame = TRUE)
datos_16c = read_sav("U3 - DATOS16.sav")

datos_16a |> str()
datos_16b |> str()
datos_16c |> str()

