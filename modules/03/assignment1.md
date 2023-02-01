# Assignment 1

**Read More**
- P-Value & Hypothesis Testing
- Chi-Square Distributions

---
**Overview**
Group will file a submission answering each question to three problems by submitting an `.rdm` R notebook file and a `.html` notebook preview file.

## Problem 1
 Explore vegas hotel data set which includes variables from online reviews for 21 hotels on the las Vegas strip from TripAdvisor. Explore relationship between the `score` variable and other features.

 ## Problem 2

Explore California Housing Dataset, infomration from the 1990 California census. explore relationship between `median_house_value` and other variables in the dataset.

## Problem 3

Explore heart disease dataset + 4 processed datasets. Identify statistical parameters of the datset.


---
## Module 3 Notes

R can load various datasets into data frames this includes:
| Type | Data |
| -----|------|
| Type | Data |
| Text |`ASCII, XML, HTML, CSV`|
| App  | `.XLS, netCFD, HDF5` | 
| DB's | `SQL, mySQL, Oracle, Access`|
| Stats | `SAS, SPSS, Stata`|


### Saving and Loading "R Objects"

- Serialize R objects with the `save(data, filename)` function
- Load R objects from `rdata` files with `load(filename)`

Saving objects can be done with multiple objects into the same file 
- `save(obj1, obj2, obj3, ... , filename)`

If you want to all session objects using the `save.image()` function

Use the `ls()` function to return a vector of all data structures for the current session.

Use the `rm(obj1,obj2,...)` function to remove an object from the session memory

`rm(list=ls())` - removes all objects from the current session

## Editing Data

Use the `edit()` function to edit an object with the data editor. This opens a data editor window and allows the user to edit with a gui.

```
my_data <- edit(data)
```

The `fix()` function implies editing the parameter object. `fix(data)` edits the `data` object.

## Importing text files

Imports tabular type data in text form where each line typically represents the observation. **Delimiter** tokens will seperate the values while the first line often contains the **header** information.

`read.table()` is function that parses tabular text data according to the format of tabular text described above. That is we specifiy how to process a text files data.

```
read.table(filename, header, sep, quote, dec, row.names, col.names, as.is, na.strings, colClasses, nrows, skip, check.names, fill, strip.white, blank.lines.skip, comment.char, allowEscapes, flush, stringsAsFactors, encoding)
```

Parameters are as follows:
| Argument | Description | Default |
|----------|-------------|---------|
|file|Required argument which includes the file name/url to open the file ||
|header|Boolean value whether a header is included in first row| FALSE|
|sep|Character which seperates values, "" indicates any whitespace is a separator|""|
|quote|If character values are enclosed in quotes this denotes the type of quotes|""|
|dec|Character used fro decimal points |.|
|row.names|Character vector contained row names for the returned data frame||
|col.names|Character vector containing column names for the returned data frame||
|as.is|Boolen vector specificying whether to convert character values to factors|!stringsAsFactors|
|na.strings|Cahracter vector specifying values that should be interpreted as NA|NA|
|col.Classes|Character vector sof class names to be assigned to each column|NA|
|nrows|Integer specifying number of rows to read, invalid values such as -1 ignored | -1|
|skip|Integer value specifying number of rows to skip|0|
|check.names|Boolean specifies whether `read.table` checks if column names are valid symbol names in R|TRUE|
|fill|Adds blank values if values are missing in table rows| TRUE|
|strip.white|When sep !="", specifies whether `read.table()` will remove extra leading and trailing whitespace from fields|FALSE|
|blank.lines.skip| Specifies if function should ignore blank lines|TRUE|
|comment.char | Ignores comment lines with specified comment char | # | 
|allowEscapes | Indicates whther escapes should be intepreseted or read literally | FALSE|
|flush | Function skips to next line when all fields are read | FALSE | 
|stringsAsFactors | Logical value indicating whether text fields are converted to factors | default.stringsAsFactors()|
|encoding| Encoding scheme for source file | "unknown"|

Example 
```
data <- read.table("pt_data.txt", quote="\"", sep=",", header=TRUE)
```

**Other text file options**
|Function|header|sep|quote|dec|fill|comment.char|
|--------|------|---|-----|---|----|------------|
|`read.table()`|FALSE| | \" or \' | . |! | #|
|`read.csv()`|TRUE| | \"| . |blank.lines.skip| |
|`read.csv2()`|TRUE| | \"| , |TRUE| |
|`read.delim()`|TRUE| | \"| . |TRUE| |
|`read.delim2()`|TRUE| | \" | , |TRUE | |


