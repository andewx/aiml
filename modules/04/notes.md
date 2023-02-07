# Notes Module 04 Lazy Learning k-NN

## Overview
---
- k-NN classifier works by using labeled training data exposing classes. Associates a sampled vector $p$ with pre-associated vector class $q$ using a distance function, often Euclidian. $$dist(p,q) = {sqrt(\sum_{i=0}^N(p_i - q_i)^2}$$
- k parameter indicates number of nearest distance samples to take for class identification. Class association is based on count of class associations.
$C_p=\sum_{1}^n(1*P)$ for all classes of P that are evaluated as a k nearest neighbor.  Class $C_p$ recieves the sum of all closest associated `P` items that were nearest to the sample vector `X`. In another words the class with the greatest associated **votes** becomes the associated k-NN class.

### Choosing an appropriate k

A large sample size where k is equal to the training set size would always associate the majority class

**Bias-Variance Tradeoff**

Large k reduces the effect that large variances (noise) can have on the class selection, (small details are ignored), but bias in the data set is introduced as the majority classes overshadow class details. The

Variance is introduced when we select small k numbers, this allows outlier data, and mislabeled data to cause the algorithm to incorrectly predict.

Also associated with over and under-fitting in other NN approaches.

**Approaches to choosing `k`**

In practice the choice of k depends on the difficulty and complexity of the training patterns as well as the number of records  in the data.

Start by choosing $K=sqrt(N)$ where $N$ is the number of training examples.

We can also test several k values an choose the best performing classifier.

Higher quality data sets with sufficient examples make the `k` choice less sensitive as local neighborhoods are typically filled with correctly classified examples.

## Preparing Data for use with k-NN

**Data Normalization**

We need to normalize data so that distance metrics are equivilant between vector parameters. (Non-Weighted Parameters)

This is traditionally called **min-max normalization** which transforms numerical data to fall in ranges between 0 - 1.

We need to choose a min and a max for the parameter 'q'

$$ q_new = \frac{q-min(q)}{max(q)-min(q)} $$

Which fits the value into its explicit range.

We also have **z-score standardization** which utilize the **mean** and **standard deviation**  of the sampled value. Works when no range is available or range is infinity.

$$q_{new} = \frac{q-\mu}{\phi}$$ where $\mu$ is the mean and $\phi$ is the standard deviation.

**Handling Nominal Data**

Handles nominal data by using **dummy coding**. That is convert the nominal values to values of 1 and 0.

`n-category` mutually exclusive variables are created with binary indicator variables for `(n-1)` levels of the categorical feature.

That is a level is signaled through **one-hot-encoding**.

Distances between features is always one or zero so no additional transformations are required.

## Why is k-NN lazy

No abstraction/generalization occurs. Lazy learners are not learning anything, they are just classifying.

Heavy reliance on training instances rather than an abstracted model,  is known as **instance-based learning** or **rote-learning**

No model is built and k-NN is said to be a class of **non-parametric** learning methods. No model is built.

## Handling k-NN datasets in R

**Load data**
```
df <- read.csv("wisc_bc_data.csv", stringsAsFactors=FALSE)
df <- df[-1] # drops the first column (id)
df$diagnosis <- factor(df$diagnosis, levels=c("B","M"), labels=c("Benign", "Malignant"))
```

**Transforming Data**

Range Normalize

```
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
```

Use `lapply()` to normalize all numeric rows of the data frame this applies to function argument to the argument x

**Create normalized data frame**
```
df_n <- as.data.frame(lapply(df[2:31], normalize))
```
**Create training and test data sets**
```
df_train <- df_n[1:469,]
df_test <- df_n[470:569,]
```

We excluded the variable `diagnosis` from the normalized test/train sets.

```
df_train_labels <- df[1:469,1]
df_test_labels <-[470:569,1]
```

Takes `diagnosis` in the first column of the `df` and created the vectors `df_train_labels` and `df_test_labels`.

**Train the model**

Install the `class` package
`install.packages("class")` and `library(class)`

Use  the `knn()` function for a standard knn implementation with Euclid distance.

The function `knn` returns a factor vector of predicted classes for each row in the test data frame
```
p <- knn(train, test, cl, k)
```

So for our set up we can do:
```
p <- knn(train=df_train, test=df_test, cl=df_train_labels, k = 21)
```

**Evaluate**
Now we can use `CrossTable` to evaluate the performance.

```
CrossTable(x=df_test_labels, y = p, prop.chisq=FALSE)
```
This will show us a truth table of test labels and the test predictions.

**Improving performance**

Might use a **z-score standardization**. For this `R` has a built in `scale()` function

```
df_z <- as.data_frame(scale(df[-1]))
```

*For the example test this results in a decrease in accuracy from 98%-95%*

Next we might choose to vary the k value and track the accurracy as a whole.

> To generalize you might  you might create several sets of 100 patients and retest
