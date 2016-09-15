?rnorm
rm(list=ls())
#testing heights of people living in LA

rnorm(h, mean=69, sd=10) #generating normal distribution with average 69 inches and sd 10 inches

#function get_heights to draw a random sample of individuals

get_heights <- function (n) { #function to get random samples and calculate the average of that sample
  heights <- rnorm(n, mean=69, sd=10)
  mean (heights)
  }
get_heights(100)
mean_heights_100 <- rep(1, 1000)
 
for (k in 1:1000) {
  mean_heights_100[k] <- get_heights(100)}

hist(mean_heights_100) #histogrm for mean_heights_100 vector


mean_heights_1000 <- rep(0, 1000)

for (k in 1:1000) {
  mean_heights_1000[k] <-get_heights(1000)
}


hist(mean_heights_1000) #histogram for mean_heights_1000 vector

#create so that histograms have the same number of bins

bins <-seq(65, 73, by=0.5)

hist(mean_heights_100, breaks=bins)
counts_100= hist(mean_heights_100, breaks=bins)$counts
counts_1000=hist(mean_heights_1000, breaks=bins)$counts


#how to call up a barplot with both data sets
barplot(
  rbind (counts_100, counts_1000), 
        col=c(2,4), 
        beside=T, 
        names.arg = seq(65, 72.5, by=0.5),
        xlab="Average Height (inches)",
        ylab="count"
)
#sequence at names.arg is 1 less than the sequence length for the "bins" because the number of boundaries is 1 more than the number of counts

legend(
  0, 300, c("n=100","n=1000"),fill= c("red", "blue")
)

#running this script should give the plot for exercise 1