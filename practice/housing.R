
# 1. 통계청 출산 데이터 (시계열, 회귀)
# 2. ~ 집 값 데이터(캘리포니아) => 대표적인 회귀
# 3. 손글씨 분류 => 분류(0~9 분류) / iris 분류

# 예제 : 캘리포니아 집 값 데이터

library(tidyverse)
library(reshape2)

house <- read.csv("./data/housing.csv")
head(house)

summary(house)

# 데이터 시각화(데이터확인을 위한)
par(mfrow=c(2, 5))
colnames(house)
#ggplot(data = house, 
#       mapping = aes(x = value) + geom_histogram(bins = 30) + facet_wrap(~variable, scale = 'free_x'))


# 결측값 처리
house$mean_bedroom = house$total_bedrooms / house$households
house$mean_rooms = house$total_rooms / house$households

drop = c('total_bedrooms', 'total_rooms')

house = house[ , !(names(house) %in% drop)]
head(house)


str(house)

# 전처리(상식을 사용해서 가정에 대한 데이터를 별도로 분리)
categories = unique(house$ocean_proximity)
categories

cat_house = data.frame(ocean_proximity = house$ocean_proximity)
cat_house

for (cat in categories) {
  cat_house[, cat] = rep(0, times=nrow(cat_house))
}

cat_house

for (i in 1:length(cat_house$ocean_proximity)) {
  cat = as.character(cat_house$ocean_proximity[i])
  cat_house[, cat][i] = 1
}

head(cat_house)
