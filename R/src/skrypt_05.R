# Paczki
library(tidyverse)
pingwiny <- palmerpenguins::penguins

# test_potokowania
# 1. Stowrzyć wektor 2. Policzyć sumę skumulowaną 3. Policzyć średnią
# Nadpisywanie kolejnymi wartościami
dane_nadpisane <- c(6, 7, 8, 9)

dane_nadpisane <- cumsum(dane_nadpisane)

dane_nadpisane <- mean(dane_nadpisane)

# Zapis z zagnieżdżoną funkcją
dane_funkcja <- mean(cumsum(c(6, 7, 8, 9)))

# Zapis z użyciem potokowania ("pipe")
dane_potok <- c(6, 7, 8, 9) |>
  # Komentarz
  cumsum() |>
  # Komentarz 2
  mean()

# tidyr ####
data <- iris

# Zmiana formatu long na wide
l_2_w <- data |>
  tidyr::pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Width)

# Zmiana formatu long na wide
# pingwiny_wide <- pingwiny |>
  # tidyr::drop_na() |>
  # # Zamiana formatu na "szerszy"
  # tidyr::pivot_wider(names_from =)

pingwiny <- pingwiny |>
  dplyr::mutate(id = 1:length(year))

# Zmiana formatu wide na long
pingwiny_longer <- pingwiny |>
  tidyr::pivot_longer(bill_length_mm:body_mass_g, names_to = "zmienna", values_to = "wartosci")

# Wykres
# ggplot2::ggplot(pingwiny_longer, aes(year, wartosci, color = species)) +
  # geom_point() +
  # facet_wrap(vars(zmienna))

# Do szerokiego
pingwiny_wider <- pingwiny_longer |>
  # Zmiana formatu ramki
  tidyr::pivot_wider(names_from = zmienna, values_from = wartosci)

# Joins (operacje na wielu ramkach) ####
# Podział na płeć
pingiwny_m <- pingwiny |>
  # Wybór samców
  dplyr::filter(sex == "male")

# Wybór samic
pingwiny_s <- pingwiny |>
  dplyr::filter(sex == "female")

# łączenie wierszy - bind rows
pingiwny_m_s <- dplyr::bind_rows(pingiwny_m, pingwiny_s)

# Podział kolumnami
pingiwny_1 <- pingwiny |>
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
  dplyr::select(-c(species:body_mass_g))

# łączenie kolumn - bind cols
pingwiny_1_2 <- dplyr::bind_cols(pingiwny_1, pingwiny_2)
