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
