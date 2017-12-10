### K-means

K-means is the most widely used flat clustering algorithm.

  - Initial by random K centroids,
  - Move datasets to the centroid which is nearest.
  - Recalculate mean of centroids, and move it. (3)
  - Check all datasets again, to see to move the datasets to nearest new centroid. (4)
  - repeat step (3) and (4) until no datasets be moved.
  - [Video](https://youtu.be/_aWzGGNrcic?t=262)

Load [`20newsgroup`][20newsgroup] datasets on `sklearn.datasets`

```python
  import sklearn.datasets
  groups = ['comp.graphics', 'comp.os.ms-windows.misc', 'comp.sys.ibm.pc.hardware']
  train_data = sklearn.datasets.fetch_20newsgroups(subset='train', categories=groups)
  test_data = sklearn.datasets.fetch_20newsgroups(subset='test', categories=groups)
```

We should notice that raw data is noisy. The raw data we got may contains invalid characters which may cause Errors.
So that we have to tell the vectorizer to ignore them by option `decode_error`

```python
  vectorizer = StemmedTfidfVectorizer(min_df=10, max_df=0.5, stop_words='english', decode_error='ignore')
```

Start using [`KMeans`][k-means] in `sklearn.cluster`. Start with `num_clusters=50`

```python
from sklearn.cluster import KMeans
num_clusters = 50
km = KMeans(n_clusters=num_clusters, init='random', n_init=1, verbose=1, random_state=3)
km.fit(vectorizer)

# After fitting, you can get the clustering information out of members of km.
print(km.labels_) #[48 23 31 ...,  6  2 22]
print(km.labels_.shape)
```

We use random state just for getting the same results. In the real world application, we will not do this.

__Predict__ new post.

  - vectorizer new post
  - use `km.predict`
  - get similar post

  ```python
    new_post_vec = vectorizer.transform([new_post])
    new_post_label = km.preduct(new_post_vec)[0]

    # Get index of similar posts
    similar_indices = (km.labels_ == new_post_label).nonzero()[0]
    #nonzero()[0] convert ndarray with true false to smaller array with only indices of true value.

    # pick similar post form dataset with indices we already has
    similar = []
    for i in similar_indices:
      dist = sp.linalg.norm((new_post_vec - vectorizer[i]).toarray()) # calculate distance of new post with similar post
      similar.append((dist, dataset.data[i]))
    similar = sorted(similar)  # order by distance
  ```

__Other cluster__:

  - Cosine
  - Pearson
  - Jaccard

[20newsgroup]: http://scikit-learn.org/stable/modules/generated/sklearn.datasets.fetch_20newsgroups.html
[k-means]: http://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html#sklearn.cluster.KMeans
