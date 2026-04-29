
***Upload the data**
colnames(Combine_data) <- c("country", "year", "code", "literacy",
                            "educ_aid", "gov_spending", "mortality")

Combine_data$log_educ_aid <- log(Combine_data$educ_aid + 1)

head(Combine_data)
pdata <- pdata.frame(Combine_data, index = c("country", "year"))

library(plm)
pdata <- pdata.frame(Combine_data, index = c("country", "year"))

**regressions**
  
  library(lmtest)
library(sandwich)
library(stargazer)

model_ols <- lm(literacy ~ log_educ_aid + gov_spending + mortality, 
                data = Combine_data)

model_fe <- plm(literacy ~ log_educ_aid + gov_spending + mortality,
                data = pdata, model = "within")

model_re <- plm(literacy ~ log_educ_aid + gov_spending + mortality,
                data = pdata, model = "random")

phtest(model_fe, model_re)


# Robust standard errors
coeftest(model_fe, vcov = vcovHC(model_fe, type = "HC1"))

# Regression table
stargazer(model_ols, model_fe, model_re,
          type          = "text",
          column.labels = c("Pooled OLS", "Fixed Effects", "Random Effects"),
          dep.var.label = "Female Literacy Rate",
          star.cutoffs  = c(0.10, 0.05, 0.01))

******

library(ggplot2)
library(dplyr)
library(scales)
library(ggcorrplot)

# Plot 1: Literacy trends
ggplot(Combine_data, aes(x = year, y = literacy, group = country, color = country)) +
  geom_line(alpha = 0.7) +
  labs(title = "Female Literacy Rate Over Time", x = "Year", y = "Literacy (%)") +
  theme_minimal() + theme(legend.position = "none")
ggsave("plot1_literacy_trends.png", width = 12, height = 6, dpi = 300)

# Plot 2: Aid vs literacy
ggplot(Combine_data, aes(x = log_educ_aid, y = literacy)) +
  geom_point(alpha = 0.4, color = "steelblue") +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "Education Aid vs Female Literacy",
       x = "Log Education Aid", y = "Literacy (%)") +
  theme_minimal()
ggsave("plot2_aid_vs_literacy.png", width = 9, height = 6, dpi = 300)

# Plot 3: Mortality vs literacy
ggplot(Combine_data, aes(x = mortality, y = literacy)) +
  geom_point(alpha = 0.4, color = "darkred") +
  geom_smooth(method = "lm", color = "darkred") +
  labs(title = "Mortality Rate vs Female Literacy",
       x = "Mortality Rate", y = "Literacy (%)") +
  theme_minimal()
ggsave("plot3_mortality_vs_literacy.png", width = 9, height = 6, dpi = 300)

# Plot 4: Gov spending vs literacy
ggplot(Combine_data, aes(x = gov_spending, y = literacy)) +
  geom_point(alpha = 0.4, color = "#008080") +
  geom_smooth(method = "lm", color = "#008080") +
  labs(title = "Gov Spending vs Female Literacy",
       x = "Gov Spending (% GDP)", y = "Literacy (%)") +
  theme_minimal()
ggsave("plot4_govspend_vs_literacy.png", width = 9, height = 6, dpi = 300)

# Plot 5: Average literacy by country
Combine_data |> group_by(country) |>
  summarise(avg = mean(literacy)) |>
  arrange(avg) |>
  mutate(country = factor(country, levels = country)) |>
  ggplot(aes(x = avg, y = country, fill = avg)) +
  geom_col() +
  scale_fill_gradient(low = "#fc8d59", high = "#1a9850") +
  labs(title = "Average Female Literacy by Country",
       x = "Avg Literacy (%)", y = NULL) +
  theme_minimal() + theme(legend.position = "none")
ggsave("plot5_avg_by_country.png", width = 9, height = 10, dpi = 300)

# Plot 6: Correlation heatmap
cor_data <- Combine_data[, c("literacy", "log_educ_aid", "gov_spending", "mortality")]
ggcorrplot(cor(cor_data, use = "complete.obs"),
           method = "circle", lab = TRUE,
           colors = c("#d73027", "white", "#1a9850"),
           title = "Correlation Matrix")
ggsave("plot6_correlation.png", width = 7, height = 6, dpi = 300)

library(ggcorrplot)

cor_data <- Combine_data[, c("literacy", "log_educ_aid", "gov_spending", "mortality")]
ggcorrplot(cor(cor_data, use = "complete.obs"),
           method = "circle", lab = TRUE,
           colors = c("#d73027", "white", "#1a9850"),
           title = "Correlation Matrix")
ggsave("plot6_correlation.png", width = 7, height = 6, dpi = 300)

getwd()

stargazer(model_ols, model_fe, model_re,
          type          = "text",
          column.labels = c("Pooled OLS", "Fixed Effects", "Random Effects"),
          dep.var.label = "Female Literacy Rate",
          star.cutoffs  = c(0.10, 0.05, 0.01),
          out = "C:/Users/user/OneDrive/Desktop/regression_results.txt")



