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
rain <- matrix(c(5,3,6,7,8,2,5,12,2,9,8,7,4,6,2,4,8,4,6,7), nrow = 5, ncol = 4, byrow = TRUE)
months <- c("Mar","Apr","May","Jun","Jul")
city <- c("Mandi", "Shimla", "Kullu", "Solan")

# Create a file
png(file = "barchart_stacked.jpg")

# Plot the chart
barplot(rain,xlab="city",ylab="rain (in mm)", names.arg=city, main="Rainfall in (mm)", col=c("Yellow","Blue","red","green","orange"))

# To insert a Legend (Optional)
legend("topleft", months, cex = 1, fill = c("Yellow","Blue","red","green","orange"))

# Save the file
dev.off()