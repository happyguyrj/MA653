# Syntax
# barplot(x,xlab,ylab,main, names.arg,col)

# x- vector of data

# Optional paramters
# xlab- label for x axis
# ylab- label for y axis.
# main- title of chart
# col- color pallete
# names.arg- vector of names under bar

# Create data for the graph.
rain <- c(221, 162, 190, 153)
labels <- c("Mandi", "Shimla", "Kullu", "Solan")

# Create a file
png(file = "barplo.jpg")

# Plot the chart
barplot(rain,xlab="city",ylab="rain in (mm)", names.arg=c("Mandi", "Shimla", "Kullu", "Solan"), main="Rainfall in (mm)", col=c("Blue","red","green","orange"))

# Save the file
dev.off()