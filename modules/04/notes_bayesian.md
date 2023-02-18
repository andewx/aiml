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

The condition `P(B|A)` is then a likelihood of our data occuring uhe r teh assumptions of our hypothesiAlso note that  `P(B)` is also sometimes called *normalizing constant** (*not in our reading*). And is calcualted from_n $P(B) = \sum{P(A_n)P(B|A_n)$. 

In updating our **prior becomes our old posterior** $P(A) = P(A|B_1)$ so that the expression for Bayes tehorem exapands to include our updated beliefs.

$$ P(A|B) = P(\prod_n{A_n})*P(B|A)\over{P(B)}$$


Where Posterior is Proportional to the Likelihood times teh Prior. 

In terms of our evaluating our current data set without the concepts of self updates...we can look at a frequency table of events.

### Bayesian Frequency Tables

In a frequency table each event (and its compliment) can be related to another event througha  frequency table (truth table). Where one of four combinations of events can occur, in boolean logic these sectors would be the `[AND, A_OR, B_OR, NAND]` or if we are evaluating a hypothesis: `[Validate, False Positive, False Negative, Negate]`.

To compute the Posterior probability $P(A|B)$ we can first get the intersection `P(A & B) = P(B|A) * P(A)`.  And then we would divide this result by `P(B)`.

So given this table as an abstract:

| A - A' | B | B' | Totals |
| ------ | - | -- | ------ |
| A | 4 | 16 | 20 |
| A' | 1 | 79 | 80 |
| Total | 5 | 95 | 100 |

We have `P(B&A)` = $P(B|A) * P(A)$

Which is = ${4}\over{20}*{20}\over{100}={0.04}$

