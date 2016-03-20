##getwd()
##dir()

##Download:
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(variable, destfile="name file + extension")
##Read file:

##jpg
## install package library(jpeg)
## variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
## dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/q2.jpg' ##q2.jpg is how the file will be saved 
## download.file(variable, dst2, mode = 'wb')
## data2 = readJPEG(dst2, native = TRUE)

##xml:
##library(XML)
##doc <- xmlTreeParse("./data/restaurants.xml", useInternal = TRUE)
##rootNode <- xmlRoot(doc)

##CSV
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
##dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/q3.csv' ##q3.csv is how will be saved
##doc<- read.csv("file name + extension")

##xlsx
##libreary(xlsx) ##install and after that install rJava and xlsxjars
##doc <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex,colIndex = colIndex, header = TRUE)

##install package dplyr if you want to friendly: swirl() package trains on this. might need "LearnBayes" "stats" "base"
##install package tidyr to to fix messy data to tidy: e.g gather(students, sex, count, -grade) and separate(res,sex_class,c("sex", "class"))  
##install package "nycflights13"
##library(nycflights13)
##dim(flights)
 ##Fit <- tbl_df(flights) ; Only shows what fits in screen, the rest as text
 ##fit print "fit" to see how it looks
 ##If use "flights" it shows everything vs. "fit" (tbl_df(flights))
##filter(flights, month == 1, day == 1)
##slice(flights, 1:10); 10 rows
##arrange(flights, year, month, day); arrange(flights, desc(arr_delay))
##select(flights, year, month, day);select(flights, year:day);select(flights, -(year:day))
  ##select<-select(merge,`Long Name`, `Income Group`,Total) ##symbol "`" to recognize two words as variable
##distinct(select(flights, tailnum));shows unique values per column; distinct(select(flights, origin, dest))
##mutate();add columns: mutate(flights,gain = arr_delay - dep_delay,speed = distance / air_time * 60)
##summarise(flights,delay = mean(dep_delay, na.rm = TRUE)); sumirizes data to a single row
##destinations <- group_by(flights, dest)
##summarise(destinations,planes = n_distinct(tailnum),flights = n())

##by_tailnum <- group_by(flights, tailnum)
##delay <- summarise(by_tailnum,
##                   count = n(),
##                   dist = mean(distance, na.rm = TRUE),
##                   delay = mean(arr_delay, na.rm = TRUE))
                      ## count means count of rows.
##quantile(delay$count, probs = 0.99) it will show # of rows within 99% of data. if want to know 1% check count>336.14 of 99%
    ##top_counts <- filter(delay, count > "number from quantile")
##quantile(delay$count,na.rm=TRUE) Shows reading at 0%, 25%, 50%, 75%, 100%
##delay <- filter(delay, count > 20, dist < 2000)
##ggplot(delay, aes(dist, delay)) +
##  geom_point(aes(size = count), alpha = 1/2) +
##  geom_smooth() +
##  scale_size_area()

library(datasets)
## or data<-read.csv("data.csv"TRUE,",") true if you have header, and "," for comma delimited
## if you have a column with letters then: data<-read.csv("data.csv",TRUE,",")
data(mtcars)
summary(mtcars)
str(mtcars)
head(mtcars) ##if you want to see more than 6 rows: head(mtcars,10)
nrows(mtcars)
ncol(mtcars)
dim(mtcars) ## (rown,columns)
str(mtcars) #metrics
## to add a new column with a calculation: mtcars$newColumn<-(mtcars$mpg+mtcars$hp)
## to merge data frames based on a column: merge(Dataframe1,dataframe2,by.x="columnName1",by.y="columnName2")
##Example merge data:
  ##fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
  ##dst3a = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3a.csv'
  ##fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
  ##dst3b = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3b.csv'
  ##download.file(fileurl3a, dst3a, mode = 'wb') ##sometimes without mode 'wb'
  ##download.file(fileurl3b, dst3b, mode = 'wb') ##sometimes without mode 'wb'
  ##gdp = fread(dst3a, skip=5, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
  ##edu = fread(dst3b) ##fread() allows you to clean the data
  ##merge = merge(gdp, edu, by = 'CountryCode')


class(mtcars) ##type of class, normally data frame
to_see_certain_columns<-mtcars[,c("mpg","hp")]
sum(is.na(mtcars$hp)) ## counts how many "NA" are under column "hp"
mtcars[mtcars$hp>170,] ##to see certain rows by filtering a column
mtcars[mtcars$hp>170|mtcars$cyl>6,]  ## to see certain rows by filtering 2 columns "|" means "or", "&" means "and"
  ##Or use Dplyr package, filter(mtcars, hp>170 & cyl>6)
table(mtcars$hp,mtcars$cyl) ## show two dimential table, row = hp, vs. col = cyl
table(mtcars$cyl %in% c(6)) ## shows number cars with 6 cylinders
stat2<-subset(mtcars,hp<170)
## Dplyr package. rename(mtcars, hp=HorsePower) ## it will change he name of the column
## Dplyr package. deter<-mutate(mtcars,  efficiency= factor(1*(hp>170),  labels=c("Weak","Powerful"  ) 
        ##effective<-group_by(deter,efficiency )
        ##effective
        ##summarize(effective,hp=mean(hp),mpg=max(mpg),cyl=median(cyl))
        ##merge() ## to joint multiple tables based on a certain variable.
stat3<-stat2[1:3,"hp"]## to capture only 3 rows de los hp<170, if multi columns: c("white","red")
stat3 ## to print only 3 rows hp<170
dim(stat2) ## shows total rows and columns, but rows are interesting to new how many records
##if you want to simplify then >attach(mtcars), that allows you write "mpg instead of mtcars$mpg
mean(mtcars$mpg[mtcars$cyl==8],na.rm=TRUE) ##eliminates NA's
mean(mtcars$mpg)
median(mtcars$mpg)
max(mtcars$mpg)
min(mtcars$mpg)
sd(mtcars$mpg)
mtcars[order(mtcars$mpg),] ## ascending, if "-" mtcars$mpg descending
mtcars[order(mtcars$mpg,-mtcars$hp),] ## multiple columns ordered
stat<-split(mtcars,mtcars$cyl) ## to see an element as a function of other (dataset, cyl)
stat2<-split(mtcars$hp,mtcars$cyl)
## if you want to see total "hp" by cyl: lapply(stat,sum)
## if you want to see total count (cars) by cyl: lapply(stat,nrow)
## if you want to convert list to data frame: as.data.frame(lapply(stat,nrows))

##To cut rows in intervals (histograms), library(Hmisc)
merge$RankGroups <- cut2(merge$Rank, g=5) ## cut in 5 intervals 
table(merge$RankGroups, merge$`Income Group`)
print(stat) ##new look of data as a function of "cyl" after split

sapply( stat, function(x) mean(x$mpg) ) ## calculates the mean on column "mpg" based on "split" (cyl)
lapply(stat,function(x) colMeans(x[,c("mpg","disp","hp")])) ##calculates the mean on each column of vecto "c" based on "split" (cyl)
tapply(mtcars$hp, mtcars$cyl, mean) ## it will show average hp per group of cylinder

str(stat) ## new metrics based on "split" (cyl) over all the other variables
plot(x=mtcars$mpg, y=mtcars$hp)
mtcars[,2]<-as.numeric(mtcars[,2]) ## column 2
hist(mtcars[,2]) ##histogram stat all rown, column 2
