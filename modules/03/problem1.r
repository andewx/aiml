# CSC 532 - Brian Anderson - R Notebook File
# Module 3 Assignment # 1 - Problem 1
# Explore Vegas Hotel Trip Advisor Data Set from UIC ML repo
# data/vegashotels-1.csv
library(gmodels)
filename = "/Users/andewx/go/src/github.com/andewx/aiml/modules/03/data/vegashotels-1.csv"
data_frame <- read.csv(filename,sep=";", stringsAsFactors=TRUE, header=TRUE, strip.white=TRUE)


# 1) Explore the overall structure of the dataset using str(). When you read the data,
# set StringAsFactors=True to let R convert String variables to factors.
str(data_frame)
summary(data_frame)


# 2) Are there any missing values?
print("Number of missing values - ")
count = sum(is.na(data_frame))
print(count)

# 3) Draw a histogram of the score variables. Interpret the histogram
str(data_frame$Score)
hist(data_frame$Score, main="Histogram of score values", xlab="Score(1-5)")

# Histogram shows frequency of scores, which also indicates the general distribution
# Our distribution is left skewed with the mean to the right of the median

# 4) Find the mode of score
score_table = table(as.vector(data_frame$Score))
print("Mode of the scores - ")
print(names(score_table)[score_table == max(score_table)])

# Mode is 5


# 5) Use the quantile function to get quantiles for score, what is the median of score

q_str = quantile(data_frame$Score, seq(from = 0, to = 1, by =0.25))
print(q_str)

# Median score is 4

# 6) Use the ifelse function pass in a factor variable sentiment of "positive" or "negative"
# take a summary of sentiment to make sure the frequencies of the categories are consistent with the values of score.
# e.g. positive sentimment should be equal to the frequency of 4 and 5 for Score

print("Generate Sentiment")
sentiment = ifelse(data_frame$Score >= 4, "positive", "negative")
summary(sentiment)

# 7) Use stat tests and plots to determine if sentiment is associated with Variables
# pool, gym, Free.Internet, Period.of.Stay, traverler.type, hotel.stars. using an
# alpa of 0.01.

print("Test Bivariate Categorical Variables")

mosaic_pool = table(sentiment, data_frame$Pool)
mosaic_gym = table(sentiment, data_frame$Gym)
mosaic_int = table(sentiment, data_frame$Free.internet)
mosaic_stay = table(sentiment,data_frame$Period.of.stay)
mosaic_type = table(sentiment, data_frame$Traveler.type)
mosaic_star = table(sentiment,data_frame$Hotel.stars)

#Mosaic Plot Each
mosaicplot(mosaic_pool, xlab="Sentiment", ylab="Feature", main="Pool/Sentiment", shade=TRUE)
mosaicplot(mosaic_gym, xlab="Sentiment", ylab="Feature", main="Gym/Sentiment", shade=TRUE)
mosaicplot(mosaic_int, xlab="Sentiment", ylab="Feature", main="Internet/Sentiment", shade=TRUE)
mosaicplot(mosaic_stay, xlab="Sentiment", ylab="Feature", main="Stay/Sentiment", shade=TRUE)
mosaicplot(mosaic_type, xlab="Sentiment", ylab="Feature", main="Type/Sentiment", shade=TRUE)
mosaicplot(mosaic_star, xlab="Sentiment", ylab="Feature", main="Stars/Sentiment", shade=TRUE)

#Remove tables
rm(mosaic_pool)
rm(mosaic_gym)
rm(mosaic_int)
rm(mosaic_stay)
rm(mosaic_type)
rm(mosaic_star)

#Cross Tables

cross_pool = CrossTable(sentiment, data_frame$Pool, chisq=TRUE)
cross_gym = CrossTable(sentiment, data_frame$Gym, chisq=TRUE)
cross_int = CrossTable(sentiment, data_frame$Free.internet, chisq=TRUE)
cross_stay = CrossTable(sentiment,data_frame$Period.of.stay, chisq=TRUE)
cross_type = CrossTable(sentiment, data_frame$Traveler.type, chisq=TRUE)
cross_star = CrossTable(sentiment,data_frame$Hotel.stars, chisq=TRUE)

#Chi Sq Test Each
chisq.test(cross_pool)
chisq.test(cross_gym)
chisq.test(cross_int)
chisq.test(cross_stay)
chisq.test(cross_type)
chisq.test(cross_star)


print("Done...")

# The following correlations could be inferenced from the Bivariate Categorical Analysis
# Sentiment scores

# Sentiment/Hotel Stars: The less stars the more likely it was that a review
# would display a negative sentiment feature by mosaic plot residuals.
# Rejection of null hypothesis with p-value 0.00000039 indicates association

# Sentiment/Pool: Shows a positive residuals in the presence of NO pool and negative
# review association. P-Value 0.0001 indicates potential for association

# Sentiment/Gym: P-value 0.95 with no mosaic residuals. Assume no correlation

# Sentiment/Internet: Mosaic residual is positive for NO internet and negative reviews.
# P-Valiue of 0.0021 suggests correlation

# Sentiment/Period of Stay: No mosaic residuals/ P-Value = 0.35 accept null hypothesis

# Sentiment/Traveler Type: No residuals / P-Value = 0.6 accept null hypothesis
