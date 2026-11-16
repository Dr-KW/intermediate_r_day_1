# Iris analysis – Assignment 1
library(tidyverse)
library(here)

data(iris)
head(iris); str(iris); summary(iris)

# Data manipulation: mean measurements per species
iris_summary <- iris |>
  group_by(Species) |>
  summarise(across(where(is.numeric), mean))
write_csv(iris_summary, here("assignment_1", "results", "iris_species_means.csv"))

# Visualisation
p <- ggplot(iris, aes(Sepal.Length, Petal.Length, colour = Species)) +
  geom_point() +
  labs(title = "Sepal vs petal length by species",
       x = "Sepal length (cm)", y = "Petal length (cm)") +
  theme_minimal()
ggsave(here("assignment_1", "figures", "sepal_vs_petal.png"), p, width = 6, height = 4)