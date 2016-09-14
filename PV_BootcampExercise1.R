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
    
  }