**Exporting Data**
We can export data objects (as data frames ) to text files with `write.table()`
```
write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ", eol = "\n", na =NA", dec = ".", row.names = TRUE, col.names = TRUE, qmethod =c("escape", "double"))
```

We can also use auxillary write functions such as `write.csv(pt_data, file="my_data.csv", eol="\n")` which contains argumants similar to read.

## Exploring data structures
```
usedcars <- read.csv("usedcars.csv")
str(usedcars) #displays table in console 
```

Rnning `usedcars` into the R promt will give an overview of the data set. We can also use the following functions: 
- `head(usedcars, n=10)` - First 10 rows of the dataset
- `head(usedcars, n=-10)` - All but last 10 rows of the dataset
- `tail(usedcars, n=10)` - Last 10 rows
- `tail(usercares, n=-10)` - All rows but the first 10


**Univariate Data analysis**
-  Use the `summary()` function to show the min, max, and quartiles. Second quartile is the data point median. An ordered set of data values should divide the data set into equal groups by their quartiles.
- Use the `range()` function to measure the sample spread. its returns `(max,min)`. `range(usecars$price)` for the price range in cars. To get the numerical range run `diff(range(usedcars$price))`
- Typically range function takes a vector or matrix and return differences between consecutive elements where order matters.
```diff(c(1,3,8))``` returns `[2,5]` where ````diff(c(8,3,1))```` returns `[-5,-2]`

The difference between Q1 and Q3 is known as IQR. It can be calculated with the IQR function. `IQR(usedcars$price)`
We can find extremes to find outlier data. 
```
IQR <- IQR(usedcars$price)
summar(usedcars$price)
left <- 11000 1.5*IQR
right <- 14900+1.5*IQR
```
Where we can extact those values with
```
x <- usedcars$price
x[x < left | x > right]
```

We can see how values are distributed (and whether that distribution is linear) with the `quantile()` function

For example
```
quantile(usedcars$price, seq(from = 0 , to = 1, by = 0.20))
```
Which would show the price value at each quartile of data

**Boxplots**
This is a way to visualize quartile data. For example

```
boxplot(usedcars$price, main="Boxplot of Used Car Prices", ylab="Price ($)")
boxplot(usedcars$mileage, main="Boxplot of Used Car Mileage", ylab="Odometer (mi.)")
```

Which displays the quartile data where outliers are denoted by circles. 

**Histograms**
Another way visualize numeric data in terms of value bin frequency.

```
hist(usedcars$price, main = "Histogram of Used Car Prices", xlab ="Price ($)")
hist(usedcars$mileage, main = "Histogram of Used Car Mileage", xlab = "Odometer (mi.)")
```

To find the exact number of cars priced between $12,000 and $14,000 we can run `length(which(x>12000&x<14000))`
Which returns `49` cars with prices in this reange. 

The expression `x > 12000 & x < 14000`  creates a logical vector of length 150 which is the number of cars in the record.

**Empirical Normal Rules**
Normal distributions contain 68% values within 1 std deviation of the mean. while 95-and 99.7% of values fall within two and three standard deviations respectively.

