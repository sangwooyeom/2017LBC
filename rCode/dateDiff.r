perCust_Item_Date = data02[,c(6,5,8)]

library(reshape2)
tmpDf = melt(id=c("고객번호","구매일자"),perCust_Item_Date)
Cust_DateByItem = dcast(tmpDf[1:10000,],고객번호+구매일자~value)
