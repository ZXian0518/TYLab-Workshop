##part1:介紹基本運算子與變數指派
x <- 5566
x
x <- "不能亡"
x
rm(x)
rm(list = ls())

#加減乘除
1+1
1-1
1*2
1/2

#進階運算子
2^10
5%%2

#邏輯運算子
5==5
3>5
1!=1

sqrt(2)    # 開根號
sum(1:10)  # 總和
sd(1:10)   # 標準差
median(1:10)  # 中位數
mean(1:10)  # 平均數
var(1:10) # 變異數
round(var(1:10),digits = 3) # 四捨五入到第三位數


##part2:基本資料屬性
# Try it!
class(2)
class("2")
class(2L)
class(2==2)
class(2+2i)
x <- c(4,4,3,2,2,1,4,2)
y <- factor(x)
factor(x, labels = c("非常不滿意", "不滿意", "滿意", "非常滿意")) # 可自訂 Level 的名稱。
factor(x, ordered = TRUE)
sum(x)  # sum(y)


##part3:R的資料格式與結構
#vector
x <- 5566
length(x)
x <- 5566
y <- "得第一"
z <- c(x,y)
z
length(z)
x <- 1:10
y <- letters[1:10]
cbind(x,y)
rbind(x,y)
seq(1,10)
seq(1,10,2)
x <- seq(1,10,2)
rep(x,3)
x[5]

#matrix
help("matrix")
matrix(data=1:6,nrow=2,byrow=F,dimnames = list(c("row1","row2"),
                                               c("col.1","col.2","col.3")))

matrix(data=1:6,nrow=2,byrow=T,dimnames = list(c("row1","row2"),
                                               c("col.1","col.2","col.3")))
mat <- matrix(1:6,nrow=2,byrow=T)
nrow(mat)
ncol(mat)
dim(mat)
rownames(mat) <- c("row1","row2")
colnames(mat) <- c("col.1","col.2","col.3")
mat
mat[1,2]
mat["row1","col.2"]
mat[1,]  # 第一列所有
mat[,2]  # 第二欄所有

#data.frame
data.frame(name=c("Rory","文峰","EJ","yen","丞堯","Sam","Anna","Ting","承彥"),age=c(18,25,24,24,24,24,23,23,20),height=c(168,172,165,156,170,168,160,158,168))
#another way
name <- c("Rory","文峰","EJ","yen","丞堯","Sam","Anna","Ting","承彥")
age <- c(18,25,24,24,24,24,23,23,20)
height <- c(168,172,165,156,170,168,160,158,168)
data.frame(name=name,age=age,height=height)
df<- data.frame(name=c("Rory","文峰","EJ","yen","丞堯","Sam","Anna","Ting","承彥"),age=c(18,25,24,24,24,24,23,23,20),height=c(168,172,165,156,170,168,160,158,168))
summary(df)
str(df)
head(df)

#list
vec.1 <- "這是一個列表說明"
mat.1 <- matrix(1:15,nrow=3,byrow = T)
df.1 <- data.frame(name=c("Rory","文峰","EJ","yen","Sam","Anna"),age=c(18,25,24,24,24,23),
                   height=c(168,172,165,158,168,160))
list.1 <- list(vec.1,mat.1,df.1)
names(list.1)<-c("向量","矩陣","資料框架")
#
list.1[[1]]
list.1[["向量"]]
list.1[[2]][3,1]
list.1[[3]][2,]
#
list.1[[1]] <- NULL
list.1[["向量"]]  # 原先位置在第一個的向量被刪除了


##part4:資料清理與運用
x <- c(1,4,5,6,7,8,12)
x[c(1,3,5)] # 透過位置取
x[c(T,F,T,F,T,F,F)]
x[which(x%%2!=0)] # 找出奇數
x[which(x%%2==0)] # 找出偶數
which(c(T,F,T,T,F))
which(c(T,T,T,F,T))
x <- 1:10
x[-c(1,3,5,7,9)]
x
x <- x[-c(1,3,5,7,9)]
x

#QUIZ
x <- 1:100
y <-  x[which(x%%2!=0 & x%%3 !=0)]
y

#
x <- c(1,3,5,7)
class(x)
x <- as.integer(x)
class(x)
x <- as.character(x)
class(x)
x <- as.numeric(x)
class(x)
y <- c("你","好","嗎")
y <- as.numeric(y)
y

#
name <- c("Rory","文峰","EJ","yen","Sam","Anna")
age <- c(18,25,24,24,24,23)
height <- c(168,172,165,158,168,160)
df<- data.frame(name=name,age=age,height=height)
df$name[6]
df$age[6]
df$height[6]
df[6,]

