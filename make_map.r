# make map of GPS coords
library(mapdata)
library(geosphere)
setwd("/home/nicholas/Documents/LocationHistory")

#get gps data
gps_coords = read.csv('gps_total_rounded_to_three.csv', header = FALSE)

##### make map
# change color
par(bg = '#F0F0F0')
map("state", interior = FALSE)
map("state", boundary = FALSE, col="gray", add = TRUE, lty = 'dotted')

# add GPS coords
for (indexnum in c(1:length(gps_coords$V1))){
  points(gps_coords$V1[indexnum], gps_coords$V2[indexnum], col ="steelblue2", type = "p", pch = 19, cex = .75)
}

###### Put title and legend ######
title(main = "Travel in 2014")
legend("bottomleft", legend = c("Cities", "GPS Coordinates"), title = "Legend", fill = c("red", "steelblue2"), cex = 0.75, bg = 'white')

#### How to draw lines between ####
#### http://flowingdata.com/2011/05/11/how-to-map-connections-with-great-circles/
#### http://stackoverflow.com/questions/22282713/r-maps-package-how-to-draw-lines-between-cities-within-the-country

### coordinates to label
lasv <- c(-115.1739, 36.1215) #, "Las Vegas, NV")
dallas <- c(-96.7967, 32.7758) #, "Dallas, TX")
denver <-c(-104.9847, 39.7392) #, "Denver, CO")
sanf <- c(-122.4167, 37.7833) #, "San Francisco, CA")
dc <- c(-77.0367, 38.8951) #, "Washington, D.C.")
austin <-c(-97.7500, 30.2500) #, "Austin, TX")
bandera <- c(-99.0750, 29.7258)
amory <- c(-88.4839, 33.9872)

cities_data <- data.frame(lasv, dallas, denver, sanf, dc, austin, bandera, amory)
cities_names <- c("Las Vegas, NV",
                  "Dallas, TX",
                  "Denver, CO",
                  "San Francisco, CA",
                  "Washington, D.C.",
                  "Austin, TX",
                  "Bandera, TX",
                  "Amory, MS")
cities_label_pos <- c(1,2,3,4,3,4,1,1) # positions: 1=under, 2=left, 3=top, 4=right

### make points on map
for (i in cities_data){
  points(i[1], i[2], pch = 15, cex = .75, col = 'red')
}

# add great circles
inter <- gcIntermediate(c(dallas[1], dallas[2]), c(sanf[1], sanf[2]), n = 50, addStartEnd = TRUE)
lines(inter, col = 'red')
inter <- gcIntermediate(c(dallas[1], dallas[2]), c(lasv[1], lasv[2]), n = 50, addStartEnd = TRUE)
lines(inter, col = 'red')
inter <- gcIntermediate(c(dallas[1], dallas[2]), c(denver[1], denver[2]), n = 50, addStartEnd = TRUE)
lines(inter, col = 'red')
inter <- gcIntermediate(c(dallas[1], dallas[2]), c(dc[1], dc[2]), n = 50, addStartEnd = TRUE)
lines(inter, col = 'red')

# label points
for (g in c(1:length(cities_names))){
  text(cities_data[,g][1], cities_data[,g][2], cities_names[g], col = 'black', pos = cities_label_pos[g], cex = .75)
}
