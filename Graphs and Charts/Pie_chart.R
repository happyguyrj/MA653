# Syntax
# pie(x, labels, radius, main, col, clockwise)

# x- vector of data

# Optional paramters
# labels- description of pies
# radius- radius of pie (-1<=r<=1)
# main- title of chart
# col- color pallete
# clockwise- logical value indicating order of pies

# Create data for the graph.
rain <- c(221, 162, 190, 153)
labels <- c("Mandi", "Shimla", "Kullu", "Solan")

# Create a file
png(file = "pie_chart.jpg")

# Plot the chart
pie(rain,labels, main="Rainfall in (mm)", clockwise = TRUE, col=c("Blue","red","green","orange"))

# To insert a Legent (Optional)
legend("topright", c("Mandi", "Shimla", "Kullu", "Solan"), cex = 1, fill = c("Blue","red","green","orange"))

# Save the file
dev.off()