Lets check if the used car data set fits this rule
```
mean_price <- mean(x)
sd1 <- sd(x)
length(which(x > mean_price - sd1 & mean_price + sd1))
```
Which results in `113`. ```113/150`` = `75%`
For two standard deviations and three we get `95%` and `100%` respectively.
This distribution is close to normal distribution but according to its histogram we see it is right skewed. **Mean is left of the media and values tail off to the right**

**Q-Q Plot**
Graphical tool to assess which type of distribution a sample is from (Normal, Exponential), this plot is also known as a **scatterplot**. This plots samples against distribution theoreticla quantiles.
- X-axis shows quantiles for standard normal distribution
- Y-axis shows quantiles of our sample data
- When the relation is X=Y then we can assume a normal distribution

`qqnorm(data$value)` will display the plot

**Mode values**
```
temp <- table(as.vector(x)) #x is usedcars$prices
names(temp)[temp == max(temp)]
```
This returns 12995. So this is the most frequent price. The first command creates a table called temp with two rows, the first row is a sorted list of all unique values in the vector x. The second row is the the occurence of each unique value.

The second command `names(temp)[temp==max(temp)]` returns the mode. 

## Categorical variables
The used car dataset has three categorical variables `model, color, and transmission`. Because we use `stringsAsFactors = FALSE` R leaves these variables in the string format rather than converting to a factor type.

To transform categorical data we can use tables to examine. A table representing a single cat variable is a **one-way table**. `table(usedcars$year)`. This lists the different categorical occurences and their frequencies. 

`prop.table(table_year)` lists the proportional frequency of each varibale i.e. 2010 occured %35 of the time.


## Bivariate analyis

Relations between two variables.

### Numerical - Numerical relationships

**Scatterplot** can be used to visualize relationship between two variables. 
```plot(x = usecdars$mileage, y= usedcars$price, main = "Scatterplot", xlab="Mileage", ylab="Price")```
- We are looking for variable correlation i.e. Positive, Negative, None. For a negative correlation we see a negative linear slope. For a postive correlation there is a positve linear line slope. 
- We can also see outliers for example cars with both a high-mileage and high price.

```
attributes = usedcars[,c("price","mileage","year)]
pairs(attributes)
```
Displays a scatterplot for a pairs of variables.

**Continuous variable correlations**
 - **Covariance** We look for correlation to determine strength of linear relationship between two variables.
 `Sample Covariance = ((Sum(x-ux)(y-uy))/n-1)` where Cov(x,x) = var(x)
 Specific limits are hard to interpret.

 - **Correlation** (Pearson Correlation Coefficient) used instead of Cov(X,Y) to determine relationship. It is the scaled Cov(X,Y). Corr(X,Y ) = Cov(X,Y) / sx*sy whic is a value between [-1,1]. Use `cor(price, mileage)` in R to get a value. Multiple variable returns a matrix of correlations. 


**Confidence Interval and P Value for Hypothesis testing**
- Use hypothesis testing to make inference about the population where the sample is from. 
- For example see if the `corr(price,mileage)` differs due to various constraints.
- `cor.test()` tests for correlation between two samples. It returns the correlation coefficient and p value of the correlation. 
```
cor.test(price,mileage)
```
This gives us:
```
t = -16.574, df = 148, p-value < 2.2e-16
95% confidence interval: [-0.85, -0.74]
alternative hyp: true correlation not equal to 0
```
So this tells us that we can expect the correlation to be between -0.85, -0.74 for 95% of the samples.

## Bivariate Categorical Variables

- **Crosstabs** are used to study relations between nominal variables. The rows will be the "levels" or enumerated values of one variable versus the columns being the enumerated optional "level" values of another.

Each cell indicates the frequency of occurences where both conditions were met for a sample value.

The CrossTable( ) function in the gmodels package produces crosstabulations modeled after PROC FREQ in SAS or CROSSTABS in SPSS. It has a wealth of options.

Install gmodles first : `install.packages("gmodels")


```
# 2-Way Cross Tabulation
library(gmodels)
CrossTable(mydata$myrowvar, mydata$mycolvar)
```

There are options to report percentages (row, column, cell), specify decimal places, produce Chi-square, Fisher, and McNemar tests of independence, report expected and residual values (pearson, standardized, adjusted standardized), include missing values as valid, annotate with row and column titles, and format as SAS or SPSS style output!
See help(CrossTable) for details. 

Our example uses a variable construction method to generate a "TRUE, FALSE" categorical variable called `conservative`

```
usedcars$conservative <-  usedcars$color %in% c("Black", "Gray", "Silver", "White")
```


## Chi-Square Test of Independence 
Measures how likely it is that differences in cell counts are due to noise. It does so by measuring the combined variance between the associations. 


Used in analysis of contingency tables to see if two categorical variables are independent by seeing if the variables are divergent or not.


- There is an expected distribution in the Chi Square test
- Low probability implies correlation between varaibles.

A critical value of Chi-Square statsitcs determines the level of significane and degree of freedom.
- Degree of freedom is `df = (r-1)*(c-1)` so it is given by the variable counts
- If Chi-Sq test statistics are greater than the critical value then the **Null Hypothesis** is rejected and we conclude that variables are not independent.

**Additional notes**
- P-Value of Chi-Square does not tell us anything about the strength of association. 
- Large sample sizes means small differences are detected which gives small p-value close to zero for weak associations.

```
CrossTable(model, conservationve, chisq=TRUE)
```
Gives us
` Chi^2 = 0.15, d.f = 2 p = 0.92`
- This says that probability is high. So variations in cell count are noise and not associative. 
- A p-value below 0.05 implies dependence between rows and columns

Condensed cross table created with `table(model,conservative)`

and now `chisq.test(my_table)` gives us the same results.





See [Wikipedia - Chi Square](https://en.wikipedia.org/wiki/Chi-squared_test) for formula.










