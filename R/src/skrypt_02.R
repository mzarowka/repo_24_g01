# Load packages
library(tidyverse)

data <- iris

# Średnia długość płatka

sredni_platek <- mean(data$Petal.Length)

mediana_platek <- median(data[, 1])

sd_platek <- sd(data$Petal.Length)

# średnie dla gatunków

sredni_platek_setosa <- mean(data[1:50, 4])

sredni_platek_versi <- mean(data[51:100, 4])

sredni_platek_virgi <- mean(data[101:150, 4])

# srednia dla gatunku po nazwie
srednia_platek_setosa_nazwa <- mean(data[data$Species == "setosa", 4])

# Podsumowanie
podsumowanie <- summary(data)
podsumowanie

podsumowanie_2 <- summary()

# Suma długości
data$Suma.dlugosci <- data$Sepal.Length + data$Petal.Length

# Frakcja
data$Frakcja <- (data$Sepal.Length + data$Petal.Length) / data$Sepal.Width

# Srednia jako kolumna
data$srednia <- mean(c(data$Sepal.Length, data$Petal.Length))

# Ramka danych tylko setosa
data_setosa <- data[1:50,]

# Ramka danych tylko setosa po nazwie - do sprawdzenia
data_setosa_nazwa <- data[data$Species == c("setosa", "virginica"),]

# Ramka danych tylko oryginalne kolumny
data_oryginalne <- dplyr::select(data, Sepal.Length:Species)

# Wybór zmiennych według nazwy z zapisem od:do
data_oryginalne_tylko_Sepal <- dplyr::select(data, Sepal.Length:Sepal.Width)

# Wybór zmiennych według nazwy z zapisem sklejanym
data_oryginalne_tylko_Sepal_2 <- dplyr::select(data, c(Sepal.Length, Sepal.Width))

# Wybór zmiennych według nazwy z zapisem według początku
data_oryginalne_tylko_Sepal_3 <- dplyr::select(data, starts_with("Petal"))

# Wybór zmiennych według nazwy z zapisem według końca
data_oryginalne_tylko_Sepal_4 <- dplyr::select(data, ends_with("Length"))

# Wybór zmiennych według nazwy z zapisem dowolnych znaków wspólnych
data_oryginalne_tylko_Sepal_5 <- dplyr::select(data, contains("al"))

# Wybór zmiennych według nazwy z zapisem według początku - zanegowane
data_oryginalne_tylko_Sepal_6 <- dplyr::select(data, !starts_with("Petal"))

###### Wybór wierszy
# Wybór wierszy z gatunkiem setosa
data_wiersze_1 <- dplyr::filter(data, Species == "setosa")

# Wybór wierszy nie z gatunkiem setosa
data_wiersze_2 <- dplyr::filter(data, !Species == "setosa")

# Wybór wierszy gdzie Petal.Length jest większe od 5.0
data_wiersze_3 <- dplyr::filter(data, Petal.Length > 5.0)

# Wybór wierszy gdzie Petal.Length jest większe od 5.0 oraz < 6.0
data_wiersze_4 <- dplyr::filter(data, Petal.Length > 5.0 & Petal.Length < 6.0)
# Działania na zbiorach | || & &&
