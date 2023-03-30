
# 회귀 => 값을 예측하는 것
## 단순회귀

# 캘리포니아 집 값을 예측
# 1. 데이터를 불러오기 확인 -> 시각적인 확인
# 2-1. 전처리 과정 -> NA
# 2-2. 후처리 과정 -> 표준화와 정규화
# 3. 데이터를 분리 -> 학습과 검증
# 4. 학습 -> 기울기와 절편
# 5. 검증 -> 모델을 검증

library(tidyverse)
library(reshape2)
housing = read.csv('./data/housing.csv')
head(housing)

colnames(housing)


# 경향 확인
ggplot(data = melt(housing), mapping = aes(x = value)) +
  geom_histogram(bins = 30) +
  facet_wrap(~variable, scales = 'free_x')

# 2. 전처리
housing$total_bedrooms[is.na(housing$total_bedrooms)] <- median(housing$total_bedrooms, narm=True)

# 3. 후처리
housing$mean_bedrooms <- housing$total_bedrooms/housing$households
housing$mean_rooms <- housing$total_rooms/housing$households
head(housing)

drops <- c('total_bedrooms', 'total_rooms')
housing <- housing[ , !(names(housing) %in% drops)]
head(housing)

categories <- unique(housing$ocean_proximity)
cat_housing <- data.frame(ocean_proximity = housing$ocean_proximity)
head(cat_housing)

for(i in 1:length(cat_housing$ocean_proximity)){
  cat <- as.character(cat_housing$ocean_proximity[i])
  cat_housing[,cat][i] <- 1
}
head(cat_housing)

