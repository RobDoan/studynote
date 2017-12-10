# Clustering (unsupervised model)

- Find similar items

### Bags of the words

Using `CountVectorizer` to convert raw text to bags of the words.

Use __stemmers__ of NLTK packages to stem before feed content to `CountVectorizer` by extending `CountVectorizer` to analyst content with NLTK

Remove __stop_words__ - words that not important, they appears very often in all sorts of  different contexts.

Remove words that occur too often - because it does not help in detecting relevant

Remove words that occur so seldom - because the chance which they occur again in future post is very small

Counting remanning words

Normalize data before calculate distance

Calculate TF-IDF

### Clustering

Most clustering algorithm fall into one of the two methods: flat and hierarchical clustering.

Scikit provide a wide range of clustering approaches in the [`sklearn.cluster`][sklearn.cluster] package.

__Algorithm__:

  - K-means: flat methods. [Video](https://youtu.be/_aWzGGNrcic?t=262)

__Learning Datasets__:

  - [20newsgroup][20newsgroup] datasets which contains 18,826 posts from 20 different newsgroups.
  - For convenience, the `sklearn.datasets` modules also contains the `fetch_20newsgroups` function, which automatically downloads the datasets.
  

### Need to read more:

Distance Coefficients between Two Lists or Sets in The Python Papers Source Codes, in which Maurice Ling nicely presents 35 different ones.


[sklearn.cluster]: http://scikit-learn.org/dev/modules/clustering.html
[20newsgroup]: http://people.csail.mit.edu/jrennie/20Newsgroups
