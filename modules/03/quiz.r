# CSC 532 - Brian Anderson - R Notebook File
# Module 3 Assignment # 1 - Problem 1
# Explore Vegas Hotel Trip Advisor Data Set from UIC ML repo
# data/vegashotels-1.csv
library(gmodels)

filename = "/Users/andewx/go/src/github.com/andewx/aiml/modules/03/data/2016.csv"
flight.data <- read.csv(filename,sep=",", stringsAsFactors=TRUE, header=TRUE, strip.white=TRUE)


#Mode function
Mode = function(x){
    ta = table(x)
    tam = max(ta)
    if (all(ta == tam))
         mod = NA
    else
         if(is.numeric(x))
    mod = as.numeric(names(ta)[ta == tam])
    else
         mod = names(ta)[ta == tam]
    return(mod)
}

#Create subsets

print(str(flight.data))

mytable=table(flight.data$OP_CARRIER , flight.data$DEP_DELAY)

plot(flight.data$DEP_DELAY~flight.data$OP_CARRIER, col="red")
