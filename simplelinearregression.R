# data preprocessing 


dataset = read.csv('Salary_Data.csv')

# splitting dataset into test and train test 

# install.packages('caTools')
library(caTools)
# seed setting is like random state in python 
set.seed(123)
# splitRation is the train set 
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset , split == FALSE)

# fitting simple linear regression 
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# predicting the test set results 
y_pred = predict(regressor,newdata = test_set)


#visualising the test set result 
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')