# make map of GPS coords
library(mapdata)

setwd("/home/nicholas/Documents/LocationHistory")



#get gps data
gps_coords = read.csv('gps_total_rounded_to_three.csv', header = FALSE)


# make map

map("state", interior = FALSE)
map("state", boundary = FALSE, col="gray", add = TRUE)



for (indexnum in c(1:length(gps_coords$V1))){
    points(gps_coords$V1[indexnum], gps_coords$V2[indexnum], col ="steelblue2", type = "p", pch = 19, cex = .75)
    print(indexnum)
}

###### Put title and legend ######
title(main = "Travel in 2014")


#### How to draw lines between ####
#### http://flowingdata.com/2011/05/11/how-to-map-connections-with-great-circles/
#### http://stackoverflow.com/questions/22282713/r-maps-package-how-to-draw-lines-between-cities-within-the-country


### Code for plotting labels
### text(-96.7967, 32.7758, labels = "test label", pos = 4, offset = TRUE, cex =.5)
# plot points

### coordinates to label
lasv <- c(-115.1739, 36.1215) #, "Las Vegas, NV")
dallas <- c(-96.7967, 32.7758) #, "Dallas, TX")
denver <-c(-104.9847, 39.7392) #, "Denver, CO")
sanf <- c(-122.4167, 37.7833) #, "San Francisco, CA")
dc <- c(-77.0367, 38.8951) #, "Washington, D.C.")
austin <-c(-97.7500, 30.2500) #, "Austin, TX")
bandera <- c(-99.0750, 29.7258)
amory <- c(-88.4839, 33.9872)

#cities_data <- data.frame(lasv, dallas, denver, sanf, dc, austin)

#for (item in cities_data){
#  points(as.character(item[1]), as.character(item[2]))
#  text(as.double(item[1]), as.double(item[2]), item[3], pos = 3, cex = 0.75, col = 'red')
#  }

# label cities, this is so manual it's embarrassing but had troubles with for loop/data types
points(lasv[1], lasv[2], pch = 19, cex = .75, col = 'red')
text(lasv[1], lasv[2], "Las Vegas, NV", pos = 4, cex = 0.75, col = 'red')
points(dallas[1], dallas[2], pch = 19, cex = .75, col = 'red')
text(dallas[1], dallas[2], "Dallas, TX", pos = 2, cex = 0.75, col = 'red')
points(denver[1], denver[2], pch = 19, cex = .75, col = 'red')
text(denver[1], denver[2], "Denver, CO", pos = 3, cex = 0.75, col = 'red')
points(sanf[1], sanf[2], pch = 19, cex = .75, col = 'red')
text(sanf[1], sanf[2], "San Francisco, CA", pos = 4, cex = 0.75, col = 'red')
points(dc[1], dc[2], pch = 19, cex = .75, col = 'red')
text(dc[1], dc[2], "Washington, D.C.", pos = 3, cex = 0.75, col = 'red')
points(austin[1], austin[2], pch = 19, cex = .75, col = 'red')
text(austin[1], austin[2], "Austin, TX", pos = 4, cex = 0.75, col = 'red')
points(bandera[1], bandera[2], pch = 19, cex = .75, col = 'red')
text(bandera[1], bandera[2], "Bandera, TX", pos = 1, cex = 0.75, col = 'red')
points(amory[1], amory[2], pch = 19, cex = .75, col = 'red')
text(amory[1], amory[2], "Amory, MS", pos = 1, cex = 0.75, col = 'red')
