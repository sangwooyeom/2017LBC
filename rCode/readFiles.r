setwd("~/workShop/2017LBC")
fileNames = c("data/제3회 Big Data Competition-분석용데이터-01.고객DEMO.txt",
              "data/제3회 Big Data Competition-분석용데이터-02.구매상품TR.txt",
              "data/제3회 Big Data Competition-분석용데이터-03.상품분류.txt",
              "data/제3회 Big Data Competition-분석용데이터-04.경쟁사이용.txt",
              "data/제3회 Big Data Competition-분석용데이터-05.멤버십여부.txt",
              "data/제3회 Big Data Competition-분석용데이터-06.채널이용.txt")

data01 = read.csv(fileNames[1],as.is = T,fileEncoding = 'euc-kr',colClasses=c("integer","character","character","character"))
data02 = read.csv(fileNames[2],as.is = T,fileEncoding = 'euc-kr')
data03 = read.csv(fileNames[3],as.is = T,fileEncoding = 'euc-kr')
data04 = read.csv(fileNames[4],as.is = T,fileEncoding = 'euc-kr')
data05 = read.csv(fileNames[5],as.is = T,fileEncoding = 'euc-kr')
data06 = read.csv(fileNames[6],as.is = T,fileEncoding = 'euc-kr')

library(dplyr)

perBill = data02 %>% group_by(영수증번호) %>%   summarise(제휴사 = 제휴사[1], 고객번호 = 고객번호[1], 
                   점포코드 = 점포코드[1], 구매일자 = 구매일자[1],구매시간 = 구매시간[1],sum(구매금액))


write.csv(perBill, "영수증단위.csv",row.names = F)

perBill = data02 %>% group_by(영수증번호) %>%   summarise(제휴사 = 제휴사[1], 고객번호 = 고객번호[1], 
                   점포코드 = 점포코드[1], 구매일자 = 구매일자[1],구매시간 = 구매시간[1],sum(구매금액))

perBill = perBill[]

custCnt = table(perBill$고객번호)

