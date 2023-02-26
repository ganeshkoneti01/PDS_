#Reading the csv file
Student = read.csv("C:\\Users\\ganes\\Documents\\Assignment\\1.2\\data_clean\\clean_StudentsData.csv")
Student

#Getting the info of complete csv
summary(Student)


#creating a data frame
Student_Data <- as.data.frame(Student)
Student_Data
dim(Student_Data)

#removinf index column
Student_Data=within(Student_Data, rm("X"))

#Understanding the data and dimensions
names(Student_Data)
dim(Student_Data)

#Getting the top rows
head(Student_Data)
summary(Student_Data)


#Plotting the Graphs- Visualize the data using different techniques

#1 Lets plot the frequency of each category in the "race/ethnicity" feature.
library(ggplot2)
install.packages("dplyr")
library(dplyr)
Student_Data.count <- count(Student_Data,race.ethnicity)

ggplot(data = Student_Data.count, mapping = aes(x = n, y = reorder(race.ethnicity, n))) +
  geom_col(aes(fill= n)) +
  scale_fill_gradient(low = munsell::mnsl("5P 7/12"), 
                      high =munsell::mnsl("5P 2/12") ) +
  geom_text(aes(label = n), color = "yellow", hjust = 2.5, size = 3) +
  labs(title = "Data Based On Race Ethnicity",
      
       x = "FREQUENCY",
       y = "RACE ETHNICITY",
       fill = "Frequency")



#2.1
ggplot(Student_Data, aes(x = gender, y = math.score , fill = gender )) +
  geom_boxplot(show.legend = T)+
  labs(title = "Distribution MathScore Based on Sex",
       x = " GENDER", y = "MATHSCORE")
#2.2
Student_Data$gender <- as.factor(Student_Data$gender)
plot(Student_Data$gender, Student_Data$reading.score,
     xlab = "SEX", ylab = "READING SCORE",main="BOXPLOTS OF READING SCORE VS GENDER",col.main="red", col=(c("gold","darkgreen")))

#2.3
Student_Data$gender <- as.factor(Student_Data$gender)
plot(Student_Data$gender, Student_Data$writing.score,
     xlab = "SEX", ylab = "WRITING SCORE",main="BOXPLOTS OF WRITING SCORE VS GENDER",col.main="red", col=(c("pink","lightblue")))


#3
ggplot(data = Student_Data, aes(x = math.score, y = reading.score, col = gender)) +
  geom_point(size=3) + 
  #geom_line(aes(group = gender)) + 
  scale_color_manual(values = c("male" = "lightblue", "female" = "pink")) +
  labs(title = "Correlation Math Score & Reading Score",
       x = "Math Score", y = "Reading Score",
       col = "Gender")

#4
par(mfrow=c(2,2))
hist(Student_Data$math.score, xlim=c(0,100), xlab = "MATH SCORE", main = "Distribution Math Score")
hist(Student_Data$reading.score,xlim=c(0,100), col=2, xlab = "READING SCORE", main = "Distribution Reading Score")
hist(Student_Data$writing.score,xlim=c(0,100), col=3, breaks=10, xlab = "WRITING", main = "Distribution writing Score")



#5
ggplot(Student_Data, aes(x = frequency(gender) , y = race.ethnicity)) +
  geom_col(fill = "lightgreen")+
  facet_grid(test.preparation.course~gender) +
  labs(title = "Comparison About Female and Male Students ",
       x = "",
       y = "Race Ethnicity")
