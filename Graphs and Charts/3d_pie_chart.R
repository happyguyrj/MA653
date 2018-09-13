# Syntax
# pie3D(x, labels, radius, main, col, explode )

# x- vector of data

# Optional paramters
# labels- description of pies
# radius- radius of pie (-1<=r<=1)
# main- title of chart
# col- color pallete
# explode- gap between pies

# Import the library.
library(plotrix)

# Error in library(plotrix) : there is no package called 'plotrix'
utils:::menuInstallPkgs()
#Choose Plotrix from the dialog which appears

# Create data for the graph.
rain <- c(221, 162, 190, 153)
l <- c("Mandi", "Shimla", "Kullu", "Solan")

# Create a file
png(file = "3d_pie_chart.jpg")

# Plot the chart
pie3D(rain,labels=l, main="Rainfall in (mm)", explode =0.1, col=rainbow(length(x)))

# To insert a Legend (Optional)
legend("topright", c("Mandi", "Shimla", "Kullu", "Solan"), cex = 1, fill = rainbow(length(x)))

# Save the file
dev.off()
