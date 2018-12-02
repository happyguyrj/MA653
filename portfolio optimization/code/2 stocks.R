library(PortfolioAnalytics)
library(quantmod)
library(PerformanceAnalytics)
library(zoo)
library(plotly)

# Get data
aapl <- read.csv("AAPL.csv", header=TRUE)
amd <- read.csv("amd.csv", header=TRUE)

aapl.close = aapl[c(6)]
amd.close = amd[c(6)]

# Assign to dataframe
# Get adjusted prices
prices.data <- merge.zoo(aapl.close ,amd.close)
prices.data2 <-  ts(data = prices.data)

# Calculate returns
returns.data <- CalculateReturns(prices.data2)
returns.data <- na.omit(returns.data)

# Set names
colnames(returns.data) <- c("aapl","amd")

# Save mean return vector and sample covariance matrix
meanReturns <- colMeans(returns.data)
covMat <- cov(returns.data)


#Creating a Portfolio
#names of the assets
port <- portfolio.spec(assets = c("aapl","amd"))

#Adding constraints
# Box
port <- add.constraint(port, type = "box", min = 0, max = 1)

# Leverage
port <- add.constraint(portfolio = port, type = "weight", min_sum=0.99, max_sum=1.01)

# Generate random portfolios
rportfolios <- random_portfolios(port, permutations = 5000, rp_method = "sample")


# Get minimum variance portfolio
minvar.port <- add.objective(port, type = "risk", name = "var")

# Optimize
minvar.opt <- optimize.portfolio(returns.data, minvar.port, optimize_method = "random", 
                                 rp = rportfolios)

# Generate maximum return portfolio
maxret.port <- add.objective(port, type = "return", name = "mean")

# Optimize
maxret.opt <- optimize.portfolio(returns.data, maxret.port, optimize_method = "random", 
                                 rp = rportfolios)

# Generate vector of returns
minret <- 0.06/100
maxret <- maxret.opt$weights %*% meanReturns

vec <- seq(minret, maxret, length.out = 5000)

eff.frontier <- data.frame(Risk = rep(NA, length(vec)),
                           Return = rep(NA, length(vec)), 
                           SharpeRatio = rep(NA, length(vec)))

frontier.weights <- mat.or.vec(nr = length(vec), nc = ncol(returns.data))
colnames(frontier.weights) <- colnames(returns.data)

for(i in 1:length(vec)){
  eff.port <- add.constraint(port, type = "return", name = "mean", return_target = vec[i])
  eff.port <- add.objective(eff.port, type = "risk", name = "var")
  eff.port <- optimize.portfolio(returns.data, eff.port, optimize_method = "ROI")
  eff.frontier$Risk[i] <- sqrt(t(eff.port$weights) %*% covMat %*% eff.port$weights)
  eff.frontier$Return[i] <- eff.port$weights %*% meanReturns
  eff.frontier$Sharperatio[i] <- eff.port$Return[i] / eff.port$Risk[i]
  frontier.weights[i,] = eff.port$weights
  print(paste(round(i/length(vec) * 100, 0), "% done..."))
}


feasible.sd <- apply(rportfolios, 1, function(x){
  return(sqrt(matrix(x, nrow = 1) %*% covMat %*% matrix(x, ncol = 1)))
})

feasible.means <- apply(rportfolios, 1, function(x){
  return(x %*% meanReturns)
})

feasible.sr <- feasible.means / feasible.sd

p <- plot_ly(x = feasible.sd[1:5000], y = feasible.means[1:5000], color = feasible.sr[1:5000], 
             mode = "markers", type = "scattergl", showlegend = F,
             marker = list(size = 5, opacity = 1, 
                           colorbar = list(title = "Sharpe Ratio"))) %>% 
  
  add_trace(data = eff.frontier, x = eff.frontier$Risk, y = eff.frontier$Return, mode = "markers", 
            type = "scattergl", showlegend = F, 
            marker = list(color = "#FF5A5A", size = 5)) %>% 
  
  layout(title = "Efficient Frontier for given assets",
         yaxis = list(title = "Mean Returns", tickformat = ".2%"),
         xaxis = list(title = "Standard Deviation", tickformat = ".2%"),
         plot_bgcolor = "#F8F8F8",
         paper_bgcolor = "#F8F8F8")

p

