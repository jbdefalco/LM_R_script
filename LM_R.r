df = read.csv("regrex1.csv")

head(df)

plot(df$x,df$y)

model = lm(y~x, data = df)

summary_stats = summary (model)

summary_stats

summary(model)$r.squared

coef(model)

coef(model)[1]

coef(model)[2]

y_predict = predict(model, df)

plot(df$x, y_predict)

plot(df$x,df$y)
lines(df$x,y_predict)

#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Please provide exactly one argument: the path to the CSV file.")
}

file_path <- args[1]

#pull in data
data <- read.csv(args)


# Generate scatter plot and save as r_orig.png
png(file = "r_orig.png")
plot(data$x, data$y)
title('Scatter Plot R')
dev.off()

# Perform linear regression
lmData <- lm(y ~ x, data = data)

# Predict values
pred <- predict(lmData, data)

# Generate combined plot and save as r_lm.png
png(file = "r_lm.png")
plot(data$x, data$y)
lines(data$x, pred, col = "red")
title('Combined Plot R')
dev.off()