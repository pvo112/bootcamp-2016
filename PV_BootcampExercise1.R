#Exercise 1 Loop statement to generate 8 \n ending in an "*" on the next line
lol <- 1:9
lol
for (lol in 1:9){
  cat("\n") 
  if (lol ==9) {
    cat ("*")
    }
  }



  #Exercise 2 modified loop printing 10 asterisks with each asterisk separated by one (&) with no spaces or new line characters
for (lol in 1:9){
    cat ("*")
  if (lol != 9) {cat ("&")
    }
  }



# Exercise 3 by hand, figure out the initial values of these variables and values at the the start and end of each iteration of the loop
dogs <- 10;
for (i in 1:5){
  dogs <- dogs + 1; 
}
#Answerstyle= iteration number = initial value, end value
#1st iteration= 10, 11;2nd iteration= 11, 12; 3rd iteration=12, 13; 4th iteration= 13, 14; 5th iteration=14, 15

meatloaf <- 0; 
for (i in 5:9){
  meatloaf <- meatloaf - i + 1;
  cat(meatloaf) 
  #answer style= iteration # (i= number)= start value, end value
#1st iteration (i==5)= 0, -4; 
#2nd iteration (i==6)= -4, --9; 
#3rd iteration (i==7)=-9, -15; 
#4th iteration (i==8)= -15,-22; 
#5th iteration (i==9)=-22, -30
  
  bubbles <- 12;
  for (i in -1:-4){
    bubbles <- i;
  }
  #answer style= iteration number= start  value, end value
#1st iteration = 12, -1
  #2nd iteration= -1, -2
  #3rd iteration = -2, -3
  #4th iteration= -3, -4
  
  
  
  #exercise 4 modify this code so that it will print out a message during presidential as well as congressional election years
  
  ###you can use the if statement with the modulus operator to conditionally perform operations
  years <- c( 2015, 2016, 2018, 2020, 2021)
  for(ii in 1:length(years)){
    if(years[ii] %% 2 == 0){
      cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
    }
    if(years [ii] %% 4 ==0){
      cat (years[ii], 'Oh great, presidential elections...', sep ='\t', fill = T)
    }
    
  }
  
  
  
  
  #exercise 5 modify this loop so that the loop will compund the interest?
  bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
  compounded <- rep(NA, 6)
  interestRate <- 0.0125;
  for (i in 1:length(bankAccounts)) {
    compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }
  
  compounded
  
  
  
  
  
  #exercise 6 we now want to compound the interest annually, but across a period of 5 years. The for loop we discussed earlier only compounds for a single year. Try this:
  
  
  bankAccounts <- c(10, 9.2, 5.6);
  interestRate <- 0.0525;   
  house <- c(4.8, 3.8, 5.7); 
  food<- c(3.5, 4.3, 5.0);  
  fun <- c(7.8, 2.1, 10.5);  
  
  income <- c(21, 21, 21); 
  

  for (j in 1:5) {
    for (i in 1:length(bankAccounts)) {
      bankAccounts[i] <- bankAccounts[i] + income[i] - house[i] - fun[i] - food[i]
      bankAccounts[i] <- bankAccounts[i] + bankAccounts[i]*interestRate
      }
  }
  bankAccounts
  
  
  
  
  #exercise 7 modified 5-year interest-compounding code from 2015-2020 and odd numbered years, students 1 and 3 get trust fund disbursements of $5000
  bankAccounts <- c(10, 9.2, 5.6);
  interestRate <- 0.0525;
  house <- c(4.8, 3.8, 5.7); 
  food<- c(3.5, 4.3, 5.0); 
  fun <- c(7.8, 2.1, 10.5);
  income <- c(21, 21, 21);
  years <-c(2015:2020)
  
  for (j in 1:length(years)) {
    for (i in 1:length(bankAccounts)) {
      bankAccounts[i] <- bankAccounts[i] + income[i] - house[i] - fun[i] - food[i]
      bankAccounts[i] <- bankAccounts[i] + bankAccounts[i]*interestRate
        if (years[j] %% 2!= 0) {
          bankAccounts[1] <- bankAccounts[1] +5;
          bankAccounts[3] <- bankAccounts[3] +5}
      }
  }
  bankAccounts
  
  
  
  #exercise 8 use a while loop to sum all numbers from 1:17. You will need to use a counter variable (like index seen in class).
  nsum <-0
n <-1
  while(n <= 17) {
    nsum=nsum+n
    n=n+1
  }


#exercise 9 write a function takes a number, and prints ‘small’ if number less than or equal to -1; ‘medium’ if between -1 and + 1’big’ if greater than or equal to + 1

printsize <- function(n){
  if (n <= -1) {cat ("small")}
  if (n >= 1) {cat ("big")}
  else {cat ("medium")}
}
printsize(0)