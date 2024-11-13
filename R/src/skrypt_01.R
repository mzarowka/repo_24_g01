# Załadowanie paczek
library(tidyverse)

# Dane nowa zelandia (z www)
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wczytanie z dysku - pelna sciezka (bezwzględna)
dane_dysk_full_path <- readr::read_csv(file = "C:/GitHub/teaching/repo_24/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wczytanie z dysku - sciezka względna
dane_dysk_relative_path <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Zmiana kolumny tekstowej na liczbową
dane_dysk_relative_path$Value <- as.numeric(dane_dysk_relative_path$Value)

# Parsowanie tekstu na numer
dane <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane$Value <- readr::parse_number(dane$Value)

dane[748, "Value"]
