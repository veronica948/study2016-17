
test_url <- "test.csv"
test <- read.csv(test_url)
test
str(test)

train_url <- "train.csv"
train <- read.csv(train_url)
train
str(train)

# absolute numbers
table(train$Survived) 
prop.table(table(train$Survived)) #proportions

table(train$Sex, train$Survived)

prop.table(table(train$Sex, train$Survived),1)

train$Child <- NA
train$Child[train$Age < 18] <- 1
train$Child[train$Age >= 18] <- 0

prop.table(table(train$Child, train$Survived),1)

test_one <- test
test_one$Survived <- 0
test_one$Survived[test_one$Sex == "female"] <-1

