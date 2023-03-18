getwd()

dataset <- read.csv("./data/dataset.csv", header=T)
dataset
View(dataset)

head(dataset)
tail(dataset)

names(dataset)
attributes(dataset)

str(dataset)

dataset$age
x <- dataset$age
plot(dataset$price)

dataset["gender"] # key 값으로만 조회
dataset[c("job", "price")]


summary(dataset)

sum(dataset$price, na.rm = T)
price2 <- na.omit(dataset$price)
price2

# 경로 확인인
getwd()

# 패키지/라이브러리 설치
install.packages("ggplot2")
install.packages("lattice")

library(ggplot2)
library(lattice)

# str명령어로 데이터확인, 컬럼 기준, 자료형 주의
dataset <- read.csv("./data/dataset.csv", header = T)
str(dataset)

# 결측치 확인
summary(dataset$price)
sum(dataset$price)

# 결측치 제거
price2 <- na.omit(dataset$price)
sum(price2)

# 결측치 및 이상치 제거 -> price 변수의 데이터 정제와 시각화
dataset2 <- subset(dataset, price >= 2 & price <= 7.9)
dataset2 <- subset(dataset2, age >= 20 & age <= 69)
dataset2 <- na.omit(dataset2)

# 코딩 (숫자 -> 문자)
dataset2$job2[dataset2$job == 1] <- '공무원'
dataset2$job2[dataset2$job == 2] <- '회사원'
dataset2$job2[dataset2$job == 3] <- '개인사업'
head(dataset2[c("job", "job2")])

summary(dataset2)

# 히스토그램
histogram(~job, data = dataset2)

# 산포도
xyplot(age~position, data = dataset2)

# 간단한 선그래프
dotplot(price~age, data=dataset2, type="o")
