#import data from csv into a dataframe object
d1<-read.csv("1.csv",header=T)

#Class of imported data
class(d1) #data.frame

#Print column names of imported dataframe
colnames(d1)

#Converting dataframe object into timeseries object
d1.ts<-ts(data=d1$num, frequency = 12, start=c(1949,01), end=c(1960,12))

#Use these command to check if dataframe object is converted into timeseries
class(d1.ts) #ts
start(d1.ts) #1949    1
end(d1.ts) #1960   12
head(d1.ts) #Jan Feb Mar Apr May Jun
            #1949 112 118 132 129 121 135
d1.ts       #Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
            #1949 112 118 132 129 121 135 148 148 136 119 104 118
            #1950 115 126 141 135 125 149 170 170 158 133 114 140
            #1951 145 150 178 163 172 178 199 199 184 162 146 166...

#Decomposing the data
d1.de<-decompose(d1.ts)

#PNG file to plot the graph
png("International airline passengers.png")
plot(d1.de)
dev.off()
