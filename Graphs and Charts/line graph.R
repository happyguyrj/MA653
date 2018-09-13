# Syntax
# plot(x,type,xlab,ylab,col)

# x- vector of data

# Optional paramters
# type- "p" to draw only the points, "l" for lines and "o" to draw both
# xlab- label for x axis
# ylab- label for y axis
# col- color pallete

# Create data for the graph.
rain1 <- c(5,3,6,7,8,2,5,12,2)
rain2 <- c(8,7,4,6,2,4,8,10,6)

# Create a file
png(file = "line graph.jpg")

# Plot the chart
plot(rain1,type = "o", xlab = "Month", ylab = "Rain fall", main="Rainfall in Mandi (in mm)", col="Red")

# To add second line (Optional)
lines(rain2, type = "o", col = "Green")

# To insert a Legend (Optional)
legend("topleft", c("rain1","rain2"), cex = 1, fill = c("red","green"))

# Save the file
dev.off()