# INTEGRACIÓN DE DATOS

df1 <- data.frame(id = c(1, 2, 3, 4),
                  nombre = c("Ana", "Beto", "Carlos", "Diana"))
df1

df2 <- data.frame(id = c(3, 4, 5, 6),
                  puntaje = c(85, 90, 88, 92))
df2

df1 |> left_join(df2)
df1 |> right_join(df2)
df1 |> inner_join(df2)
df1 |> full_join(df2)

# datos_A --- Módulo 1 --- HOGARES (cada fila tiene datos de un hogar)
datos_A <- read.csv('U4 - DATOS2.csv', encoding = "latin1")

# datos_B --- Módulo 2 --- PERSONAS (cada fila tiene datos de una persona)
datos_B <- read.csv('U4 - DATOS3.csv', encoding = "latin1")

datos_A |> 
  select(CONGLOME, VIVIENDA, HOGAR, UBIGEO, RESULT, P101, P104A) |> 
  mutate(CODIGO = paste0(CONGLOME,VIVIENDA,HOGAR)) |> 
  filter(UBIGEO == "150114") |> 
  select(-CONGLOME,-VIVIENDA,-HOGAR,-UBIGEO) -> datos1

datos_B |> 
  select(CONGLOME, VIVIENDA, HOGAR, UBIGEO, P207, P208A) |> 
  mutate(codigo = paste0(CONGLOME,VIVIENDA,HOGAR)) |> 
  filter(UBIGEO == "150114")  |> 
  select(-CONGLOME,-VIVIENDA,-HOGAR,-UBIGEO)  -> datos2

datos1 |> left_join(datos2, by = c("CODIGO" = "codigo")) -> datos3
# left_join va a mostrar los datos de todos los hogares, tengan o no personas 
# en ellos (hay hogares sin personas porque la encuesta no se dio)

datos1 |> right_join(datos2, by = c("CODIGO" = "codigo")) -> datos4
# right_join va a mostrar los datos de todas las personas, pertenezcan o no 
# a un hogar

datos1 |> inner_join(datos2, by = c("CODIGO" = "codigo")) -> datos5
# left_join va a mostrar los datos de todos los hogares que tengan alguna persona
# y de todas las personas que pertenezcan a algún hogar 

datos1 |> full_join(datos2, by = c("CODIGO" = "codigo")) -> datos6

# ORDENAMIENTO

datos5 |> arrange(P208A) # Ordena de menor a mayor según P208A

datos5 |> arrange(-P208A) # Ordena de mayor a menor según P208A

datos5 |> arrange(desc(P208A)) # Ordena de mayor a menor según P208A
