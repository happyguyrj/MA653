# Syntax
# hist(x,xlab,ylab,xlim,ylim,breaks,main,col)

# x- vector of data

# Optional paramters
# xlab- label for x axis
# ylab- label for y axis
# xlim-range of values on the x-axis
# ylim-range of values on the y-axis
# main- title of chart
# col- color pallete

# Create data for the graph.
rain <- c(5,3,6,7,8,2,5,12,2,9,8,7,4,6,2,4,8,4,6,7)

# Create a file
png(file = "histogram.jpg")

# Plot the chart
hist(rain,xlab="city",ylab="Frequency", main="Rainfall in Mandi (in mm)", col=c("Yellow"))

# Save the file
dev.off()