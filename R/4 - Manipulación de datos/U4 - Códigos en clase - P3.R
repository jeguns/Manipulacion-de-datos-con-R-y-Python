library(readxl) # leer archivos excel
library(lubridate) # manejar fechas
library(tidyr) # manipular datos (pivoteo)

datos <- read_excel('U4 - DATOS4.xlsx', skip = 11)

datos |> 
  rename(FECHA = 1, TEMP = 3, PRECI = 4,
         HUMEDAD = 5, DIRECVEL = 6, VELOCVEL = 7) |> 
  mutate(FECHA = ymd(FECHA),
         HORA = hms(format(datos$HORA, "%H:%M:%S")),
         DIRECVEL = as.numeric(DIRECVEL)) -> datos1

(Q1 = datos1$DIRECVEL |> quantile(probs = 0.25))
(Q3 = datos1$DIRECVEL |> quantile(probs = 0.75))
(LI = Q1 - 1.5*(Q3-Q1)) # límite inferior
(LS = Q3 + 1.5*(Q3-Q1)) # límite superior

datos1 |> 
  filter(DIRECVEL>LI & DIRECVEL<LS) -> datos2 # no atípicos

datos1 |> 
  filter(DIRECVEL<LI | DIRECVEL>LS) -> datos3 # atípicos

datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL)
  
datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL) |> 
  pivot_wider(names_from = "HORA",
              values_from = "TEMP")

datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL) |> 
  pivot_wider(names_from = "HORA",
              values_from = "TEMP") |> 
  rename(Medianoche = 2) -> datos4

datos4

(Q1 = datos4$Medianoche |> as.numeric() |> quantile(probs = 0.25))
(Q3 = datos4$Medianoche |> as.numeric() |> quantile(probs = 0.75))
(LI = Q1 - 1.5*(Q3-Q1))
(LS = Q3 + 1.5*(Q3-Q1))

datos4 |> 
  filter(Medianoche>LI & Medianoche<LS) -> datos5

datos4 |> 
  filter(Medianoche<LI | Medianoche>LS) -> datos6


datos <- read_excel('U4 - DATOS5.xlsx', skip = 11)
datos |> 
  rename(FECHA = 1, TEMP = 3, PRECI = 4,
         HUMEDAD = 5, DIRECVEL = 6, VELOCVEL = 7) |> 
  mutate(FECHA = ymd(FECHA),
         HORA = hms(format(datos$HORA, "%H:%M:%S")),
         DIRECVEL = as.numeric(DIRECVEL)) -> datos1
datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL) |> 
  pivot_wider(names_from = "HORA",
              values_from = "TEMP")

datos <- read_excel('U4 - DATOS6.xlsx', skip = 11)
datos |> 
  rename(FECHA = 1, TEMP = 3, PRECI = 4,
         HUMEDAD = 5, DIRECVEL = 6, VELOCVEL = 7) |> 
  mutate(FECHA = ymd(FECHA),
         HORA = hms(format(datos$HORA, "%H:%M:%S")),
         DIRECVEL = as.numeric(DIRECVEL)) -> datos1
datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL) |> 
  pivot_wider(names_from = "HORA",
              values_from = "TEMP") -> DDD

# PIVOT LONGER

df_dca <- data.frame(Parcela = 1:9,                          
                     T1 = c(10.5, 11.2, 9.8),                
                     T2 = c(12.0, 11.5, 13.1),              
                     T3 = c(10.8, 12.2, 11.4))

df_dca |> 
  pivot_longer(cols = c(T1, T2, T3),
               names_to = "Tratamiento",
               values_to = "Rendimiento") -> df_largo

df_largo



df_dca <- data.frame(Parcela = 1:9,                          
                     T1 = c(10.5, 11.2, 9.8),                
                     T2 = c(12.0, 11.5, NA),              
                     T3 = c(10.8, 12.2, 11.4))

df_dca |> 
  pivot_longer(cols = c(T1, T2, T3),
               names_to = "Tratamiento",
               values_to = "Rendimiento") -> df_largo

df_largo

