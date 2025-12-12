# Deep Neural Networks

## 📌 Project Overview
This project covers probabilistic sequence models and deep neural networks. 

Implemented a **Feed-Forward Neural Network** from scratch in MATLAB, replacing standard sigmoid activations with **Hyperbolic Tangent (tanh)** to solve a non-linear regression problem.

### 2. Neural Network from Scratch
* **Architecture:** Multi-Layer Perceptron (MLP) with 2 hidden layers (256 units each).
* **Activation Function:** Implemented custom `tanh` activation and its gradient for backpropagation
* **Optimization:** Trained using **Adam Stochastic Gradient Descent (SGD)** over 550 epochs.
* **Task:** Function approximation for a non-linear 2D surface.

## 📂 Repository Structure

### Neural Network Code
* `feedforward_network_tanh.m`: Main script that constructs, trains, and tests the network.
* `activation_tanh.m`: Forward pass for the Hyperbolic Tangent activation.
* `activation_tanh_gradient.m`: Backward pass (derivative) for `tanh`.
* `compute_gradient_for_weights_and_one_layer_below.m`: Helper function for backpropagation.
* `weighted_sum.m`: Helper function for computing linear combinations of inputs and weights.

## 🚀 How to Run
This project uses **MATLAB**.

1.  **Run the Neural Network:**
    Execute the main script to train the network and visualize the fitting progress.
    ```matlab
    feedforward_network_tanh
    ```
    *The script will generate a plot showing the ground truth vs. predicted values and the decreasing squared loss over epochs.*

## 📊 Results Summary
* **Neural Network:** The Tanh-based network successfully converged, minimizing the squared loss to approximate the target trigonometric function.
