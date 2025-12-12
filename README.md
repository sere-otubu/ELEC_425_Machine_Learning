# ELEC 425: Machine Learning

## 📌 Repository Overview
This repository contains the coursework and implementation projects for **ELEC 425**, focusing on fundamental and advanced machine learning algorithms. The projects range from probabilistic classifiers and robust clustering to sequence models and building neural networks from scratch.

**Language:** MATLAB  

---

## 📂 Project Modules

### [Handwritten Digit Recognition](./ELEC_425_A1)
**Goal:** Implement probabilistic classifiers to recognize handwritten digits from the USPS dataset.

* **Algorithms:** Gaussian Classifier vs. Naive Bayes Classifier.
* **Key Concepts:**
    * **Generative Modeling:** Modeling class-conditional densities $P(x|C_k)$ as Multivariate Gaussians.
    * **Feature Engineering:** Comparing continuous pixel intensities vs. binary thresholded features.
    * **Maximum Likelihood Estimation (MLE):** Estimating shared variance and class means.
* **Performance:** The Gaussian classifier achieved an error rate of **18.02%**, outperforming Naive Bayes (23.47%).

### [Clustering Algorithms: K-Medians & K-Medoids](./ELEC_425_A2)
**Goal:** Explore unsupervised learning techniques by implementing robust alternatives to K-Means.

* **Algorithms:** K-Medians and K-Medoids.
* **Key Concepts:**
    * **Robustness:** Using **Manhattan (L1) distance** instead of Euclidean distance to mitigate the impact of outliers.
    * **Centroid Selection:** Comparing geometric medians (K-Medians) vs. representative data points (K-Medoids/PAM).
    * **Visualization:** analyzing cluster partitions on 2D datasets with ```k=2, 3, 4```.

### [Neural Networks](./ELEC_425_A3)
**Goal:** Bridge probabilistic graphical models with deep learning by implementing HMMs and a Neural Network from scratch.

* **Part A: Hidden Markov Models (HMM)**
    * **Scenario:** A "Dishonest Casino" using fair and loaded dice.
    * **Task:** Implemented the **Viterbi Algorithm** to decode the most likely sequence of hidden states (Fair/Loaded) given a sequence of rolls.
* **Part B: Deep Neural Network**
    * **Architecture:** A Feed-Forward Neural Network (MLP) built without deep learning libraries.
    * **Implementation:** Custom `tanh` activation functions, manual backpropagation, and **Adam SGD** optimization.
    * **Task:** Non-linear function approximation/regression.
