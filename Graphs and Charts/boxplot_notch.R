# Syntax
# boxplot(x, data, notch, varwidth, names, main)

# Optional Parameters
# x-vector/formula
# data- data frame
# notch- (logical value) Set as TRUE to draw a notch
# varwidth (logical value) Set as true to draw width of the box proportionate to the sample size
# names- group labels which will be printed under each boxplot.
# main- title to the graph.

# Load in built data mtcars 
data("mtcars")
data = mtcars

# Create a file
png(file = "boxplot_notch.jpg")

#Plot Mileage data
boxplot(mpg ~ cyl, data = mtcars, 
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", 
        main = "Mileage Data",
        notch = TRUE, 
        varwidth = TRUE, 
        col = c("green","yellow","purple"),
        names = c("High","Medium","Low")
)

# Save the file
dev.off()

# Refernces: https://www.tutorialspoint.com/r/r_boxplots.htm