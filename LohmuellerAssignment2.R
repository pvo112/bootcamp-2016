#1. using code from class


#a. save p-values in vector called pvals, in code


#b. proportion of p-values from test using vector called pvals
    #<0.05 is 181/ total pvals = 0.04509218
pvals=pchisq(chisqs,1,lower.tail=FALSE)

signifthres<-0.05
sum(pvals<signifthres)/length(pvals)
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








#2