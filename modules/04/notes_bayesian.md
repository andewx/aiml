# Classification with Naive Bayes
**Overview**

Naive Bayes focuses on the foundations of **independent** events which desribe the probability of events and how probabilities should be revised, known as **Bayesian Methods**.

The classifiers will use training information event occurence tables to evaluate the probability of specific outcomes based on the evidence provided by feature values.

Best applied to situations where the simulataneous occurence and thereby the intersection of attributes given an event estimates an overall outcome. 

---
## Bayesian Principles

**Estimated Likelihood** of an event is *rooted* on evidence of the event occuring previously under all possible conditions. *(Edited this from the textbook excerpt but I believe this states the problem better)*

We have to consider that the features of an event which includes itself and its compliment. `P` and `!P`. And *non-mutually exclusive* events. These are known as **Joint Probabilities**

### Joint Probability :

**Joint Probability** implies that the events monitored can occur together in the same trial (*concurrently*). Notably, we can use a *venn diagram* to illustrate the combinations that exist for a set of events. (*Independent Global Occurance*, *Occurs with set of events $X_i$*). Joint probability implies these intersections.

If two events are indepent the probability that they occur together (intersect) is $P(I_ab) = P(a) * P(b)$ where $I_ab$ is the intersection of events $A$ and $B$.

### Measuring Dependence

We want to find out a more reasonable estimate which estimates the probability that two events occur with some form of dependence. **Bayes Theorem** allows us to revise an estimate of an event based on the observations of another.

**Original Theorem**

$$P(A|B)=P(B|A)P(B)\over{P(B)}$$ 

Which can be read out loud as:

The probability that the event A occurs given the event B has already occured. Here `B` is the known. This known as he *conditional probability*

**Bayes Theorem** states that the best of estimate of `P(A|B)` is the proporition of trials in which `A` occured with `B`. `A` in this case is *dependent* on `B`. So we are saying based on the occurence of `B` itself, if we know how often `A & B` occurs then our estimate is based on that intersection over the total probability of event `B` occuring.  

$$P(A|B) = P(B|A)P(A)\over{P(B)}$$ which is the classic *Bayes Theorem*:

This takes advantage of the fact that $P(A|B) = P(B|A)*P(A)$.

So we are evaluating the conditional prbability of B occuring with A times the event likelihood of A over the event likelihood of B. I  like to look at this as $$P(A|B)\over{P(B|A)} = P(A)\over{P(B)}$$

Or in another words the ratio of interdependent probabilities `A` is co-dependent with `B` is equal to the ratio of  A and B. 

The theorem presents the following systems:

$$P(A|B) = P(B|A)P(A)\over{P(B)}$$

**Marginal Likelihood** as $P(B)$

**Posterior Probability** as $P(A | B)$

**Likelihood** as $P(B|A)$

**Prior Probability** as $P(A)$


The reason we are *updating* is based on when we present the prior `A` as the hypothesis while `B` is based on our data. 

