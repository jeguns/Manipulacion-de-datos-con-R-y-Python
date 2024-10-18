# Ejemplo inicial -----------------------------------------------------------

df1 <- data.frame(id = c(1, 2, 3, 4),
                  nombre = c("Ana", "Beto", "Carlos", "Diana"))

df2 <- data.frame(id = c(3, 4, 5, 6),
                  puntaje = c(85, 90, 88, 92))

df1 |> left_join(df2)

df1 |> right_join(df2)

df1 |> inner_join(df2)

df1 |> full_join(df2)

# Lectura -----------------------------------------------------------------

datos_A <- read.csv('U4 - DATOS2.csv', encoding = "latin1")
datos_B <- read.csv('U4 - DATOS3.csv', encoding = "latin1")

# Repaso ------------------------------------------------------------------

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

# Integración de data frames -----------------------------------------------

datos1 |> left_join(datos2, by = c("CODIGO" = "codigo")) -> datos3

datos1 |> right_join(datos2, by = c("CODIGO" = "codigo")) -> datos4

datos1 |> inner_join(datos2, by = c("CODIGO" = "codigo")) -> datos5

datos1 |> full_join(datos2, by = c("CODIGO" = "codigo")) -> datos6

