
datos1 <- read.csv('U5 - DATOS1.csv', encoding = "latin1")
datos2 <- read.csv('U5 - DATOS2.csv', encoding = "latin1")

datos1$DOMINIO

library(dplyr)
datos1 |> 
  mutate(CODIGO = paste0(CONGLOME,VIVIENDA,HOGAR,CODPERSO)) |> 
  select(CODIGO,DOMINIO,P207,P208A,P209) |> 
  mutate(DOMINIO = case_when(DOMINIO == 1 ~ "Costa Norte",
                             DOMINIO == 2 ~ "Costa Centro",
                             DOMINIO == 3 ~ "Costa Sur",
                             DOMINIO == 4 ~ "Sierra Norte",
                             DOMINIO == 5 ~ "Sierra Centro",
                             DOMINIO == 6 ~ "Sierra Sur",
                             DOMINIO == 7 ~ "Selva",               
                             DOMINIO == 8 ~ "Lima Metropolitana",
                             TRUE ~ NA_character_)) |> 
  rename(SEXO = 3,
         EDAD = 4,
         ECIV = 5) |> 
  mutate(SEXO = case_when(SEXO == 1 ~ "Hombre",
                          SEXO == 2 ~ "Mujer",
                          TRUE ~ NA_character_),
         ECIV = case_when(ECIV == 1 ~ "Conviviente",
                          ECIV == 2 ~ "Casado(a)",
                          ECIV == 3 ~ "Viudo(a)",
                          ECIV == 4 ~ "Divorciado(a)",
                          ECIV == 5 ~ "Separado(a)",
                          ECIV == 6 ~ "Soltero(a)",
                          TRUE ~ NA_character_)) -> datos_A

datos2 |> 
  mutate(CODIGO = paste0(CONGLOME,VIVIENDA,HOGAR,CODPERSO)) |> 
  select(CODIGO,P314A,P314D) |> 
  rename(INTERNET = 2,
         FREC_INT = 3) |> 
  mutate(INTERNET = case_when(INTERNET == 1 ~ "Sí",
                              INTERNET == 2 ~ "No",
                              TRUE ~ NA_character_),
         FREC_INT = case_when(FREC_INT == 1 ~ "Una vez al día",
                              FREC_INT == 2 ~ "Una vez a la semana",
                              FREC_INT == 3 ~ "Una vez al mes",
                              FREC_INT == 4 ~ "Cada 2 meses o más",
                              TRUE ~ NA_character_))-> datos_B

datos_A |> inner_join(datos_B, by = "CODIGO") -> datos
datos_B |> inner_join(datos_A, by = "CODIGO") -> datos_v2
identical(datos, datos_v2)

datos_A |> inner_join(datos_B, by = c("CODIGO" = "CODIGO")) -> datos_v3
identical(datos, datos_v3)


# Conteos ------------------------------------------------------------------

datos |> count()
datos |> nrow()
dim(datos)[1] # dim(datos) da la cantidad de filas y columnas

datos |> count(ECIV)

datos |> filter(!is.na(ECIV)) |> count(ECIV)

datos |> 
  filter(!is.na(ECIV)) |> 
  count(ECIV)

datos |> 
  filter(!is.na(ECIV)) |> 
  count(ECIV) |> 
  mutate(porc = round( n/sum(n)*100 , 2)) # Tabla de frecuencia univariada

datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(SEXO) |> 
  count(ECIV) |> 
  mutate(porc = round(n/sum(n)*100,2))

datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(ECIV) |> 
  count(SEXO) |> 
  mutate(porc = round(n/sum(n)*100,2))

library(tidyr)
datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(ECIV) |> 
  count(SEXO) |> 
  mutate(porc = round(n/sum(n)*100,2))

datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(ECIV) |> 
  count(SEXO) |> 
  mutate(porc = round(n/sum(n)*100,2)) |> 
  select(-n)|> 
  spread(SEXO, porc, fill = "Sin datos") |> # fill para llenar posibles valores perdidos
  rename(EstadoCivil = 1)

# Indicadores

# mean(vector atómico)
# summarize(data frame, mean)

# median(vector atómico)
# summarize(data frame, median)

datos |> pull(EDAD)|> mean() -> xxxx
# La edad promedio de las personas es de 36.16 años

datos |> summarize(mean(EDAD)) -> yyyy
# La edad promedio de las personas es de 36.16 años

identical(xxxx, yyyy)
str(xxxx)
str(yyyy)

datos |> 
  filter(DOMINIO=="Costa Norte") |> 
  summarize(mean(EDAD))

datos |> 
  filter(DOMINIO=="Costa Centro") |> 
  summarize(mean(EDAD))

datos |> 
  filter(DOMINIO=="Costa Sur") |> 
  summarize(mean(EDAD))

datos |> 
  group_by(DOMINIO) |> 
  summarize(mean(EDAD))|> 
  rename(PromEdad = 2) |> 
  arrange(-PromEdad)

datos |> 
  summarize(mean(EDAD), .by = DOMINIO) |> 
  rename(PromEdad = 2) |> 
  arrange(-PromEdad)

datos |> 
  group_by(DOMINIO) |> 
  summarize(median(EDAD)) |> 
  rename(Edad_Mediana = 2) |> 
  arrange(-Edad_Mediana)

# El 50% de las personas que vive en la selva tiene hasta 30 años, y
# el otro 50% tiene más de 30 años.

datos |> 
  group_by(SEXO) |> 
  summarize(median(EDAD)) |> 
  rename(Edad_Mediana = 2) |> 
  arrange(-Edad_Mediana)

datos |> 
  group_by(SEXO) |> 
  summarize(quantile(EDAD,0.90)) |> 
  rename(P90 = 2) |> 
  arrange(-P90)
# El 90% de los hombres tiene hasta 68 años de edad, y el 10% tiene
# más de 68 años de edad. Lo mismo ocurre para mujeres.

datos |> 
  group_by(SEXO) |> 
  summarize(quantile(EDAD,0.99)) |> 
  rename(P99 = 2) |> 
  arrange(-P99)
# El 99% de las mujeres tiene hasta 88 años, y el 1% tiene más de 88. 
# Para hombres, el 99% tiene hasta 86 años, y el 1% más de 86 años.

datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(SEXO, ECIV) |> 
  summarize(mean(EDAD)) |> 
  rename(Edad_Promedio = 3) |> 
  spread(SEXO, Edad_Promedio, fill = 0) 

library(modeest)
datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(SEXO, ECIV) |> 
  summarize(mean(EDAD), mfv(FREC_INT)) |> 
  rename(Edad_Promedio = 3,
         Moda_Internet = 4)|> 
  select(-Moda_Internet) |> 
  spread(SEXO, Edad_Promedio, fill = 0)

datos |> 
  filter(!is.na(FREC_INT)) |> 
  group_by(FREC_INT) |> 
  summarize(median(EDAD)) |> 
  rename(Edad_Mediana = 2) |> 
  arrange(-Edad_Mediana)

datos |> pull(SEXO) |> mfv()

datos |> 
  filter(!is.na(FREC_INT)) |> 
  group_by(FREC_INT) |> 
  summarize(mfv(SEXO)) |> 
  rename(Moda_Sexo = 2)

datos |> 
  filter(!is.na(FREC_INT)) |> 
  group_by(SEXO) |> 
  summarize(mfv(FREC_INT)) |> 
  rename(Moda_Sexo = 2)

library(skimr)
datos |> skim()
datos |> group_by(SEXO) |> skim()
datos |> group_by(ECIV) |> skim()

