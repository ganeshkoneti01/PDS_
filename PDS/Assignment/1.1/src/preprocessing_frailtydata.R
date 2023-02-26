#Reading the csv file
frailty = read.csv("C:\\Users\\ganes\\Documents\\Assignment\\1.1\\data_raw\\raw_frailty_data1.csv")
frailty

#Getting the info of complete csv
summary(frailty)


#creating a data frame
frailty <- as.data.frame(frailty)
frailty

#renaming the columns
colnames(frailty) <- c('Height(in)','Weight(lb)','Age','Grip_Strength(kg)','Frailty')

#Understanding the data and dimensions
names(frailty)
dim(frailty) 

#Getting the top rows
head(frailty)

#getting the datastructure
str(frailty)

frailty$Frailty <- as.factor(frailty$Frailty)



str(frailty)
anyNA(frailty)


write.csv(frailty, "C:\\Users\\ganes\\Documents\\Assignment\\1.1\\data_clean\\clean_frailty_data.csv")
