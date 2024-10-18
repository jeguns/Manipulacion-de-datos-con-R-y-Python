library(readxl)
library(lubridate)
library(tidyr)

# Lectura ------------------------------------------------------------------

datos <- read_excel('U4 - DATOS4.xlsx', skip = 11)

# Repaso ------------------------------------------------------------------

datos |> 
  rename(FECHA = 1, HORA = 2, TEMP = 3, PRECI = 4,
         HUMEDAD = 5, DIRECVEL = 6, VELOCVEL = 7) |> 
  mutate(FECHA = ymd(FECHA),
         HORA = hms(format(datos$HORA, "%H:%M:%S")),
         DIRECVEL = as.numeric(DIRECVEL)) -> datos1
(Q1 = datos1$DIRECVEL |> quantile(probs = 0.25))
(Q3 = datos1$DIRECVEL |> quantile(probs = 0.75))
(LI = Q1 - 1.5*(Q3-Q1))
(LS = Q3 + 1.5*(Q3-Q1))

datos1 |> 
  filter(DIRECVEL>LI & DIRECVEL<LS) -> datos2

datos1 |> 
  filter(DIRECVEL<LI | DIRECVEL>LS) -> datos3

# Pivot Wider -----------------------------------------------------------------

datos1 |> 
  select(-PRECI,-HUMEDAD,-DIRECVEL,-VELOCVEL) |> 
  pivot_wider(names_from = "HORA",
              values_from = "TEMP") |> 
  rename(Medianoche = 1) -> datos4

(Q1 = datos4$`0S` |> as.numeric() |> quantile(probs = 0.25))
(Q3 = datos4$`0S` |> as.numeric() |> quantile(probs = 0.75))
(LI = Q1 - 1.5*(Q3-Q1))
(LS = Q3 + 1.5*(Q3-Q1))

datos4 |> 
  filter(`0S`>LI & `0S`<LS) -> datos5

datos4 |> 
  filter(`0S`<LI | `0S`>LS) -> datos6

# Pivot Longer ------------------------------------------------------------

df_dca <- data.frame(Parcela = 1:9,                          
                     T1 = c(10.5, 11.2, 9.8),                
                     T2 = c(12.0, 11.5, 13.1),              
                     T3 = c(10.8, 12.2, 11.4))

df_dca |> 
  pivot_longer(cols = c(T1, T2, T3),
               names_to = "Tratamiento",
               values_to = "Rendimiento") -> df_largo

df_largo |> print(n = 27)
