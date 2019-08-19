### Naive Bayes classifier

- It learn fast and does not require a lot of storage
- Keeping track of which feature gives evidence to which class.
- Only care about boolean feature: whether a word occurs only one or multiple times in a tweet doesn't matter.
- Bayes:  P(A).P(B|A) = P(B).P(A|B)

There are different kinds of Naive Bayer classifier:
- GaussianNB: this classifier assumes the features to be normally distributed.
- MultinomialNB: assume the features to be occurrence counts. In practice, this classifier works well with TF-IDF vectors.
- BernoulliNB: suite when using binary word occurrences.

(need to be back later)
