#import data from csv into a dataframe object
data<-read.csv("filename.csv",header=T)

#Class of imported data
class(data) #data.frame

#Print column names of imported dataframe
colnames(data)

#Converting dataframe object into timeseries object
data.ts<-ts(data=data$num, frequency = 12, start=c(1949,01), end=c(1960,12))

#Use these command to check if dataframe object is converted into timeseries
class(data.ts) #ts
start(data.ts) #1949    1
end(data.ts) #1960   12
head(data.ts) #Jan Feb Mar Apr May Jun
            #1949 112 118 132 129 121 135
data.ts       #Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
            #1949 112 118 132 129 121 135 148 148 136 119 104 118
            #1950 115 126 141 135 125 149 170 170 158 133 114 140
            #1951 145 150 178 163 172 178 199 199 184 162 146 166...

#Decomposing the data
data.de<-decompose(data.ts)

#PNG file to plot the graph
png("International airline passengers.png")
plot(data.de)
dev.off()
