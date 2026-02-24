library(tidyverse)

# Load the master dataset
df <- read_csv("exports/export_master.csv")

# How many rows and columns?
dim(df)

# Check for any missing values
colSums(is.na(df))

# Who are the customers with missing TotalCharges?
df %>% filter(is.na(TotalCharges))

# Churn rate 
df %>%
  count(Churn) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

# Churn by contract 
df %>%
  group_by(Contract, Churn) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(Contract) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

# Senior citizen anomaly
df %>%
  group_by(SeniorCitizen) %>%
  summarise(
    customers  = n(),
    churn_rate = round(mean(Churn == "Yes") * 100, 1),
    avg_charge = round(mean(MonthlyCharges), 2)
  )

# Distribution of monthly charges by churn status
ggplot(df, aes(x = MonthlyCharges, fill = Churn)) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  scale_fill_manual(values = c("No" = "#b0bec5", "Yes" = "#e53935")) +
  labs(
    title = "Distribution of Monthly Charges by Churn Status",
    subtitle = "Churned customers tend to be on higher charge plans",
    x = "Monthly Charges ($)",
    y = "Count"
  ) +
  theme_minimal()

# Save
ggsave("exports/charges_distribution.png", width = 8, height = 5)
