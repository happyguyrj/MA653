# Syntax
# pairs(formula, data)

# formula- series of variables used in pairs
# data- data set from which the variables will be taken

# Create data for the graph.
x <- c(5,3,6,7,8,2,5,12,2)
y <- c(8,7,4,6,2,4,8,10,6)
z <- c(5,3,6,7,8,4,8,10,6)

# Create a file
png(file = "scatter_plot_matrix.jpg")

# Plot each variabe with remaining others
plot(~x+y+z, main="scatter plot matrix")

# Save the file
dev.off()