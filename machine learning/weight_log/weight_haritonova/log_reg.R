df <- data.frame(h = c(100,115,160,160,175,190,190,195), 
                 w = c(10,15,65,80,75,100,110,80))
View(df)

plot(df)
mod_log <- glm(w~h, data = df, family = "binomial")
summary(mod_log)
pr = predict(glm,type="response")


library(ISLR)
#Ex.1
?Weekly

l1 = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
         data = Weekly, family = binomial)
summary(l1)
probs = predict(l1, type="response")
probs[1:5]
contrasts(Weekly$Direction)
pred = ifelse(probs > 0.5, "Up", "Down")
table(pred, Weekly$Direction)
mean(pred == Weekly$Direction)


#200
auto = read.csv("Auto.csv")
med = median(auto$mpg)
med
mpg01 = ifelse(auto$mpg > med, 1, 0)
mpg01
auto = data.frame(auto, mpg01)
lrnSet = sample(nrow(auto),200) 
l1 = glm(mpg01 ~ displacement + horsepower + weight + acceleration,
         data = auto, family = binomial, subset = lrnSet)
summary(l1)
probs = predict(l1, newdata = auto[-lrnSet,],type = "response")
pred = ifelse(probs > 0.5, 1, 0)
#pred
mean(pred == mpg01[-lrnSet])
k = table(pred, mpg01[-lrnSet])
k
k[1,1]/sum(k[,1])
k[2,2]/sum(k[,2])


