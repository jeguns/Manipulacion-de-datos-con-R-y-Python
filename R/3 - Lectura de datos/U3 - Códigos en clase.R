# DATOS1

datos1a = read.table('U3 - DATOS01.txt', 
                     header = TRUE, # en la primera línea están los nombres de variables
                     sep    = "\t", # el separador de columnas es la tabulación
                     dec    = ",")

datos1a = read.table('U3 - DATOS01.txt', 
                     header = TRUE, # en la primera línea están los nombres de variables
                     sep    = "\t", # el separador de columnas es la tabulación
                     dec    = ",",  # el separador decimal es la coma
                     col.names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))

head(datos1a)
datos1a |> head() 
head(datos1a,10)
datos1a |> head(10)
datos1a |> View()
str(datos1a)

# install.packages("readr")
library(readr)
# read_tsv asume que el separador de columnas es la tabulación
datos1b = read_tsv('U3 - DATOS01.txt',
                   locale = locale(decimal_mark = ","))
head(datos1b)
datos1b = read_tsv('U3 - DATOS01.txt',
                   skip   = 1, # saltar una línea
                   locale = locale(decimal_mark = ","), # coma decimal
                   col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
head(datos1b)

datos1c = read_delim('U3 - DATOS01.txt', 
                     skip   = 1, 
                     delim  = "\t", # el delimitador de columnas es la tabulación
                     locale = locale(decimal_mark = ","),
                     col_names = c("CENTRO_POBLADO","LONGITUD","LATITUD"))
datos1c |> head()

str(datos1a) # data frame
str(datos1b) # data frame tibble


# DATOS 2

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

# DATOS 3

datos3a = read.table('U3 - DATOS03.txt', 
                     header = TRUE, 
                     sep    = "\t", 
                     dec    = ",",
                     na.strings = c("No precisa"))
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

# DATOS 5

datos5a = read.table('U3 - DATOS05.txt',
                     header = TRUE, 
                     skip   = 11,
                     dec    = ".",
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

library(writexl)
write_xlsx(datos5c, path = "archivo_domingo.xlsx")

write.table(datos5c, file = "archivo_domingo.txt", row.names = FALSE)

# DATOS 6

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


# DATOS 7

datos7a = read.csv2('U3 - DATOS07.csv')
datos7a |> head()

datos7b = read.csv('U3 - DATOS07.csv', sep = ";")
datos7b |> head()

datos7c = read_csv2('U3 - DATOS07.csv')
datos7c |> head()

datos7c = read_delim('U3 - DATOS07.csv', delim = ";")
datos7c |> head()

# DATOS 8

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

adicional = read.csv('U3 - DATOS ADICIONAL.csv',
                     sep = "|")
adicional |> head()

adicional2 = read.table('U3 - DATOS ADICIONAL.csv',
                       header = TRUE,
                       sep = "|")
adicional2 |> head()

adicional3 = read_delim('U3 - DATOS ADICIONAL.csv',
                        delim = "|")
adicional3 |> head()

# DATOS11

library(readxl)
datos_11a = read_excel('U3 - DATOS11.xlsx') # AMBOS: xls o xlsx
datos_11b = read_xlsx('U3 - DATOS11.xlsx')
datos_11c = read_xls('U3 - DATOS11.xls')

# DATOS12 

datos_12a = read_excel('U3 - DATOS12.xlsx')
DATOS12   = read_excel("U3 - DATOS12.xlsx")
datos_12  = read_excel('U3 - DATOS12.xlsx')
datos_12.1 = read_xlsx('U3 - DATOS12.xlsx')
identical(DATOS12,datos_12.1)
str(datos_12)

# DATOS13

datos_13a = read_excel('U3 - DATOS13.xlsx')
datos_13b = read_excel('U3 - DATOS13.xlsx', sheet = 1)
datos_13c = read_excel('U3 - DATOS13.xlsx', sheet = 'SIN ETIQUETAS')
identical(datos_13b,datos_13c)
datos_13d = read_excel('U3 - DATOS13.xlsx', sheet = 2)
datos_13d = read_excel('U3 - DATOS13.xlsx', sheet = 'CON ETIQUETAS')

# DATOS14

datos_14a = read_excel('U3 - DATOS14.xlsx', skip = 11)
datos_14b = read_excel('U3 - DATOS14.xlsx', skip = 14)
identical(datos_14a,datos_14b)
datos_14c = read_excel('U3 - DATOS14.xlsx', range = "A15:G123")
identical(datos_14a,datos_14c)
datos_14d = read_excel('U3 - DATOS14.xlsx', range = "RTY!A15:G123")
identical(datos_14a,datos_14d)
datos_14e = read_excel('U3 - DATOS14.xlsx', 
                       sheet = 'RTY',
                       skip  = 15,
                       col_names = c("FECHA","HORA","TEMP",
                                     "PREC","HUME",
                                     "DIREC","VELOC"))

# DATOS 15

library(foreign)
datos_15a = read.dta("U3 - DATOS15.dta") # data frame
datos_15a |> str()

library(haven)
datos_15b = read_dta("U3 - DATOS15.dta") # tibble
datos_15b |> str()

identical(datos_15a,datos_15b)

# DATOS 16

datos_16a = read.spss("U3 - DATOS16.sav")
datos_16b = read.spss("U3 - DATOS16.sav", to.data.frame = TRUE) # data frame
datos_16b |> str()
datos_16c = read_sav("U3 - DATOS16.sav") # tibble
datos_16c |> str()

identical(datos_16a, datos_16b)

