# Handwritten Digit Recognition

## 📌 Project Overview
This project implements and compares two probabilistic machine learning models—**Gaussian Classifier** and **Naive Bayes Classifier**—to perform optical character recognition (OCR) on the USPS handwritten digit dataset. The goal was to classify 8x8 pixel images into digits 0-9.

## 📂 Repository Structure
* `train_gaussian_classifier.m`: Trains the Gaussian model using Maximum Likelihood Estimation and visualizes the mean digits.
* `train_naive_classifier.m`: Preprocesses data into binary features and trains the Naive Bayes model.
* `test_classifiers.m`: Evaluates both models on the test set and generates a confusion matrix/error report.
* `ELEC_425_A1_20293052.pdf`: Detailed project report containing mathematical derivations and analysis.

## 🧠 Models Implemented

### 1. Gaussian Classifier
* **Approach:** Models class-conditional densities as multivariate Gaussians.
* **Key Assumptions:** Features are independent (Naive assumption) and share a single global variance across all classes/features.
* **Outcome:** Achieved an error rate of **18.02%**.

### 2. Naive Bayes Classifier
* **Approach:** Models features as binary Bernoulli variables.
* **Preprocessing:** Thresholded pixel intensities at 0.5 to binarize input data.
* **Outcome:** Achieved an error rate of **23.47%**.

## 📊 Results Visualization
*The repository includes scripts to visualize the learned parameters (mean images for Gaussian and probability maps for Naive Bayes), providing insight into what the models "see".*

## 🚀 How to Run
This project uses **MATLAB**.

1.  **Train the models:**
    Run the training scripts to generate the model parameters and error logs.
    ```matlab
    train_gaussian_classifier
    train_naive_classifier
    ```
    *This will save `gaussian_results.mat` and `naive_results.mat` to your workspace.*

2.  **Test and Compare:**
    Run the testing script to view the comparative error table.
    ```matlab
    test_classifiers
    ```

## 📈 Performance Summary
```
| Classifier  | Total Errors | Error Rate |
| Gaussian    |  721 / 4000  |   18.02%   |
| Naive Bayes |  939 / 4000  |   23.47%   |
```
