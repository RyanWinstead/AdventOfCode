#advent of Code Day 1 : Calorie Counting

##read in elfCalories.txt and create dataframe
Elffile <- readLines("elfCalories.txt", skipNul = FALSE)
dfmain<- data.frame(matrix(ncol = 2, nrow = 0))
colnames(dfmain) <- c("elf", "calories")
#iterate through lines in elfCalories.txt and sum values held by each elf
cnt <-1
calorieSum <- 0
for(ln in Elffile){
  if(ln == ""){      #when line is blank, this is a new elf.
    elfRow <- c(cnt,calorieSum)
    dfmain[nrow(dfmain)+1,] <- elfRow     # Append sum to dataframe and
    cnt<- cnt+1
    calorieSum <- 0}                      # Reset calorie counter
  
  else{calorieSum<- calorieSum + strtoi(ln)}    #summing calorie values..
  
  if(ln == tail(Elffile, n=1)){   #      only triggers at very last line of elfCalories.txt
      calorieSum<- calorieSum + strtoi(ln)
      elfRow <- c(cnt,calorieSum)
      dfmain[nrow(dfmain)+1,] <- elfRow}
}

#finds the max value under column 'calories'
print(paste("the Elf with the most calories is holding",dfmain[which.max(dfmain$calories), 2],"calories!"))
