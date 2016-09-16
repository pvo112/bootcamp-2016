ChickWeight=ChickWeight
data <-ChickWeight
data <- within(data, {
  chick <- factor(Chick)
  diet <- factor(Diet)
  time <- factor (Time)
})

#1 plot and examine if there is a statistical difference between weight of chicks on day 0
#unify weight by diet day 0

datatime0= data[data$time==0, ]
plot(weight~diet, data=datatime0)

#now you have to examine, use anova

Anova1= aov(weight~diet, data=datatime0)
summary(Anova1)
TukeyHSD(Anova1)
#no significant differences

#2 tukey test if significant

#3 summary(aov (weight~Diet*Time+Error(Chick)data=data))
#4 plotting time by weight 
#5 create empty plot to plot lines for each chick
#plot(NA, xlim=c(min value x, max value x), ylim = c (min value of y, max value of y))
#for (ii in 1:50) { use.rows=}

