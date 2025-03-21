#Instalando bibliotecas
#install.packages(c("tidyverse", "ggplot2"))

# Carregar as bibliotecas necessárias
library(tidyverse)
library(ggplot2)

# Carregar os dados
# Nota: Substitua 'dailyActivity_merged.csv' pelo caminho do seu arquivo de dados
df <- read_csv("dailyActivity_merged.csv")

# 1. Análise descritiva
summary(df)

# 2. Distribuição das atividades diárias
# Histograma para TotalSteps
ggplot(df, aes(x = TotalSteps)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(
    title = "Distribuição do Total de Passos Diários",
    x = "Total de Passos",
    y = "Frequência"
  )

# Histograma para TotalDistance
ggplot(df, aes(x = TotalDistance)) +
  geom_histogram(bins = 30, fill = "salmon", color = "black") +
  labs(
    title = "Distribuição da Distância Total Percorrida",
    x = "Distância Total (km)",
    y = "Frequência"
  )

# Histograma para SedentaryMinutes
ggplot(df, aes(x = SedentaryMinutes)) +
  geom_histogram(bins = 30, fill = "lightgreen", color = "black") +
  labs(
    title = "Distribuição dos Minutos Sedentários Diários",
    x = "Minutos Sedentários",
    y = "Frequência"
  )

# 3. Relação entre passos e calorias
# Scatterplot para TotalSteps vs. Calories
ggplot(df, aes(x = TotalSteps, y = Calories)) +
  geom_point() +
  labs(
    title = "Relação entre Total de Passos e Calorias Queimadas",
    x = "Total de Passos",
    y = "Calorias Queimadas"
  )

# 4. Relação entre minutos sedentários e calorias
# Scatterplot para SedentaryMinutes vs. Calories
ggplot(df, aes(x = SedentaryMinutes, y = Calories)) +
  geom_point() +
  labs(
    title = "Relação entre Minutos Sedentários e Calorias Queimadas",
    x = "Minutos Sedentários",
    y = "Calorias Queimadas"
  )

# 5. Análise por usuário (Id)
# Boxplot para TotalSteps por Id
if ("Id" %in% colnames(df)) {
  ggplot(df, aes(x = as.factor(Id), y = TotalSteps)) +
    geom_boxplot() +
    labs(
      title = "Total de Passos por Usuário",
      x = "Usuário (Id)",
      y = "Total de Passos"
    )

  # Boxplot para SedentaryMinutes por Id
  ggplot(df, aes(x = as.factor(Id), y = SedentaryMinutes)) +
    geom_boxplot() +
    labs(
      title = "Minutos Sedentários por Usuário",
      x = "Usuário (Id)",
      y = "Minutos Sedentários"
    )
}

# 6. Insights (Impressão no console)
cat("\nInsights:\n")
cat("- Existe uma correlação positiva entre o total de passos e as calorias queimadas.\n")
cat("- Minutos sedentários podem estar relacionados com a queima de calorias (possivelmente inversamente).\n")
if ("Id" %in% colnames(df)) {
  cat("- Há variação nos padrões de atividade entre diferentes usuários.\n")
}