#Moving Average Process

#For ar1 pass 1 argument in list
ar1<-ariar.sim(model=list(ar=c(0.5)),n=100)

#To see data generated by process
ar1

#Create empty plot
dev.new()

#Plot the data
plot(ar1,type='o')

#Close the plot
dev.off()


#For ar2 pass 2 argument in list
#In ar2 process  theta1 + theta2 < 1, theta1 - theta2 < 1, abs(theta2) < 1
ar2<-ariar.sim(model=list(ar=c(0.5,0.4)),n=100)

#To see data generated by process
ar2

#Create empty plot
dev.new()

#Plot the data
plot(ar2,type='o')

#Close the plot
dev.off()

#And so on for general ar order n process
#In order p AR process sum of thetas <1 and abs(theta_p) < 1
