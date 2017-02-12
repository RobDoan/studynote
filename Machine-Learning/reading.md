+ https://github.com/ZuzooVn/machine-learning-for-software-engineers
+ [x] [5 Techniques To Understand Machine Learning Algorithms Without the Background in Mathematics](#aaa)
+ [x] [A Tour of Machine Learning Algorithms](#a-tour-of-machine-learning-algorithms)
+ [] [Machine Learning Algorithm Recipes in scikit-learn](http://machinelearningmastery.com/get-your-hands-dirty-with-scikit-learn-now/)
+ 
- References
  + [Wiki - List of machine learning concepts](https://en.wikipedia.org/wiki/List_of_machine_learning_concepts)
  + [Wiki - Machine learning algorithms](https://en.wikipedia.org/wiki/Category:Machine_learning_algorithms)

****

# 5 Techniques To Understand Machine Learning Algorithms Without the Background in Mathematics
- [Source](http://machinelearningmastery.com/techniques-to-understand-machine-learning-algorithms-without-the-background-in-mathematics/)
1. __Create Lists of Machine Learning Algorithms__
  + You may feel overwhelmed by the larger number of algorithms. So, when starting out is to keep track of the algorithms you read about.
  + Capture details like the problem type to which they are suited
  + When you start a new problem, try some algorithms you have never used before
2. __Research Machine Learning Algorithms__
3. __Create Your Own Algorithm Descriptions__
  + You can design a standard algorithm description template with only those details that are useful to you in getting the most from algorithms, like algorithm usage heuristics, pseudo-code listings, parameter ranges and resource lists.
  + Some questions you might like to use in your own algorithm description template include:
    * What are the standard abbreviations used for the algorithm?
    * What is the objective or goal for the algorithm?
    * What is the pseudo-code or flowchart description of the algorithm?
    * What are the heuristics or rules of thumb for using the algorithm?
    * What are useful resources for learning more about the algorithm?
4. __Investigate Algorithm Behavior__
  + Sometimes we get best understand by checking their behaviors on actual dataset
  + designing small experiments on machine learning algorithms using small datasets you can learn a lot about how an algorithm works,  it’s limitations and how to configure it in ways that may transfer to exceptional results on other problems.
5. __Implement Machine Learning Algorithms__
  + You cannot get more intimate with a machine learning algorithm than by implementing it.
  + 3 algorithms that you select as your first machine learning algorithm implementation from scratch are
    * Linear Regression using Gradient Descent
    * k-Nearest Neighbor
    * Naive Bayes

---

# A Tour of Machine Learning Algorithms - [link](http://machinelearningmastery.com/a-tour-of-machine-learning-algorithms/)

- We categorize the algorithms by:
  + by __learning style__
  + by __similarity__ in form or function

### Four different learning styles in machine learning algorithms
1. __Supervised Learning__
  - Input data is called training data and has a known label or result such as spam/not-spam or a stock price at a time.
  - A model is prepared through a training process in which it is required to make predictions and is corrected when those predictions are wrong. The training process will continue until the model achieves a desired level of accuracy on training data.
  - Example algorithms include __Logistic Regression__ and the __Back Propagation Neural Network__.
2. __Unsupervised Learning__
  - Input data is not labeled and does not have a known result.
  - A model is prepared by deducing structures present in the input data. This may be to extract general rules. It may be through a mathematical process to systematically reduce redundancy, or it may be to organize data by similarity.
  - Example problems are clustering, dimensionality reduction and association rule learning.
  - Example algorithms include: the __Apriori__ algorithm and __k-Means__.
3. __Semi-Supervised Learning__
  - Input data is a mixture of labeled and unlabelled examples.
  - There is a desired prediction problem but the model must learn the structures to organize the data as well as make predictions.

__Overview__

When crunching data to model business decisions, you are most typically using supervised and unsupervised learning methods.

### Algorithms Grouped By Similarity
- This is a useful grouping method, but it is not perfect. There are still algorithms that could just as easily fit into multiple categories
1. __Regression Algorithms__
  - Regression is concerned with modeling the relationship between variables that is iteratively refined using a measure of error in the predictions made by the model.
  - The most popular regression algorithms are:
    + Ordinary Least Squares Regression (OLSR)
    + Linear Regression
    + Logistic Regression
    + Stepwise Regression
    + Multivariate Adaptive Regression Splines (MARS)
    + Locally Estimated Scatterplot Smoothing (LOESS)
  ![Regression Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Regression-Algorithms.png)  
2. __Instance-based Algorithms__
  - Instance-based learning model is a decision problem with instances or examples of training data that are deemed important or required to the model.
  - Such methods typically build up a database of example data and compare new data to the database using a similarity measure in order to find the best match and make a prediction. For this reason, instance-based methods are also called winner-take-all methods and memory-based learning.
  - The most popular instance-based algorithms are:
    + k-Nearest Neighbor (kNN)
    + Learning Vector Quantization (LVQ)
    + Self-Organizing Map (SOM)
    + Locally Weighted Learning (LWL)
    ![Instance-based Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Instance-based-Algorithms.png)
3. __Regularization Algorithms__  
  - An extension made to another method (typically regression methods) that penalizes models based on their complexity, favoring simpler models that are also better at generalizing.
  - the most popular regularization algorithm:
    + Ridge Regression
    + Least Absolute Shrinkage and Selection Operator (LASSO)
    + Elastic Net
    + Least-Angle Regression (LARS)
  ![Regularization Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Regularization-Algorithms.png)  
4. __Decision Tree Algorithms__
  - construct model of decisions made base on actual values of attributes in the data.
  - Decision trees are often fast and accurate and a big favorite in machine learning
    + Classification and Regression Tree (CART)
    + Iterative Dichotomiser 3 (ID3)
    + C4.5 and C5.0 (different versions of a powerful approach)
    + Chi-squared Automatic Interaction Detection (CHAID)
    + Decision Stump
    + M5
    + Conditional Decision Trees
 ![Decision Tree Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Decision-Tree-Algorithms.png)
5. __Bayesian Algorithms__
  - apply Bayes’ Theorem for problems such as classification and regression.
  - Decision made base on probability
  - The most popular Bayesian algorithms are:
    + Naive Bayes
    + Gaussian Naive Bayes
    + Multinomial Naive Bayes
    + Averaged One-Dependence Estimators (AODE)
    + Bayesian Belief Network (BBN)
    + Bayesian Network (BN)
6. __Clustering Algorithms__
  - Clustering, like regression, describes the class of problem and the class of methods.
  - Clustering methods are typically organized by the modeling approaches such as centroid-based and hierarchal.
  - The most popular clustering algorithms are:
    + k-Means
    + k-Medians
    + Expectation Maximisation (EM)
    + Hierarchical Clustering
  ![Clustering Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Clustering-Algorithms.png)
7. __Association Rule Learning Algorithms__
  - Association rule learning methods extract rules that best explain observed relationships between variables in data.
  - The most popular association rule learning algorithms are:
    + Apriori algorithm
    + Eclat algorithm
  ![Association Rule Learning Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Assoication-Rule-Learning-Algorithms.png)
8. __Artificial Neural Network Algorithms__
  - Artificial Neural Networks are models that are inspired by the structure and/or function of biological neural networks.
  - The most popular artificial neural network algorithms are:
    + Perceptron
    + Back-Propagation
    + Hopfield Network
    + Radial Basis Function Network (RBFN)
  ![Artificial Neural Network Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Artificial-Neural-Network-Algorithms.png)
9. __Deep Learning Algorithms__
  - Deep Learning methods are a modern update to Artificial Neural Networks.
  - Many methods are concerned with semi-supervised learning problems where large datasets contain very little labeled data.
  - The most popular deep learning algorithms are:
    + Deep Boltzmann Machine (DBM)
    + Deep Belief Networks (DBN)
    + Convolutional Neural Network (CNN)
    + Stacked Auto-Encoders
  ![Deep Learning Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Deep-Learning-Algorithms.png)
10. __Dimensionality Reduction Algorithms__ :question:
  - Some Dimensionality Reduction Algorithms algorithms:
    + Principal Component Analysis (PCA)
    + Principal Component Regression (PCR)
    + Partial Least Squares Regression (PLSR)
    + Sammon Mapping
    + Multidimensional Scaling (MDS)
    + Projection Pursuit
    + Linear Discriminant Analysis (LDA)
    + Mixture Discriminant Analysis (MDA)
    + Quadratic Discriminant Analysis (QDA)
    + Flexible Discriminant Analysis (FDA)
  ![Dimensionality Reduction Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Dimensional-Reduction-Algorithms.png)
11. __Ensemble Algorithms__
  - Ensemble methods are models composed of multiple weaker models that are independently trained and whose predictions are combined in some way to make the overall prediction
    + Boosting
    + Bootstrapped Aggregation (Bagging)
    + AdaBoost
    + Stacked Generalization (blending)
    + Gradient Boosting Machines (GBM)
    + Gradient Boosted Regression Trees (GBRT)
    + Random Forest
  ![Ensemble Algorithms](http://3qeqpr26caki16dnhd19sv6by6v.wpengine.netdna-cdn.com/wp-content/uploads/2013/11/Ensemble-Algorithms.png)
12. __Other Algorithms__
  - algorithms from specialty tasks in the process of machine learning
    + Feature selection algorithms
    + Algorithm accuracy evaluation
    + Performance measures
  - algorithms from specialty subfields of machine learning
    + Computational intelligence (evolutionary algorithms, etc.)
    + Computer Vision (CV)
    + Natural Language Processing (NLP)
    + Recommender Systems
    + Reinforcement Learning
    + Graphical Models
