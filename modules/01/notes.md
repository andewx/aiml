# Notes - Module 01 Statistics Review
---

## Unit 01 Variables
### Types of Variables
- Qualitative Variables (Categorical)
- Quantitative Variables (Numerical)
- Discrete Variables (Event Based/Countable)
- Continuous Variables (Quantitative Variables with infinite values)

### Data Ordering
- Nominal - Qualitative with no ordering of the data. (Male/Female)
- Ordinal - Classifies data into categories which can be ranked but not precise
- Interval - Differences between variables define the variable. Zero not meaningful
- Ratio - Interval variable with a true zero defines ration level of measurement
---

## Unit 02 Probability Concepts and Random Experiments
### Definition of Probability
- Frequentist Interpretation - Repeated measurement defines event probability
- Bayesian Interpretation - Probability is quantified by the amount of uncertainty about an event

### Advantages of Bayesian
- 50% Uncertainty between two events defines a complete uncertainty between two events
- Quantify uncertainty about events

### Probability Experiments
- Sample Space - Set of possible outcomes of an event
- Outcome - Result of a single trial
- Probability Experiment - Experiment for which the outcome cannot be predicted with certainty
- Event - can represent a subset of possible outcomes (even/odd), or multiple outcomes.
- Simple event - represents a single outcome.

> According to classical probability sample spaces can be used to determine the numerical probability that an event will happen.

> Classical probability assumes the all outcomes in the sample space are equally likely to occur independently of one another.

- Complementary Events - The set of outcomes in the sample space that were not present for a particular event "E".

