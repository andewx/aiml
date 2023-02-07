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

$$q_{new} = \frac{q-\mu}{\phi}$$ where $mu$ is the mean and $phi$ is the standard deviation.
