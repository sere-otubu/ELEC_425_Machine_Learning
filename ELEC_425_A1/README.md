# ELEC 425 Assignment 1

README file for ELEC 425 Assignment 1

## Code Files

- train_gaussian_classifier.m (file used to train and test Gaussian Classifier)
- train_naive_classifier.m (file used to train and test Native Bayes Classifier)
- test_classifiers.m (file used to return test performance results)

## How To Run Code

Run the train_[insert classifer]_classifier.m files **first** to get to get your classifier results and errors. These results are needed to run the test_classifier.m file

```bash
save('gaussian_results.mat','errors_gaussian','error_rate_gaussian');
```
```bash
save('naive_results.mat','errors_nb','error_rate_nb');
```