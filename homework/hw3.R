
# 7장

# 2번
dataset <- read.csv("./data/dataset.csv", header=T)
dataset
dataset2 <- subset(dataset, price >= 2 & price <= 8)
dataset2
str(dataset2)

summary(dataset2$resident)
sum(dataset2$resident)

resident2 <- na.omit(dataset2$resident)
sum(resident2)

# 3번
summary(dataset2$gender)
dataset2$gender2[dataset2$gender == 1] <- '남자'
dataset2$gender2[dataset2$gender == 2] <- '여자'
head(dataset2[c("gender", "gender2")])
table(dataset2$gender2)
pie(table(dataset2$gender2))

# 4번
# 1은 30세 미만, 2는 30세 이상 55세 미만, 3은 55세 이상으로 변경하였습니다.
dataset2$age3[dataset2$age < 30] <- '1'
dataset2$age3[dataset2$age >= 30 & dataset2$age < 55] <- '2'
dataset2$age3[dataset2$age >= 55] <- '3'
dataset2[c("age", "age3")]



# 8장

# 1번
install.packages("lattice")
library(lattice)
head(quakes)
str(quakes)

depthgroup <- equal.count(quakes$depth, number = 3, overlap = 0)
depthgroup

maggroup <- equal.count(quakes$mag, number = 2, overlap = 0)
maggroup

xyplot(lat ~ long | depthgroup * maggroup, data = quakes,
       main = "Fiji Earthquakes",
       ylab = "latitude", xlab="longitude",
       pch = "@", col = c("red", "blue"))

# 2번
install.packages("latticeExtra")
library(latticeExtra)
data(SeatacWeather)
head(SeatacWeather)
str(SeatacWeather)

xyplot(min.temp + max.temp ~ day | month, data=SeatacWeather, type="l")