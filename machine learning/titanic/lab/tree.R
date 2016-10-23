test_url <- "test.csv"
test <- read.csv(test_url)
test
str(test)

train_url <- "train.csv"
train <- read.csv(train_url)
train
str(train)

library(rpart)

#two variables
tree1 <- rpart(Survived ~ Sex + Age,data = train, method ="class")
tree1
plot(tree1)
text(tree1)

prediction1 <- predict(tree1, test, type = "class")
solution1 <- data.frame(PassengerId = test$PassengerId, Survived = prediction1)
write.csv(solution1, file = "solution1.csv", row.names = FALSE)

#all variables
tree2 <- rpart(Survived ~ Pclass + Sex + Age + SibSp +Parch + Fare + Embarked, data = train, method = "class")
plot(tree2)
text(tree2)

#predictions
prediction2 <- predict(tree2, test, type = "class")
solution2 <- data.frame(PassengerId = test$PassengerId, Survived = prediction2)
write.csv(solution2, file = "solution2.csv", row.names = FALSE)


#some variables
tree3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Fare, data = train, method = "class")
plot(tree3)
text(tree3)

prediction3 <- predict(tree3, test, type = "class")
solution3 <- data.frame(PassengerId = test$PassengerId, Survived = prediction3)
write.csv(solution3, file = "solution3.csv", row.names = FALSE)

##########################
# Load in the packages to build a fancy plot
# library(rattle)
# library(rpart.plot)
# library(RColorBrewer)
# Time to plot your fancy tree
#fancyRpartPlot(tree2)
