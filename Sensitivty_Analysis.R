# Enter coefficient values from Excel optimization (not perfect!)
coeffa <- -0.07
coeffb = 6.5
coeffc = 0.8
coefff = 0.4988

#Assign initial standard deviations to G and H
G_stddev = 0.04
H_stddev = .1

#Load the data, create the data frame.
flow <- list()
flow <- read.csv("armco_gate18_melted.csv", header = TRUE, check.names = FALSE, fileEncoding="UTF-8-BOM")

#Calculate the flow
#Q = (aG^2 + bG + c)*H^(f)

flow$modpred <- (coeffa * flow$G ^ 2 + coeffb * flow$G + coeffc) * flow$H ^ (coefff)

#transform(flow, modpred = as.numeric(modelpred))

#Generate a column of random, normal G and H values
flow$G_MC <- rnorm(1, flow$G, G_stddev)
flow$H_MC <- rnorm(1, flow$H, H_stddev)

#Use those values to calculate a new predicted flow
flow$modpred_MC <- (coeffa * flow$G_MC ^ 2 + coeffb * flow$G + coeffc) * flow$H_MC ^ (coefff)

#Look at the difference
flow$error <- abs(flow$modpred - flow$modpred_MC)
print(mean(flow$error))