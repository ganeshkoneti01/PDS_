#Reading the csv file
Student = read.csv("C:\\Users\\ganes\\Documents\\Assignment\\1.2\\data_raw\\Raw_StudentsPerformance.csv")
Student

#Getting the info of complete csv
summary(Student)

#creating a data frame
Student_Data <- as.data.frame(Student)
Student_Data

#Understanding the data and dimensions
names(Student_Data)
dim(Student_Data)

#Getting the top rows
head(Student_Data)

#Getting the bottom rows
tail(Student_Data)

#Getting the Data Structure
str(Student_Data)

#Converting vector object to factor object-with levels of factor
Student_Data$gender <- as.factor(Student_Data$gender)
Student_Data$race.ethnicity <- as.factor(Student_Data$race.ethnicity)
Student_Data$parental.level.of.education <- as.factor(Student_Data$parental.level.of.education)
Student_Data$lunch <- as.factor(Student_Data$lunch)
Student_Data$test.preparation.course <- as.factor(Student_Data$test.preparation.course)

str(Student_Data)

#Removing the unnecessary columns from the data
Student_Data=within(Student_Data, rm("lunch"))
summary(Student_Data)



#Finding out the missing values if any
anyNA(Student_Data)

#save the clean Data
write.csv(Student_Data, "C:\\Users\\ganes\\Documents\\Assignment\\1.2\\data_clean\\clean_StudentsData.csv")

