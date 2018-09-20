# Syntax
# plot(x, y, main, xlab, ylab, xlim, ylim, axes)

# x- vector of data
# y- vector of data

# Optional paramters
# main- title of chart
# type- "p" to draw only the points, "l" for lines and "o" to draw both
# xlab- label for x axis
# ylab- label for y axis
# xlim- range of values on the x-axis
# ylim- range of values on the y-axis
# axes- indicates whether both axes should be drawn on the plot

# Create data for the graph.
x <- c(5,3,6,7,8,2,5,12,2)
y <- c(8,7,4,6,2,4,8,10,6)

# Create a file
png(file = "scatter plot.jpg")

# Plot the chart
plot(x,y, main="scatter plot")

# Save the file
dev.off()