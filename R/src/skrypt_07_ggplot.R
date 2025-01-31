# ggplot intro 29.01.2025

# Paczki
library(tidyverse)

# Dane hydrochemiczne
zab_hydrochemia <- read.csv("R/data/zab_data/zab_hydrochemistry-lake.csv") |>
  mutate(date = lubridate::ymd(date))

# Wykres: x = czas, y = wartosc Ca
ggplot2::ggplot(zab_hydrochemia, aes(date, ca)) +
  geom_line()

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = depth)) +
  geom_line()

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line()

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth))

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1)

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość jako wartosci dyskretne. Brak tła, linie osi itd.
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1) +
  theme_dark()

# Wykres: x = czas, y = wartosc Ca - serie pokolorwane - głębokość jako wartosci dyskretne. Brak tła, linie osi itd.
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1) +
  theme(panel.background = element_blank())

# Wczytaj dane zab_temperature_daily
zab_temp <- read.csv("R/data/zab_data/zab_temperature-daily.csv") |>
  mutate(day = lubridate::ymd(day))

# Wykres temperatury wody w czasie, temperatura na pierwszym metrze, punkty, linia, wygładzone
ggplot(zab_temp, aes(day, temp_01)) +
  geom_point() +
  geom_line(color = "red") +
  geom_smooth()

# Wykres z seriami rozbitymi na panele, wszystkie głębokości
zab_temp |>
  tidyr::pivot_longer(cols = starts_with("temp_"), names_to = "glebokosc", values_to = "temperatura") |>
  ggplot(aes(day, temperatura)) +
  geom_line() +
  facet_wrap(vars(glebokosc), ncol = 1, scales = "free")

# Wczytaj dane dotyczące pułapki sedymentacyjnej
zab_trap <- read.csv("R/data/zab_data/zab_sediment-trap_hypolimnion.csv") |> mutate(date = lubridate::ymd(date))

# Wykres kolumnowy tempa akumulacji masy
zab_trap |>
  ggplot(aes(date, mar)) +
  geom_col()

# Tu umiałem ale nie słyszę co mówią studenci
zab_trap |>
  ggplot() +
  geom_rect()

# Boxplot
ggplot(zab_hydrochemia) + geom_boxplot(aes(y = ca, group = factor(depth)))

# Violinplot
ggplot(zab_hydrochemia) + geom_violin(aes(x = factor(depth), y = ca))

ggplot(zab_hydrochemia) + geom_histogram(aes(ca, fill = factor(depth)))
