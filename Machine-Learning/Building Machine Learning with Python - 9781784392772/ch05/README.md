### Deciding how to improve our model

1. Add more data, sometime maybe our data is not enough for training
2. Play with model complexity. Maybe the model is not complex enough or it's too complex.
In this case we could decrease/increase K nearest. _Increase K for simplifier model_
3. Modify the features
4. Change the model. Maybe kNN is not a good fit, so we should find a new model.

### Looking behind accuracy - precision and recall

|  In reality it is      |                    | Classified as    |
| ---------------------- |:------------------:|:----------------:|
|                        |  Positive          | Negative         |
| Positive               | True Positive(TP)  | False Negative   |
| Negative               | False Positive(FP) | True negative(TN)|

- Predict correct  + real: positive => True Positive
- Predict wrong    + real: positive => False Negative

Ex: We want to have high success rate when predict a post as either good or bad,
but not necessarily both, => we want as much true positive as possible

    Precision = TP / (TP + FP)

We want detect as much good or bad answers as possible:

    Recall = TP / (TP + FN)

Use function `precision_recall_curve` from `metrics` module

```python
  from sklearn.metrics import precision_recall_curve
  precision, recall, thresholds = precision_recall_curve(y_test, clf.predict(X_test))
```

### Slimming the classifier

For logistic regression, we can directly take the learned coefficients `(clf.coef_)`
to get an impression of features impact. The higher the coefficient of a feature,
the more the feature plays a role in determining whether the post is good or not.

Negative coefficient tell us that the higher values for corresponding features
indicate a stronger signal for the post to be classified as bad.

Sometime a feature has high coefficient but rarely appear in the real world, so
we can ignore that features. Example NumberImage in answers has very high coefficient
because answers with image usually be rated as a good answer. But in the real world,
not many answers has images, so that we could drop this feature from classification.

### Ship it!

Instead of traning each time we start the classification service, we can simply
serialize the classifier after training and then deserialize on the service to use.

```python
  import pickle
  pickle.dump(clf, open('logreg.dat', 'w'))
  clf = pickle.load(open('logred.dat', 'r'))
```
