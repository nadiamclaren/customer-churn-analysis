install.packages(c("tidyverse", "RSQLite", "DBI"))

library(tidyverse)
library(RSQLite)
library(DBI)


raw <- read_csv("data/WA_Fn-UseC_-Telco-Customer-Churn.csv")

glimpse(raw)

# ---- Split into four tables ----

customers <- raw %>%
  select(customerID, gender, SeniorCitizen, Partner, Dependents, tenure)

services <- raw %>%
  select(customerID, PhoneService, MultipleLines, InternetService,
         OnlineSecurity, OnlineBackup, DeviceProtection,
         TechSupport, StreamingTV, StreamingMovies)

billing <- raw %>%
  select(customerID, Contract, PaperlessBilling, PaymentMethod,
         MonthlyCharges, TotalCharges)

churn <- raw %>%
  select(customerID, Churn)

# ---- Save each table as a CSV ----

write_csv(customers, "data/customers.csv")
write_csv(services,  "data/services.csv")
write_csv(billing,   "data/billing.csv")
write_csv(churn,     "data/churn.csv")

cat("Done! Four CSV files written to your data folder.\n")