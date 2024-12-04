# Dzien 4.12.2024

# Libraries
library(tidyverse)

# wczytac dane
data("iris")

dane <- iris

# zmiana nazwy kolumn na male
dane <- dplyr::rename_with(dane, .cols = dplyr::everything(), \(i) tolower(i))

# dodatkowa kolumna
dane <- dplyr::mutate(dane, iloraz = petal.length / petal.width)

# Grupowanie danych
dane_g <- dplyr::group_by(dane, species)

# Wydrukuj do konsoli
dane_g

# Podsumowania
dane_s <- dplyr::summarise(dane_g,
                           srednia = mean(sepal.length),
                           srednia_2 = mean(sepal.width))

# Praca na kilku kolumnach na raz

# Logarytm z danych w kolumnie
dane_01 <- dplyr::mutate(dane, sepal.length = log(sepal.length))

# Pierwiastek z dwóch kolumn
dane_02 <- dplyr::mutate(dane, sepal.width = sqrt(sepal.width), petal.length = sqrt(petal.length))

# across
dane_03 <- dplyr::mutate(dane, dplyr::across(sepal.length:petal.width, \(i) log10(i)))

# Across, log10 przez kolumny które mają w nazwie length
dane_04 <- dplyr::mutate(dane, dplyr::across(dplyr::contains("length"), \(i) log10(i)))

# Across jedna kolumna po nazwie, dwie kolumny po początku nazwy
dane_05 <- dplyr::mutate(dane, dplyr::across(c(sepal.length, dplyr::contains("width")), \(i) sqrt(i)))

# Across i zwykłe mutate: kolumny zaczynajace się od petal = log2, dodaj kolumne z wynikiem dzielenia kolumn petal.
dane_06 <- dplyr::mutate(dane,
                         dplyr::across(dplyr::starts_with("petal"), \(i) log2(i)),
                         iloraz = petal.length / petal.width)

# Across w summarise
dane_07 <- dplyr::summarise(dane, dplyr::across(dplyr::everything(), \(i) mean(i)))

# Across na wartościach numerycznych
dane_08 <- dplyr::summarise(dane, dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i) mean(i)))

# Across na wartościach numerycznych, wiecej niż jedna funkcja
dane_09 <- dplyr::summarise(dane, dplyr::across(dplyr::where(\(i) is.numeric(i)), list(srednia = \(i) mean(i), mediana = \(i) median(i))))

# Potokowanie (piping)
# Dodaj nową kolumnę, wynik dodawania wszystkich kolumn do siebie
dane_10 <- dplyr::mutate(dane, suma = sepal.length + sepal.width + petal.length + petal.width)

# Zgrupj te same dane po kolumnie species
dane_10 <- dplyr::group_by(dane_10, species)

# Policz srednia wartość wszystkich kolumn liczbowych
dane_10 <- dplyr::summarise(dane_10, dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i) mean(i)))

# Potokowanie w działaniu
dane_11 <- dane |>
  dplyr::mutate(suma = sepal.length + sepal.width + petal.length + petal.width) |>
  dplyr::group_by(species) |>
  dplyr::summarise(dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i) mean(i)))
