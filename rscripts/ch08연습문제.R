library(lattice)
data(quakes)
equal.count(quakes$depth, number=3, overlap=0)

depthgroup <- equal.count(quakes$mag,
                          number=3,
                          overlap=0)

xyplot(lat ~ long, data=quakes)


install.packages("latticeExtra")
library(latticeExtra)

xyplot(min.temp + max.temp ~ day | month, 
       data=SeatacWeather)
