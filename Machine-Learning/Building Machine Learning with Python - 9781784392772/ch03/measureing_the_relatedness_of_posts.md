### Levenshtein distance / Edit distance

'machine' and 'mchiene' - edit distance will be 2 because we need to edit second word by 2 steps: adding 'a', and delete first 'e'

This method is quite costly as it's bound by the  length of the first word times the length of the second words.

For blog post, we can cheat by checking world words instead of checking characters. Example: __"How to format my hard disk"__ vs __"Hard disk format problems"__. But this approach still quite complex.


### Bag of words

Instead of care about ordering of the words, we can ignore it and consider number of time each words appears. And we vectorize appearing of words.

1. Convert raw text into a bag of words

- Using [`CountVectorizer`][CountVectorizer] method.

```python
  from sklearn.feature_extraction.text import CountVectorizer
  vectorize = CountVectorizer(min_df=1)
  content = ["How to format my hard disk", " Hard disk format problems "]
  X = vectorizer.fit_transform(content)
  vectorizer.get_feature_names()
  print(X.toarray().transpose())
```

The `min_df`  parameter determines how `CountVectorizer` treats seldom words (minimum document frequency).
If it is set to an integer, all words occurring less than that value will be dropped.
If it's set to a fraction, all words that occur in less than that fraction of the overall will be dropped.
The `max_df` parameter works in a similar manner.

`fit_transform(raw_documents)`: Learn the vocabulary dictionary and return term-document matrix.

`get_feature_names`: Array mapping from feature integer indices to feature name

2. Stemming

- Reduce words to their specific word term - Example 'images' and 'imaging' should count together.
- Natural Language Toolkits - NLTK package
- NLTK come with different stemmers - because each language has a different set of rules for stemming.
Ex: English we use SnowballStemmer

Extending the vectorizer with NLTK's stemmers

  ```python
    import nltk.stem
    english_stemmer = nltk.stem.SnowballStemmer('english'))
    class StemmedCountVectorizer(CountVectorizer):
      def build_analyzer(self):
        analyzer = super(StemmedCountVectorizer, self).build_analyzer()
        return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))
    vectorizer = StemmedCountVectorizer(min_df=1, stop_words='english')
  ```

+ Lowercase the raw post (parent class)
+ Extracting all individual words in the tokenization step (parent class)
+ Convert each word into its stemmed version.

3. Stop words on steroids

- We give a high value to the term occurs ofter in particular post and very seldom in anywhere else.
- __term frequency - inverse document frequency__ (TF-IDF). In SciKit we havee package TfidVectorizer.


[CountVectorizer]: http://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.CountVectorizer.html
