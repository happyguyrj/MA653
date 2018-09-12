#import data from csv into a dataframe object
d1<-read.csv("1.csv",header=T)

#Converting dataframe object into timeseries object
d1.ts<-ts(data=d1$num, frequency = 12, start=c(1949,01), end=c(1960,12))

#Decomposing the data
d1.de<-decompose(d1.ts)

#PNG file to plot the graph
png("International airline passengers.png")
plot(d1.de)
dev.off()
