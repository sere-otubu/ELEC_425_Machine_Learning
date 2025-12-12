# Clustering Algorithms: K-Medians & K-Medoids

## 📌 Project Overview
This project explores unsupervised learning by implementing two robust variations of the K-Means clustering algorithm: **K-Medians** and **K-Medoids**. 

Unlike standard K-Means, which minimizes the sum of squared Euclidean distances, these implementations utilize **Manhattan / Cityblock distance** to reduce sensitivity to outliers. The project visualizes how these algorithms partition 2D data across varying cluster counts (```k=2, 3, 4```).

## 🧠 Algorithms Implemented

### 1. K-Medians
* **Objective:** Minimize the sum of Manhattan distances between points and their cluster centers.
* **Update Rule:** The new center is the element-wise **median** of the points in the cluster.
* **Key Characteristic:** More robust to extreme values than the mean.

### 2. K-Medoids
* **Objective:** Minimize the sum of dissimilarities (Manhattan distance) between points and a designated center.
* **Update Rule:** The new center must be an **actual data point** (the medoid) from the cluster that minimizes the total distance to all other members.
* **Key Characteristic:** The center is always a valid data point, making the results interpretable in the original data context.

## 📂 Repository Structure
* `k_medians.m`: Core function implementing the K-medians algorithm (E-step: Assign to closest median; M-step: Calculate new median).
* `k_medians_main.m`: Script to run K-medians on the dataset and visualize results.
* `k_medoids.m`: Core function implementing the K-medoids algorithm (E-step: Assign to closest medoid; M-step: Search for optimal medoid).
* `k_medoids_main.m`: Script to run K-medoids on the dataset and visualize results.
* `ELEC_425_A2_20293052.pdf`: Project report containing visualization of clusters and analysis of initialization sensitivity.

## 🚀 How to Run
This project uses **MATLAB**.

1.  **Load the Data:**
    Ensure `data.mat` (provided in course materials) is in your path.

2.  **Run K-Medians:**
    Execute the main script to visualize clustering with K-medians.
    ```matlab
    k_medians_main
    ```
    *You can adjust the number of clusters (2, 3, or 4) inside the script.*

3.  **Run K-Medoids:**
    Execute the main script to visualize clustering with K-medoids.
    ```matlab
    k_medoids_main
    ```

## 📊 Results & Visualization
The algorithms were tested with ```k=2, 3, 4```. The visualization scripts generate scatter plots showing:
* **Colored Points:** Data points assigned to specific clusters.
* **Markers (Diamonds/Stars):** The calculated Medians or Medoids.
*Note: As shown in the project report, different random initializations can lead to different local optima, highlighting the importance of multiple trials.*
