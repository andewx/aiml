#CSC532 - Assignment 1
#Brian Anderson - Problem 3

library(gmodels)

na.zero <- function (x) {
    x[is.na(x)] <- 0
    return(x)
}



path = paste(getwd(), "/r/aiml/modules/03/data/", sep="")
file01 = paste(path , "processed.cleveland.data", sep="")
file02 = paste(path , "processed.hungarian.data", sep="")
file03 = paste(path , "processed.switzerland.data", sep="")
file04 = paste(path , "processed.va.data", sep="")

header = c("age", "sex", "cp", "trestbps", "chol", "fbs", "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal", "num")

cleveland_data = read.csv(file01, sep=",", header=FALSE, na.strings="?",col.names=header)
hungarian_data = read.csv(file02, sep=",", header=FALSE, na.strings="?", col.names=header)
switzerland_data = read.csv(file03, sep=",", header=FALSE, na.strings="?",col.names=header)
va_data = read.csv(file04, sep=",", header=FALSE, na.strings="?", col.names=header)
 
#1. (0.5pt) Open these files and examine the data in them. Note that the files do not have a header and the
##missing values are marked by “?” character. Each file contains the 14 attributes described here. Load each
#file to a dataframe ( remember to set na.string=”?” so that “?” is recognized as missing not a data value).

#print(str(cleveland_data))
#print(str(hungarian_data))
#print(str(switzerland_data))
#print(str(va_data))

#2. (0.5 pt) Use rbind  function to combine the four dataframes into one dataframe and manually set the
#column names  using colnames function. The name of each column/attribute is described here.

data_frame <- rbind(cleveland_data, hungarian_data, switzerland_data, va_data)


#3. (0.5pt) Explore the overall structure of the dataset. What percentage of rows have missing values in one
#or more attributes?

len = nrow(data_frame)
missing = data_frame[rowSums(is.na(data_frame)) > 0,]
percent = nrow(missing)/nrow(data_frame)
cat("Percent missing: ", percent*100, "%\n")


#4. (1pt) Read the data description carefully. Decide which attributes are categorical and convert them to
#“factor”  using factor function ( set the “labels” option to give meaningful names/labels to each level)

# Check if we did this right
sex_lab = c("FEMALE", "MALE")
sex_lev = c(0,1)
cp_lab = c("TYPICAL", "ATYPICAL", "NON_ANGINAL", "ASYMP")
cp_lev = c(1,2,3,4)
ecg_lab = c("NORMAL", "ST-ABNORMAL", "L-HYPERTROPY")
ecg_lev = c(0,1,2)
exang_lab = c("NO", "YES")
exang_lev = c(0,1)
thal_lab = c("NORMAL", "DEFECT", "REV_DEFECT")
thal_lev = c(3,6,7)
data_frame$sex = factor(x=data_frame$sex, labels=sex_lab, levels=sex_lev)
data_frame$cp = factor(x=data_frame$cp, labels=cp_lab, levels=cp_lev)
data_frame$restecg = factor(x=data_frame$restecg, labels=ecg_lab, levels=ecg_lev)
data_frame$exang = factor(x=data_frame$exang, labels=exang_lab, levels=exang_lev)
data_frame$thal = factor(x=data_frame$thal, labels=thal_lab, levels=thal_lev)


 
#5. (0.5 pt) What is the median and mode of the age attribute.

print(summary(data_frame$age)) #Gets the median
ages = table(as.vector(data_frame$age))
mod = as.numeric(names(ages)[ages == max(age)])
print(cat("Mode of age: " , mod, "\n"))

# Mode of age: 54

#6. (0.5 pt) Are female patients under-represented  compared to male patients in this dataset?

fems = data_frame$sex[data_frame$sex=="FEMALE"]
perc_f = length(fems)/len*100
print(cat("Female Percentage: ", perc_f, "percent\n"))

# Female patients : 21% - Under-represented

#7. (0.5 pt) Use “ifelse” and “factor” functions to create a new factor variable (call it  “diagnosis”) which
#takes the value “No” if column 14 has the value zero and “Yes” otherwise.  Replace column 14 of your
#dataframe with this new variable.

data_frame$diagnosis = ifelse(data_frame$num > 0,"Yes", "No")
data_frame$diagnosis = as.factor(data_frame$diagnosis)
print("UCI Dataset Summary")
print(str(data_frame))

#exclude data set with NA nums

#(4 pts) Explore the relationship between “diagnosis” variable and all other 13 attributes in the dataset. 
#Which variables are associated with “diagnosis” use appropriate plots and statistical tests to answer this 
#question. (Note to get full credit for this question, you should use both an appropriate plot and an 
#appropriate statistics test to examine the relationship between each of these variables and sentiment. You 
#should also interpret each plot). Please refer to the lectures to see what type of statistical test and plot you 
#need to use for bivariate analysis based on the type of variables. 

