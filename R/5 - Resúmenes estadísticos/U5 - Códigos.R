
# LECTURA -----------------------------------------------------------------

datos1 <- read.csv('U5 - DATOS1.csv', encoding = "latin1")
datos2 <- read.csv('U5 - DATOS2.csv', encoding = "latin1")

# REPASO ------------------------------------------------------------------

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

# CONTEOS -----------------------------------------------------------------

datos |> count()

datos |> count(ECIV)

datos |> filter(!is.na(ECIV)) |> count(ECIV)

datos |> 
  filter(!is.na(ECIV)) |> 
  count(ECIV) |> 
  mutate(porc = round(n/sum(n)*100,2))

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
  mutate(porc = round(n/sum(n)*100,2)) |> 
  select(-n) |> 
  spread(SEXO, porc, fill = 0) |> 
  rename(EstadoCivil = 1)

# Indicadores -------------------------------------------------------------

datos |> pull(EDAD) |> mean()

datos |> summarize(mean(EDAD))

datos |> 
  group_by(DOMINIO) |> 
  summarize(mean(EDAD)) |> 
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

datos |> 
  filter(!is.na(ECIV)) |> 
  group_by(SEXO, ECIV) |> 
  summarize(mean(EDAD)) |> 
  rename(Edad_Promedio = 3) |> 
  spread(SEXO, Edad_Promedio, fill = 0) 

datos |> 
  filter(!is.na(FREC_INT)) |> 
  group_by(FREC_INT) |> 
  summarize(median(EDAD)) |> 
  rename(Edad_Mediana = 2) |> 
  arrange(-Edad_Mediana)

library(modeest)

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


# Reporte general ---------------------------------------------------------

library(skimr)
datos |> skim()

datos |> group_by(SEXO) |> skim()
