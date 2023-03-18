
install.packages("stringr")

Data2 <- c("2017-02-05 수입3000원",
           "2017-02-06 수입4500원",
           "2017-02-07 수입2500원")
library(stringr)
Data2

a <- str_extract_all(Data2, "[0-9]{4}원")
a

b <- str_replace_all(Data2, "[0-9 ]", "")
b

c <- str_replace_all(Data2, "-", "/")
c

d <- paste(Data2, collapse = ",")
d
