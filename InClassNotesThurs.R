x <-c(1, 5, 10, 45)
x
mean(x)
x*2
sum(x)
x=sample(20)

#give it a vector and take sample of size at random; can specify with or without replacement
sample(x, size=2)

#allows draw at random from my vector
sample(x[1:3], size=2, replace=TRUE)

#allows for drawing samples and gives a higher chance of getting values twice
x=seq(50,60)
x[2:4] #specifying picking up the 2nd to 4th value of x
x[c(2,4)]# to pick up specific values without values in between, create a vector within the square brackets
x[-2] #gives you the whole vector but omits the 2nd element/ whichever element has the - before it



#use a vector and turn the vector into a matrix by speifyng how many rows and columns we want
x=1:10
y <- matrix(x, nrow=2, ncol=5)
y
#use square bracket notation to pull out a particular row(vector) or cell
y[2,]#pulling out the second row whole row without specifying column
#to fill in a matrix by row instead of by column, can specify
y <- matrix(x, nrow=2, ncol=5, byrow=TRUE)#now you filled rows first!
y
#continuing these notes now assuming we filled by column instead
t(y) #transpose and flip the matrix a little



#dataframes and dealing with missing values NA
x<- c(5, 3, 4, NA)
mean(x)
mean(x, na.rm=TRUE) #allows ignore the NA value and still perform function

#goal= take mean of row of vector
#initializing the value of z then make a for loop to use mean function for matrix y, row i
z<-rep(0,2)

for (i in c(1:2)) {
  z[i] <- mean(y[i,])
}
#do the same function with "Apply" function
apply(y, 1, mean) #1 is rows and 2 is to check mean of column, can look up on help file

pwd

#subset will apply a logical test and returns what falls into that subset (i.e. whole row)