# Factor Variables: ("diagnosis", "sex", "cp", "restecg", "exang", "thal", "num")
# Numerical: ("num" age, trestbps, chol, fbs, thalach, oldpeak, slop, ca)

data_clean = na.omit(data_frame)
print("Cleaned Data Frame Rows Length: ")
print(nrow(data_clean))

# Numerical vs. Numerical Relationships Correlations and Scatterplots. Convert Diagnosis to numeric attribute
numerical_attributes = data_clean[,c("num","age", "trestbps", "chol", "fbs", "thalach", "oldpeak", "slope", "ca")]
#pairs(numerical_attributes)
print("Correlation Matrix for Numerical Variables for Households")
print(cor(numerical_attributes))

# Numerical plots - Most variables seem to be fixed or have weak correlations. Here we just tried
# to visualize any relationships between the num variable and all other numerical factors
# Num should be an ordered variable but we see a wide dispersion for most attributes. 
# Here are notable relations:

# num~thalach: broad negative correlation with maximum heart rate achieved. (weak): -0.41
# num~age: broad positive correlation (weak): +0.22
# num~chol: broad positive correlation (weak) +0.06
# num~oldpeak: broad positive correlation (weak): +0.50
# num~restbps: broad positive correaltions (weak): +.15


# Now lets analyze the diagnosis categorical variable to numerical relationships
# Plot relationships:

plot(data_frame$age~data_frame$diagnosis, col="red")

# Positive diagnosis shows that Yes profiles correlates with increased age indicated by increased quartiles and
# median age for yes diagnosis

plot(data_frame$thalach~data_frame$diagnosis, col="blue")

# A positive diagnosis shows range profiles, Q1,Q3, median associated with lower (negative thalach)

plot(data_clean$chol~data_clean$diagnosis, col="purple")

# Chol shows equivlant median and outliers for No diagnosis. Q3 ranges similar and Q1 is compromised
# data_clean shows near equivlancy

plot(data_frame$oldpeak~data_frame$diagnosis, col="orange")

#Shows higher quartile ranges for positive diagnosis and higher oldpeak values.

plot(data_frame$trestbps~data_frame$diagnosis, col="magenta")

# Data plots are nearly equivlant for trestbps and diagnosis

# Now use two sample test for Numerical-Categorical

print(t.test(data_frame$age~data_frame$diagnosis), alternative="two.sided") #p < 0.01
print(t.test(data_frame$thalach~data_frame$diagnosis), alternative="two.sided") #p < 0.01
print(t.test(data_frame$oldpeak~data_frame$diagnosis), alternative="two.sided") # p < 0.01
print(t.test(data_frame$trestbps~data_frame$diagnosis), alternative="two.sided") # p < 0.001
print(t.test(data_frame$chol~data_frame$diagnosis), alternative="two.sided") # p < 0.001
print(t.test(data_frame$slope~data_frame$diagnosis), alternative="two.sided") # p < 0.001
print(t.test(data_frame$ca~data_frame$diagnosis), alternative="two.sided") # p < 0.001
print(t.test(data_frame$fbs~data_frame$diagnosis), alternative="two.sided") # p < 0.001

# All samples here are correlated to some degree by p-values given implying statistical significance

# Bivariate Categorical Analysis -
# Factor Variables: ("diagnosis", "sex", "cp", "restecg", "exang", "thal", "num")

#Originally used CrossTable with chisq=true however mosaicplots were getting "bin" errors so we simplified
diag_sex <- table(data_frame$diagnosis, data_frame$sex)
diag_cp <- table(data_frame$diagnosis, data_frame$cp)
diag_restecg <- table(data_frame$diagnosis, data_frame$restecg)
diag_exang <- table(data_frame$diagnosis, data_frame$exang)
diag_thal <- table(data_frame$diagnosis, data_frame$thal)


#Chisq analysis shows p-values indicating statistical significance for the following
#categories. (sex, cp, restecg, exang, thal). All categories with rest ecg being the least significant

mosaicplot(diag_sex, xlab="diagnosis", ylab="sex", main="Diagnosis Sex", shade=TRUE)
mosaicplot(diag_cp, xlab="diagnosis", ylab="cp", main="Diagnosis cp", shade=TRUE)
mosaicplot(diag_restecg, xlab="diagnosis", ylab="restecg", main="Diagnosis RestECG", shade=TRUE)
mosaicplot(diag_exang, xlab="diagnosis", ylab="exang", main="Diagnosis EXANG", shade=TRUE)
mosaicplot(diag_thal, xlab="diagnosis", ylab="thal", main="Diagnosis THAL", shade=TRUE)

# Sex shows negative correlation for diagnosis with females (positive for males). While 
# Thal shows a strong negative residual where normal thal is indicative of a No diganosis and 
# reversable defects are associated with positive diagnosis.
# Chest pain residuals overwhelmingly indicate positive residuals in asymptomatic cases. While 
# atypical and nonanginal  show negative residuals 
# Exang, excercise induced angina showed strong residuals with exang presence indicative of
# diagnosis and vice versa.

