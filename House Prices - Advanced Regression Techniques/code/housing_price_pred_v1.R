
### Data Exploration
data.train <- read.csv("./House Prices - Advanced Regression Techniques/data/train.csv", header=T)
data.test  <- read.csv("./House Prices - Advanced Regression Techniques/data/test.csv", header=T)

### Data Preperation

### Model Building
#reg.model <- lm(SalePrice ~ ., data=data.train[,c(2:6,8,9,11:72,76:81)])
reg.model <- lm(SalePrice ~ ., data=data.train[,c(2:6,8,9,76:81)])
reg.model <- step(reg.model)

### Model Deployement
data.pred <- predict(reg.model, data.test[,c(2:6,8,9,76:80)])

### Data Submission
data.submit <- data.frame(Id=data.test$Id, SalePrice=data.pred)
write.csv(data.submit, file="./House Prices - Advanced Regression Techniques/results/submission.csv", row.names=F)

