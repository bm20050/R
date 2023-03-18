
install.packages("reshape2")
library(reshape2)

install.packages("dplyr")
library(dplyr)

species <- group_by(iris, Species)
species

long <- melt(species, id="Species")
long

s <- dcast(long, Species~variable, sum)
s
