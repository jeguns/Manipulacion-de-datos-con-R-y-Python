library(readxl)
library(dplyr)

# Lectura -----------------------------------------------------------------

datos <- read_excel('U4 - DATOS1.xlsx')

# Selección de variables --------------------------------------------------

datos |> 
  select(HV009, HV010, HV014, HV015, HV024, HV025, HV035, HV042, NOMCCPP, 
         LONGITUDX, LATITUDY) -> datos01

datos |> 
  select(11, 12, 16, 17, 22, 23, 31, 34, 42:44) -> datos02

identical(datos01,datos02)

datos |> 
  select(-ID1, -HHID, -HV000) -> datos03

datos |> 
  select(-(1:3)) -> datos04

identical(datos03,datos04)

datos |> select(HV014) -> datos05

datos |> pull(HV014) -> datos06

identical(datos05, datos06)


# Renombrar variables ------------------------------------------------------

datos01 |> colnames()

datos01 |> rename(TOTAL_HOGAR = 1,
                 TOTAL_MUJERES = 2,
                 TOTAL_NINOS = 3,
                 ENTREVISTA = 4,
                 DEPARTAMENTO = 5,
                 AREA = 6,
                 NINOS_ELEG = 7,
                 HEMOG_ELEG = 8) -> datos07

datos01 |> rename(TOTAL_HOGAR = HV009,
                 TOTAL_MUJERES = HV010,
                 TOTAL_NINOS = HV014,
                 ENTREVISTA = HV015,
                 DEPARTAMENTO = HV024,
                 AREA = HV025,
                 NINOS_ELEG = HV035,
                 HEMOG_ELEG = HV042) -> datos08

identical(datos07, datos08)


# Creación de variables ---------------------------------------------------------

datos07 |> 
  mutate(TOTAL_MUJ_NIN = TOTAL_MUJERES + TOTAL_NINOS) |> 
  mutate(TOTAL_OTROS = TOTAL_HOGAR - TOTAL_MUJ_NIN) -> datos09

datos07 |> 
  mutate(TOTAL_MUJ_NIN = TOTAL_MUJERES + TOTAL_NINOS,
         TOTAL_OTROS = TOTAL_HOGAR - TOTAL_MUJ_NIN) -> datos10

identical(datos09,datos10)

datos07 |> 
  mutate(LIMA = ifelse(DEPARTAMENTO == "LIMA", "SI", "NO")) -> datos11

datos07 |> 
  mutate(LIMA_CALLAO = ifelse(DEPARTAMENTO %in% c("LIMA","CALLAO"), "SI", "NO")) -> datos12

datos07 |> 
  mutate(TOTAL_MUJ_NIN = TOTAL_MUJERES + TOTAL_NINOS,
         TOTAL_OTROS = TOTAL_HOGAR - TOTAL_MUJ_NIN,
         LIMA = ifelse(DEPARTAMENTO == "LIMA", "SI", "NO"),
         LIMA_CALLAO = ifelse(DEPARTAMENTO %in% c("LIMA","CALLAO"), "SI", "NO")) -> datos13



# Modificación de variables ------------------------------------------------

datos13$AREA |> str()

datos13 |> 
  mutate(AREA = ifelse(AREA == 1, "URBANO", "RURAL")) -> datos14

datos14$AREA |> str()

# Filtros -----------------------------------------------------------------

datos14 |> 
  filter(AREA == "URBANO") -> datos15

datos14 |> 
  filter(AREA == "URBANO" & DEPARTAMENTO == 4) -> datos16

datos14 |> 
  filter(AREA == "URBANO" | DEPARTAMENTO == 4) -> datos17

datos14 |> 
  filter(AREA == "URBANO" & DEPARTAMENTO %in% c(16,17,25)) -> datos18

datos14 |> 
  filter(DEPARTAMENTO != 12) -> datos19

datos14 |> 
  filter(!DEPARTAMENTO == 12) -> datos20

identical(datos19,datos20)

