df <- data.frame(h = c(100,115,160,160,175,190,190,195), 
                 w = c(10,15,65,80,75,100,110,80))
View(df)

plot(df)
mod_lin <- lm(w~h-1, df)
#lm(formula=w~h-1, data = df)
mod_lin
summary(mod_lin)

mod_cube <- lm(w~ I(h^3) - 1,df)
mod_cube
summary(mod_cube)

res_lin = predict(mod_lin, h = df$h)
res_lin

?predict

res_cubic = predict(mod_cube, h = df$h)
res_cubic

residual_lin <- res_lin - df$w
residual_lin

residuals(mod_lin)

residual_cubic <- res_cubic - df$w
residual_cubic

accuracy_lin <- sqrt(mean(residual_lin^2)) #sum(residual_lin^2)/length(residual_lin)
accuracy_lin

length(residual_lin)

accuracy_cubic <- sqrt(mean(residual_cubic^2)) #sum(residual_cubic^2)/length(residual_cubic)
accuracy_cubic
