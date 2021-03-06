#reading data
dat = read.csv("heart_2020_cleaned.csv")
dim(data) # we have total 319795 rows and 18 columns

#checking for na values
#is.na(data)
(colMeans(is.na(dat)))*100
#In our data, there's no missing values

#chekcing for duplicate values
#View(duplicated(data)) #as we can see here there are TRUE(18078) values that means we do have duplicate rows.
#duplicates = subset(dat,duplicated(dat))
#dim(duplicates) #18078 

#dat = distinct(dat) #getting unique values
#dim(dat)     #301717

summary(dat)
#changing categorical variables into factors
dat = dat %>%
  mutate_if(is.character, factor)
summary(dat)

# variable BMI is a numerical variable. Changing BMI into factor
#dat$BMI = factor(dat$BMI)
#summary(dat)
dat$BMI <- cut(dat$BMI, breaks=c(0, 18.5, 25, 30, +Inf), 
            labels=c("Underweight", "Normal", "Overweight", "Obese"))
summary(dat)

#renaming levels
#levels(dat$Smoking) <- c("0", "1")
#summary(dat)

#drop column Race 
#dat <- subset (dat, select = -Race)
#summary(dat)

#combining levels of Diabetic column
#library(forcats)
#dat$Diabetic = dat$Diabetic %>% fct_collapse(Yes = c("Yes","Yes (during pregnancy)"))
#dat$Diabetic = dat$Diabetic %>% fct_collapse(No = c("No", "No, borderline diabetes"))


