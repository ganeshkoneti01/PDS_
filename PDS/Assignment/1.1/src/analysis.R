#Reading the csv file
frailty = read.csv("C:\\Users\\ganes\\Documents\\Assignment\\1.1\\data_clean\\clean_frailty_data.csv")
frailty

#Getting the info of complete csv
summary(frailty)

frailty$Frailty <- as.factor(frailty$Frailty)


t_test_frailty=with(frailty,t.test(frailty$Weight.lb. ~ frailty$Frailty,var.equal = FALSE))
t_test_frailty

capture.output(t_test_frailty,file="C:\\Users\\ganes\\Documents\\Assignment\\1.1\\results\\results.docx")


pairs(~ Height.in. + Weight.lb.  + Age + Grip_Strength.kg.+ Frailty  , data = frailty)

frailty$Frailty <- as.factor(frailty$Frailty)
plot(frailty$Frailty, frailty$Grip_Strength.kg.,
     xlab = "Frailty", ylab = "GripStrength",main="Frailty vs GripStrength",col.main="orange", col=(c("black","pink")))
