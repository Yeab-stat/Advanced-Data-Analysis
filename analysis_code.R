---
title: "ADA 1"
author: "Yeabtsega"
date: "2025-09-03"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```
```{r}
library(dplyr)
C1survey <- read.csv("https://raw.githubusercontent.com/kijohnson/Advanced-Data-Analysis/main/Class%201%20Survey%20Fall%202025%202.csv")

head(C1survey)
```
```{r}
# a. Number of observations (rows)
n_obs <- nrow(C1survey)

# b. Number of variables (columns)
n_vars <- ncol(C1survey)

n_obs
n_vars
```
```{r}
names(C1survey) <- c("id", "like_cats", "like_dogs", "have_desert", "slogan", "fav_day", 
                     "larkORowl", "fav_food", "fav_drink", "fav_season", "fav_month", 
                     "hobby", "program", "specialization", "stat_software", "R_exp", 
                     "coding_comfort", "coding_length", "top_three", "public_health_interest", 
                     "fav_num", "bday", "bmonth", "country", "state", "city", "highest_educ_level")

# Display new column names
names(C1survey)
```
```{r}
sapply(C1survey, class) |> table()
```
```{r}
class(C1survey$bday)
class(C1survey$bmonth)

# Convert to numeric if not already
C1survey$bday <- as.numeric(as.character(C1survey$bday))
C1survey$bmonth <- as.numeric(as.character(C1survey$bmonth))

# a. Check for unusual/missing values
table(C1survey$bday, useNA = "ifany")
table(C1survey$bmonth, useNA = "ifany")

# b. If unusual values exist (e.g., 0, >31 for days or >12 for months), remove or set to NA
C1survey$bday[C1survey$bday < 1 | C1survey$bday > 31] <- NA
C1survey$bmonth[C1survey$bmonth < 1 | C1survey$bmonth > 12] <- NA

# c. Median values
median_day <- median(C1survey$bday, na.rm = TRUE)
median_month <- median(C1survey$bmonth, na.rm = TRUE)

median_day
median_month
```
```{r}
# a. Create bseason variable
C1survey$bseason <- ifelse(C1survey$bmonth %in% c(12, 1, 2), "Winter",
                    ifelse(C1survey$bmonth %in% c(3, 4, 5), "Spring",
                    ifelse(C1survey$bmonth %in% c(6, 7, 8), "Summer", 
                           ifelse(C1survey$bmonth %in% c(9,10,11),"Fall", NA))))

# b. Table of seasons vs months
table(C1survey$bmonth, C1survey$bseason)

# c. Add margins to count classmates per season
addmargins(table(C1survey$bseason))
```
```{r}
# Question: How many students are morning larks vs night owls?
table(C1survey$larkORowl)

# Example analysis: Proportion
prop.table(table(C1survey$larkORowl))
```
```{r}
write.csv(C1survey, "Calss1_survey.csv", row.names = FALSE)
```

```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
