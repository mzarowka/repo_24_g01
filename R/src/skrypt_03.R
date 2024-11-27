# 27.11.2024
library(tidyverse)
library(readxl)

# Wczytanie danych
ramka <- readxl::read_excel("R/data/data_cardio.xlsx", sheet = "Sheet1")

ramka2 <- readxl::read_excel("R/data/data_cardio.xlsx", sheet = "gorszy")

ramka2 <- dplyr::rename(ramka2,
                        systolic.mmhg = ...3,
                        moja_zmienna2 = date)

# Zmiana nazwa z wielkiej na mala
ramka_3 <- dplyr::rename_with(ramka2,
                              .cols = everything(),
                              \(i) toupper(i))

# Zmiana nazwa z wielkiej na mala
ramka_4 <- dplyr::rename_with(ramka,
                              .cols = dplyr::contains("mmhg"),
                              \(i) toupper(i))

# Operacje na kolumnach
ramka$kolumna6 <- ramka[,3] / ramka[,4]

# Operacje na kolumnach mutate
ramka_6 <- dplyr::mutate(ramka,
                         wynik_dzielenia = systolic.mmhg / diastolic.mmhg,
                         wynik_dodawania = pulse.min + 1)

# Operacje na kolumnach mutate
ramka_7 <- dplyr::mutate(ramka,
                         pulse.min = pulse.min - 10)

# Operacje na kolumnach mutate
ramka_8 <- dplyr::mutate(ramka,
                         pulse.min = pulse.min - 10, .keep = "none")

# przesunięcie kolumn
ramka_9 <- dplyr::relocate(ramka_7, pulse.min, .after = date)
