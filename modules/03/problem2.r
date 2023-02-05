#CSC 532 Assignment 1
# Problem2 - Brian Anderson
# All scripted analysis functions will run in this script which may take a long time

library(gmodels)
filename = "/Users/andewx/go/src/github.com/andewx/aiml/modules/03/data/housing-1.csv"
data_frame <- read.csv(filename,sep=",", stringsAsFactors=TRUE, header=TRUE, strip.white=TRUE)


#1- (0.5 pt) Explore the structure of dataset. How many numerical and
#categorical attributes are there in the dataset

str(data_frame)

## 10 Variables with 9 Numerical and 1 Categorical

#2- (0.5 pt) Take a summary statistics of the dataset.Does any of the variables have
#missing values?

print(summary(data_frame))

# 207 missing values attributed to bedrooms missing values

#3- (0.5 pt) What percentage of the rows have missing values in one or more variables? You
#can use the function “complete.cases” to get a logical vector indicating whether each row
#is complete (has no missing value) or incomplete (has one or more missing values). Run
#?complete.cases to get help on this function in R. Use the logical vector returned by
#complete.cases to count the number of incomplete cases.

missing = length(which(complete.cases(data_frame) == FALSE))
percent = missing/length(data_frame$longitude)
cat("Percent missing: ", percent*100, "%\n")

#1% of cases are missing


#4- (0.5 pt) Remove the rows with missing values. You can use either “complete.cases”
#function or “na.omit” function for this purpose. Run ?na.omit in R to get help on these
#functions and to see some examples.

data_frame <- na.omit(data_frame)


#5- (0.5 pt) Draw a histogram and boxplot of the median_house_value. What can you say
#about the shape of median_house_value? Is the median_house_value sample positively
#skewed, symmetric, or negatively skewed?

hist(data_frame$median_house_value, xlab="median house value", ylab="frequency", main="Median house value histogram")
boxplot(data_frame$median_house_value, ylab="Median house price range", main="Median House Value Boxplot")

#histogram shows a right skewed guassian distribution
#boxplot is not showing outliers which is suspiscious


#6- (0.5 pt)Use Q-Q plot to examine if the distribution of median_house_value
#is approximately normal?

qqnorm(data_frame$median_house_value, main="Distribution of Median House Values relative to normal distributions")

#Q-Q plot is quasi-linear with a potential quadratic (parabolic distribution) while samples
# past the second std deviation of normal distribution shows a flat line indicating right
# skewedness of the sample data. Therefore we can say that the distribution is relatively
# right skewed and normal.


#7- (0.5 pt) Use IQR method to find outliers of the median_house_value attribute. How
#many outliers does this attribute have?


IQR <- IQR(data_frame$median_house_value)
left <- 119600 - 1.5*IQR
right <- 264725 + 1.5*IQR
x <- data_frame$median_house_value
outliers = x[x < left | x > right]
cat("Median House Value Outliers Length: ", length(outliers), "\n")

## 1064 Outliers


#8- (1 pt) Does any of the numerical attributes have a positive/negative linear
#correlation with median_house_value? Use scatter plots and correlation matrix to
#answer this question.

attributes = data_frame[,c("median_house_value", "longitude", "latitude", "housing_median_age", "total_rooms", "total_bedrooms", "population", "households", "median_income")]
pairs(attributes)
print("Correlation Matrix for Numerical Variables for Households")
print(cor(attributes))

# Our scatterplot matrix shows a wide amount of variance for house median values
# with little in the way of simple and direct relationships for the median house
# The following categories show broad linear positive relationships:
# (median_income)
# Other categories show a more indirect positive relationship with curvature in
# the relationship an a law of diminishing returns for the increase in the x axis
# (total_rooms, total_bedrooms,  population, households)
# Other variables like latitude and longitude, with no ocrreltaion show no patterns

# Correlation Matrix shows a positive correlation with median income while other
# correlations remain relatively low and somewhat negative.

#9- (0.5 pt) Is there a statistically significant difference between the mean of
#meadian_house_valueacross different levels of ocean_proximity ? Use an
#appropriate plot and statistical test (with significance level alpha=0.01) to answer
#this question


print(oneway.test(median_house_value~ocean_proximity, data=data_frame))

## The mean of the median house values variate significantl;y across levels of
# ocean proximity with p-values < 0.0000000000000002.

#10- (0.5 pt) Use ifelse function to create a new factor variable “Is_Inland” which takes
#the value “Yes” if the ocean_proximity is “Inland” and No” otherwise.

Is_Inland = ifelse(data_frame$ocean_proximity == "INLAND", "Yes", "No")
Is_Inland = as.factor(Is_Inland)
print(summary(Is_Inland))

#11- (0.5 pt) Use side by side box plot to visualize the relationship between “Is_Inland” and
#“medianouse_value”. Is there a significant difference between the means of
#median_house_value for Inland vs not Inland houses? Use an appropriate statistical test
#to answer this question ( use significance level alpha=0.01)

attach(data_frame)
plot(median_house_value~Is_Inland, col="red")
print(t.test(median_house_value~Is_Inland, alternative="two.sided"))


# The side by side box plot shows use that "Yes" factors for the ocean proximity,
# reveal significant outliers for the median house value variables. Because we Are
# now dealing with a categorical variable with only 2 levels we can use a two way
# test which revals a similar p-value of 0.0000000000002 indicating the rejection
# of our null hypothesis.