### Conditional Probability (Bayesian)
- P(B | A) = Probability of B occurs after event A has already occurred. (A occuring adds information if B and A exist within the same system.
- Dependent events the probability of both occuring is P(A & B) = P(A) * P (B | A)
- By reordering P(B | A) = P(B & A) * (1/P(A)
- But if they are independent events.
- P ( B | A ) = P( B)
- And P(B & A) = P(A) * P(B)

### Measures of Central Tendency
- Mean - Central average of a set of sample values or the population average
- Median - The central point in an ordered set (it's value)
- Mode - Highest frequency of appearance/probability for a value. (Unimodal, bimodal, multimodal)
- Range - Range of Values
- MidRange - Central Range

### Data Descriptions
- Histogram - Occurences (Frequency of events) for classes (subranges) of data values (Bar graph)
- Frequency Polygon - Midpoint histogram derives a line graph
- Ogive - Cumulative frequency for the upper  boundary of each class. (Frequency always increases)

### Data Shapes
- Bell shaped (Gaussian central mean median)
- Uniform (Equi probability)
- J Shaped / Reverse J / U Shaped
- Right Skewed / Left Skewed
- In Right Skewed majority of values fall left while tail is off to the right. Mean is to the right of the media. Mode to the left. (Mode, Median, Mean)
- Vice versa for Left Skewed
- Symetric distributions (Mean median mode are at the center)


### Data Variability
- Includes Range, Variance, Standard Deviation. ==(Measures of variation, measures of dispersion)==.
- Variabililty is the statistical term for the degree to which data values differ from one another.
```Variance =∑[X - u)^2 * (1/N)
                  
  ```
```X = sample value
     u = population mean
     N = popultation size
  ```
- Variance is sigma^2
- Standard deviation is sigma

### Populations vs Samples
- Population consist of all real objects to be studied, the true distribution.
- Samples are subsets of populations. Measures from samples are called statistics. While population descriptions of distributions are considered model parameters.
- 
### Sample Variance & Sample Deviation
``` s^2 = ∑[X - π ]^2 * (1/(n-1))```
- π = sample mean
- X = value
- n = sample size
- std_dev = Sqrt(s^2)


### Coefficient of Variantion
> CVar allows you to compare standard deviations of different measures.
> Samples : CVar = (s/π) * 100
> Populations: CVar = (std/u) * 100
> Now we can tell which dataset is more variable by comparing multiple CVars 

### Normal Rules
- 1 std deviation = 68% of values 
- 2 std devication = 95% of values
- 3 std deviations = 97% of values


### Measures of Position
- Scores
- Percentiles
- Quartiles
> ####z-score / std score
> z-score/std score tells how many std deviations a specific value is above or below the mean.
> ```z = (X-u)/o```
> Tells us a similar picture to the CVar
> ####Percentiles/Quartiles
> Divides data set evenly by 100 groups. (frequency of the entire sample set size) and finds where an ordered value lands
> ####Interquartile Range
> Difference between Q1-Q3 in the middle 50% range. Used to identify outliers. IQR

### Outliers
- Data which is not in line with the rest of the data sat. 
- May use IQR to find
- Q1 - (1.5*IQR) -- Q3 + (1.5*IQR)

### Exploratory Data Analysis
- Box and whisker plots track range, IQR, median
- Check how data distrubition is skewed. 

### Discrete Probability
- Non-continuous variables - perhaps class type variables.
- ```var =∑[X-u]^2 * P(X)```
- Alternatively
- ```var = ∑[X^2*P(X)] - u^2```
- std_dev is just the square root of this value.
- Expected values are the theoretical averages of a variable. ``` u = E(X) = ∑[X] * P(X)```


### Binomial Distribution
<img width="247" alt="Screen Shot 2023-01-21 at 8 47 01 AM" src="https://user-images.githubusercontent.com/457513/213849472-295c96b9-4724-490b-ab81-c64fee1468d3.png">
 ``` p = success probability
 q = failure probabily
 q = 1-p
 n = number trials
 X = successes as a variable
 ```
 - Mean, Var , Std:
 - ```u = n * p ```
 - `var = n*p*q`
 - `std = sqrt(var) `

### Poisson Distribution
- Discrete distribution for large n with low p and the data is described over time (evolution)
- The probability of X occurrences in an interval of time, volume, area, is the mean number of occurrences per unit.

<img width="459" alt="Screen Shot 2023-01-21 at 8 52 19 AM" src="https://user-images.githubusercontent.com/457513/213851579-bf5fda7e-14b0-47a9-be2b-cb5c663f2308.png">

 ### Continous Distributions
 - Probability density function of continuous random variable (Normal Distribution)
 - Called the PDF and integrates to 1
 
 ### Normal Distrbution
 ##<img width="148" alt="Screen Shot 2023-01-21 at 8 53 53 AM" src="https://user-images.githubusercontent.com/457513/213852219-a628a9ea-9ae5-4ca0-b204-697068eea9db.png">
```e = 2.718 - eulers
π = 3.141529
u = mean
o = std deviation
```
- Describes the normal distribution rules
- Standard normal distribution has a mean of zero (adjusted)
<img width="92" alt="Screen Shot 2023-01-21 at 8 56 55 AM" src="https://user-images.githubusercontent.com/457513/213853520-129eef7f-f5b5-45f6-a4b5-1750c7c034e6.png">
- `z = (X-u)/std` this normalizes the distribution about a 0 mean

### Confidence Interval
-  Use samples to estimate the population parameters
-  Point estimate parameters (mean, median ...)
-  Interval Estimate parameters...range of point estimates from multiple samples. 
-  These are called confidence intervals. We will generate a distribution of paramater estimation values (mean, median ...)
-  These distributions are approximately normal ==Central Limit Theorem==
-  `std_dev/sqrt(n)` is the standard error of the mean.
-  Central limit theorem always true

### Hypothesis Testing
- We have two hypothesis classes: (null hypothesis / alternative)
- If we introduce a variable or change in the environment will our parameters be affected?
> Null Hypothesis - Little effect on the statistics/parameters
> Alternative Hypothesis - Statistics/parameters are effected by the change of variable(s) and there is correlation
> Type 1 Error - Reject Null Hypothesis, but its true
> Type 2 Error - Accept Null Hypothses but its false
-Critical value seperates when a change in variable affects the data set and when it doesnt. Tells us which hypothesis is valid. 
- Researcher chooses criteria (0.01%) also called P value. 
- P value is the area under the standard normal distribution. 

 