The condition `P(B|A)` is then a likelihood of our data occuring under the assumptions of our hypothesis. Also note that  `P(B)` is also sometimes called *normalizing constant** (*not in our reading*). And is calcualted from_n $P(B) = \sum{P(A_n)P(B|A_n)$. 

In updating our **prior becomes our old posterior** $P(A) = P(A|B_1)$ so that the expression for Bayes tehorem exapands to include our updated beliefs.

$$ P(A|B) = P(\prod_n{A_n})*P(B|A)\over{P(B)}$$


### Interpretation of Bayes Law (Class Hypothesis $C_i$ with Data $D$)
 - ${P(C_i | D)}$ $=$ ${P(D|C_i)*P(C_i)\over{P(D)}}$
 - ${P(C_i)$ is the **prior probability** - it reflects our belief that $C_i$ occurs with a fixed probability $P(C_i)$
 - ${P(D|C_i)}$ is the **likelihood** which is the likelihood of observing the data $D$ if the class is $C_i$
 - In Bayes theorem with revise our prior $P(C_i)$  that class $C_i$ occurs to a new **posterior probability** ${P(C_i|D)}$ that reflects new information contained in data $D$ so that we learn from new data. 

### Bayesian Frequency Tables

In a frequency table each event (and its compliment) can be related to another event througha  frequency table (truth table). Where one of four combinations of events can occur, in boolean logic these sectors would be the `[AND, A_OR, B_OR, NAND]` or if we are evaluating a hypothesis: `[Validate, False Positive, False Negative, Negate]`.

To compute the Posterior probability $P(A|B)$ we can first get the intersection `P(A & B) = P(B|A) * P(A)`.  And then we would divide this result by `P(B)`.

So given this table as an abstract:

| A - A' | B | B' | Totals |
| ------ | - | -- | ------ |
| A | 4 | 16 | 20 |
| A' | 1 | 79 | 80 |
| Total | 5 | 95 | 100 |

We have `P(B&A)` = $P(B|A) * P(A)$ Which is = ${{4} \over {20}} * {20 \over {100}} = {0.04}.$

But when we divide by $P(B) = {5 \over 100}$ then we get $P(A|B)$  $=$ ${P(B|A)*P(A)} \over {P(B)}$ $= 0.80$

So given the fact that B occured, for example the word *viagara* was used, then there is a posterior probability of 80% that the message is spam, or that A is validated. 

### Bayesian Problem Example

> Medical test for mammograms is reported to report validated positives (**sensitivity**) for 80% of cancer cases. Lets construct the frequency table from this data. *(Prime ' quotes indicate event compliments so Test' = Negative test result)*

| | Test | Test' | Totals |
| ------ | - | -- | ------ |
| Cancer | 8 | 2 | 10 |
| Cancer' | 250 | 2250 | 2500|
| Total | 258 | 2252| 2510|

So to identify the probability of having cancer with a positive mammogram we need to compute $P({C|T})$ as a posterior.

Where ${P(C|T)}$ $=$ ${{P(T|C)*P(C)}\over{P(T)}}$

**NOTE**

- Where $P(C) = 0.004$

- And $P(T|C) = 0.8$
- Now find $P(T)$ : According to our frequency table we built $P(T) = 258/2510$ or $0.10$

**Finding P(T) by mutual exclusion**

- Define $P(T)$ by its intersection with events $B_i$ where each  $B_i$ is mutually exclusive and covers the entire event space.
- $P(T)$ $=$ ${\sum_{i=1}P(T,B_i)}$
- $P(T)$ $=$ ${\sum_{i=1}P(T|B_i)*P(B_i)}$ - sum of observation of $T$ in each data $B_i$
- In our case $B_0 = C$ so $B_0 = 0.004$ 
- And $B_1 = C'$ so $B_1 = 0.996$
- Therefore we can say that $P(T)$ $=$ $P(T|C)*P(C) + P(T|C')*P(C')$
- $P(T)$ $=$ $0.8 * 0.004 + 0.1*0.996$
- And now we can solve the entire Bayesian formula as 
- ${P(T|C)*P(C)}\over{P(T|C)*P(C)+P(T|C')*P(C')}$ $= {0.8*0.004}\over{0.8*0.004 + 0.1*0.996}$ $=$ $0.031$


**Note just use the frequency tables if possible**



## Naive Bayes Algorithm

**Strengths**

 - Simple,fast, effective
 - Handles noise
 - Few examples to train
 - Easy to obtain estimates

**Weaknesses**
 - Faulty assumption of independence of features
 - Fails with numeric heavy datasets
 - Estimated probabilityes are less reliable than the predicted classes.

*Overall* Naive Bayes is a reasonable baseline candidate for classification learning. Even though faulty assumptions and feature dependencies violate model assumptions.


Given a dataset evaluating spam words with N word features (i.e. Viagara, Money, Free, Subscribe) = 4. We can evaluate the following formula:

`P(A|X_i) = P(Intersection of X_i Features | A) * P(A) / P(Intersection of X_i Features)`

This formula requires
- Unlimited memory for arbitrary features and calculation of intersections 
- Joint probability Zero

Solution: Use Naive assumption of independence of events. **Class Conditional Independence**. 

This means events are independent as long as their condition relies on the same class. Which allows us to estimate an intersection of `P(A&B)` as `P(A) * P(B)`

This simplifying assumption no longer dependends on the total intersection calculation but the likelihood probabilities of each event being observed `B` and the class its observed against `A` . 

`P(A|X_i)` proportional to $\prod_i{P(X_i|A) * P(A)}$

This means we can use the values in our likelihood table independently to compute overall likelihoods for a posterior. A scale factor of `z` or $1\over{Z}$ converts the likelihood values to probabilities.

## Algorithm 

$$P(C_l|F,...,F_n) = {1\over{Z}}*{\prod_{i=1}p(C_l|F_i)}*p(C_l)$$

Where $F_i$ is the feature provided

And $C_l$ is the probability of level $l$ of the class being evaluated. 

Overall we build a frequency table... then build the likelihood table...and multiply out the conditional probabilities with the naive assumptionof independence. 
Finally divide the taol likelihood to transform likelihoods into a probability. 

**Laplace Estimator** provides a estimation value of 1 for probabilities of 0 that would result in a negated probability. Adding a one for each row would have negligible effect for large data sets. 

Formula is $P(X_i) = {X_i + 1}\over{N +w}$ where $N$ is the number of total observed events for $X_i$ and $w$ is the feature vector width.

Gives us a non-zero estimate correction. 

**Numeric Features** can be handled by discretizing numerical ranges into bins. You may choose bins for natural cateogries or cut points in the distribution. 


## Maximum A Posteriori Probability Estimate (MAP)
- Map is used to estimate an unobserved population parameter $\theta$
- We use the likelihood $P(D | \theta)$ and prior $P(\theta)$
- Choose the Bayesian classifier that maximizes the probability hypothesis
- Bayesian Classifies are special case of MAP estimation. Choose the class that maximizes the probability.
- 