#install.packages("datasets")
library(datasets)
data(package = .packages(all.available = TRUE))
?airquality
dt.1 <-  airquality
str(dt.1)
summary(dt.1)
#
is.na(dt.1)
dt.1<- na.omit(dt.1)
dt.2<- dt.1[which(dt.1$Month==7 | dt.1$Month==9),]
dt.2[which(dt.2$Solar.R>mean(dt.2$Solar.R)),]


##part5:流程控制與迴圈
#
'得第一'=='巧芯巧芯得第一'
3>7
5>3 & 5>4
5>3 | 5>7
#
age <- 20
if(age > 18){
  print("你可以喝酒")
}

age <- 16
if(age >18){
  print("你可以喝酒")
}

age <- 16
if(age>18){
  print("你可以喝酒")
}else{
  print("你不能喝酒")
}

age <- round(runif(1, -1000,20))

if(age>18){
  print("你可以喝酒")
}else if(age<0){print("年齡不會有負數")}else{
  print("你不能喝酒")
}


#
for (i in 1:10){
  print(i)
}
all <- c()
for (i in 1:10){
  all <- c(all,i*2+1)
}
all
# 挑選出1到100中的偶數
all <- c()
for(i in 1:100){
  if(i%%2==0){
    all <- c(all,i)
  }
}
all
# 計算1~100的積為何
i <- 1
result <- 0
while(i<101){
  result <- result + i 
  i <-  i+1
}
#
#break
for (i in 1:100){
  if (i > 10) break
  print(i)
}

#next
for (i in 1:100){
  if (i > 10 && i <50) next
  print(i)
}


#part6:綜合練習answers
# answer
# 00
practice <- iris
head(practice)
str(practice)
summary(practice)

# 01
practice$Species <- as.character(practice$Species)
practice[,5] <- as.character(practice[,5])
practice[,'Species'] <- as.character(practice[,'Species'])

# 02
sd(practice$Sepal.Length)
sd(practice[,1])
sd(practice[,'Sepal.Length'])

# 03
t1 <- practice[,2]
t1 <- practice[,'Sepal.Width']
t1 <- practice$Sepal.Width
t1 <- practice[,c(F,T,F,F,F)]

# 04
names(t1) <- 1:length(t1)
t1[c(7,21)]
t1[c('7','21')]

# 05
leng <- 5.5
if(leng>mean(practice$Petal.Length)){
  print("超過平均")
}else if(leng<mean(practice$Petal.Length)&leng>0){
  print("小於平均")
}else{
  print("不會有負數")
}
#06
result <- c()
for(i in 1:4){
  var1 <- var(practice[,i])
  var1 <- round(var1,digits = 2)
  result <- c(result,var1)
}
result

# apply函數可以更快的做出結果
apply(practice[1:4],2,var)


##part7:資料讀取與匯出
setwd("/Users/huangzongxian/Desktop/R/TYLab Workshop/Class1") #更改路徑
dir()
getwd()
rm(list = ls())
txt_sample1 <- read.table("sample.txt",header = T)
txt_sample2 <- read.csv("sample.txt",sep = "\t")
csv_sample <- read.csv("sample.csv")
require(readxl)
xls_sample <- read_excel("sample.xlsx")
require(foreign)
sav_sample<- read.spss("TEDS2016_indQ_sample.sav",to.data.frame = T,use.value.labels = F)
sav_sample<- read.spss("TEDS2016_indQ_sample.sav",to.data.frame = T,use.value.labels = T)
load("sample.RData")
require(xlsx)
write.csv(csv_sample,file = "sample1.csv")
write.xlsx(xls_sample,file= "sample1.xlsx")
require(haven)
write_sav(sav_sample,"sample1.sav")
save(datlis,file = "sample1.Rdata")


##par9: TEG
rm(list = ls())
load("sample.RData")
data<- datlis[[5]]  # 2017年共有7530列資料
vars <- c("gender","age","edu") # 只要性別、年齡、教育程度
df <- data[which(names(data) %in% vars)] # 切割次資料集

for(i in 0:15L){
  a <- i*500+1
  b <- i*500+500
  if(b>nrow(df)){
    b <- nrow(df)
  }
  assign(paste0("dataset",i),df[a:b,])
  print(paste("dataset",i,"From row",a,"to row",b))
}

#Save all data
rm(data,datlis,df,a,b,i,vars)  # 把一些不要的刪掉
files <- mget(ls())
for (i in 1:length(files)){
  write.csv(files[[i]], paste(names(files[i]),".csv", sep = ""),fileEncoding ="BIG5")
}

