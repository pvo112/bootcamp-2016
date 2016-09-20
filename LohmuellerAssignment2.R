#1. using code from class
snpsDataFrame=read.table('hapmaps.txt',header=TRUE)
snps=as.matrix(snpsDataFrame) #convert data frame to matrix
freq=sum(testSNP,na.rm=TRUE)/(2.0*sum(!is.na(testSNP)))
#freq of minor allele ^
#functions for data
calc_freq=function(x){
  return(sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x))))
}

calc_het=function(x){
  return(sum(x==1,na.rm=TRUE)/(sum(!is.na(x))))
}
#apply function to each SNP
freq=apply(snps,1,calc_freq) #creates a vector with 1 value per SNP
het=apply(snps,1,calc_het)

#applying chi square to the values
compute_chisquare_2=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #note, here we don't multiply by n
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}
chisqs=apply(snps,1,compute_chisquare)
chisqs2=apply(snps,1,compute_chisquare_2)
#a. save p-values in vector called pvals, in code
pvals=pchisq(chisqs,1,lower.tail=FALSE)

#b. proportion of p-values from test using vector called pvals
    #<0.05 is 181/ total pvals = 0.04509218
pvals=pchisq(chisqs,1,lower.tail=FALSE)

signifthres<-0.05
sum(pvals<signifthres)/length(pvals)
#ans is 181/ total pvals= 0.04509218

# proportions of pvalues <0.05 is 181/ total pvals = 0.04509218
signifthres<-0.01
sum(pvals<signifthres)/length(pvals)
#proportion of pvalues <0.01 = 0.01021425
signifthres<-0.001
sum(pvals<signifthres)/length(pvals)
#proportion of pvalues <0.001= 0.00124564


#c.save the number of p-values you have as num_pval
num_pval <- length(pvals)

#d. calc the vector of expected P-values for the chi-square test.
exp_pvals <-rep(0, num_pval)

for (n in 1:length(pvals)) 
{ exp_pvals[n] <- n/num_pval}

#e. sort P-values
sort_pvals <-sort(pvals, decreasing =FALSE)


#f. find -log10 of observed and expected P-values
log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pvals)

#g. Plot QQ Plot plotting "log_sort_pvals vs log_exp_pvals

plot(log_exp_pvals, log_sort_pvals, 
     xlab="-log10(expected P-value)", 
     ylab= "-log10(expected P-value)"
     )

#h. Add diagonal line to QQ plot
abline(0, 1)








#QUESTION 2
#PART A -----load phenotypes and store in dataframe zz
read.table ('phenotypes.txt', header=TRUE)
zz <- read.table ('phenotypes.txt', header=TRUE)


#PART B-----find value such that 25% of individuals have phenotypes less than value
#Q1 value using quantile

quantile(zz$glucose_mmolperL, 0.25) #specifying to look at glucose column only
 #value with 25% of distribution below= 4.768756

#PART C----find value of phenotypes with 25% of phenotypes ABOVE(75% below)

quantile(zz$glucose_mmolperL, 0.75)

#value solved= 7.354975


#PART D----- Density plot of distr of phenotypes; add verticle lines denoting 25% tailand 75% tail

hist(
  zz$glucose_mmolperL, 
  xlab= "glucose levels (mm/L)", main= "Density plot of Glucose level phenotypes"
  )
abline(v=quantile(zz$glucose_mmolperL, 0.25), col= "red")
abline(v=quantile(zz$glucose_mmolperL, 0.75), col= "blue" )