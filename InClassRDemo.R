setwd()
getwd
getwd()
?lm
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept
anova(lm.D9)
#copying and pasting example for lm to figure out how it works or how I can use it(above)
ls()
rm(group)
ls()
rm(list = ls())
ls()
list()
#rm (list = ls ()) allows us to remove all variables we have been working with from our directory 
#source command allows linking to an r script that has a function you've already written
source()
list.files()
tt <- read.tree("tree.tre")
#opening the file ape, checking files in the folder, then assigning the tree 
library(ape)
list.files()
tt
str(tt)
?read.tree
attributes(tt)
