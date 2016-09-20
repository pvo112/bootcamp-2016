ChickWeight=ChickWeight
data <-ChickWeight
data <- within(data, {
  chick <- factor(Chick)
  diet <- factor(Diet)
  time <- factor (Time)
})

#QUESTION 1----- plot and examine if there is a statistical difference between weight of chicks on day 0
#unify weight by diet day 0

datatime0= data[data$time==0, ]
plot(weight~diet, data=datatime0)

#now you have to examine, use anova

Anova1= aov(weight~diet, data=datatime0)
summary(Anova1)

#summary(Anova1)
#             Df Sum Sq Mean Sq F value Pr(>F)
#diet         3   4.32   1.440   1.132  0.346
#Residuals   46  58.50   1.272   
TukeyHSD(Anova1)

#Tukey multiple comparisons of means
#95% family-wise confidence level

#Fit: aov(formula = weight ~ diet, data = datatime0)

#$diet
#diff       lwr       upr     p adj
#2-1 -0.7 -1.864187 0.4641869 0.3872164
#3-1 -0.6 -1.764187 0.5641869 0.5219101
#4-1 -0.4 -1.564187 0.7641869 0.7965223
#3-2  0.1 -1.244287 1.4442873 0.9971988
#4-2  0.3 -1.044287 1.6442873 0.9331261
#4-3  0.2 -1.144287 1.5442873 0.9786117

#no significant differences



#QUESTION 2------Plot chick weights to different diet treatments at day 21
datatime21= data[data$time==21, ]
plot(weight~diet, data= datatime21)
#check statistical differences

Anova2=aov(weight~diet, data=datatime21)

summary(Anova2)

#summary(Anova2)
#Df Sum Sq Mean Sq F value  Pr(>F)   
#diet         3  57164   19055   4.655 0.00686 **
#  Residuals   41 167839    4094                   
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#there are significant values for differences in weight based on diet

TukeyHSD(Anova2)

#Tukey multiple comparisons of means
#95% family-wise confidence level

#Fit: aov(formula = weight ~ diet, data = datatime21)

#$diet
#diff        lwr       upr     p adj
#2-1  36.95000  -32.11064 106.01064 0.4868095
#3-1  92.55000   23.48936 161.61064 0.0046959
#4-1  60.80556  -10.57710 132.18821 0.1192661
#3-2  55.60000  -21.01591 132.21591 0.2263918
#4-2  23.85556  -54.85981 102.57092 0.8486781
#4-3 -31.74444 -110.45981  46.97092 0.7036249

#QUESTION 3--------- summary(aov (weight~Diet*Time+Error(Chick)data=data))
summary(aov(weight~Diet*Time+Error(Chick),data=data))

#Error: Chick
#Df Sum Sq Mean Sq F value   Pr(>F)    
#Diet       3 155863   51954   7.221 0.000482 ***
#  Time       1  55175   55175   7.668 0.008197 ** 
#  Diet:Time  1   2482    2482   0.345 0.559984    
#Residuals 44 316586    7195                     
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Error: Within
#Df  Sum Sq Mean Sq F value Pr(>F)    
#Time        1 1962914 1962914 3049.28 <2e-16 ***
#  Diet:Time   3   84222   28074   43.61 <2e-16 ***
#  Residuals 524  337315     644                   
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


#QUESTION 4-------- plot effects of diet on chick growth
#plotting time by weight and color code diet
plot(as.numeric (data$time), data$weight, pch=19)

cols= sub('1', "blue", data$diet)#setting up the colors to diet coding
cols= sub('2', "hotpink", cols)
cols= sub('3', "purple", cols)
cols= sub ('4', "green", cols)
#currently if ploted, everything is in black
#figure out how to plot in color

plot(as.numeric(
  data$time), data$weight, 
     xlab= "time", ylab= "weight", main= "Effect of Diet on ChiCkWeight", 
     col=cols, #adding color to the scale
     pch=19, las=1, cex.axis=1.5, cex.lab=1.5#pch 19 colors in circles
     ) #pch19 colors in circles
legend (
  "topleft", title="Diet", 
        legend=unique(data$diet), 
        text.col= c("blue", "hotpink", "purple", "green")
        )

#Question 5----- create empty plot to plot lines for each chick
#plot(NA, xlim=c(min value x, max value x), ylim = c (min value of y, max value of y))
#for (ii in 1:50) { use.rows=}

plot(NA, ylim=c(0,370), xlim=c(0,21), 
     xlab="Time", ylab="Weight", 
     main="Individual Chick Growth Through Time")
colors=rainbow(50)

for(c in 1:50) {
  use.rows=which(data$Chick == c)
  lines(x=data$Time[use.rows],
        y=data$weight[use.rows], col=colors[c])
}
