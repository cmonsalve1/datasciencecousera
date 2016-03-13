##Download:
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(variable donde descarga http...en este caso variable, destfile="name file + extension")
##Read file:

##xml:
##library(XML)
##doc <- xmlTreeParse("./data/restaurants.xml", useInternal = TRUE)
##rootNode <- xmlRoot(doc)

##CSV
##doc<- read.csv("file name + extension")

##xlsx
##libreary(xlsx) ##install and after that install rJava and xlsxjars
##doc <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex,colIndex = colIndex, header = TRUE)
##install package dplyr if you want to friendly: swirl() package trains on this. might need "LearnBayes" "stats" "base"
##install package "nycflights13"
##library(nycflights13)
##dim(flights)
##filter(flights, month == 1, day == 1)
##slice(flights, 1:10); 10 rows
##arrange(flights, year, month, day); arrange(flights, desc(arr_delay))
##select(flights, year, month, day);select(flights, year:day);select(flights, -(year:day))
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
class(mtcars) ##type of class, normally data frame
to_see_certain_columns<-mtcars[,c("mpg","hp")]
mtcars[mtcars$hp>170,] ##to see certain rows by filtering a column
mtcars[mtcars$hp>170|mtcars$cyl>6,]  ## to see certain rows by filtering 2 columns
stat2<-subset(mtcars,hp<170)
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
stat<-split(mtcars,mtcars$mpg) ## to see an element as a function of other (column, cyl)
print(stat) ##new look of data as a function of "cyl" after split
sapply( stat, function(x) mean(x$mpg) ) ## calculates the mean on column "mpg" based on "split" (cyl)
lapply(stat,function(x) colMeans(x[,c("mpg","disp","hp")])) ##calculates the mean on each column of vecto "c" based on "split" (cyl)
str(stat) ## new metrics based on "split" (cyl) over all the other variables
plot(x=mtcars$mpg, y=mtcars$hp)
mtcars[,2]<-as.numeric(mtcars[,2]) ## column 2
hist(mtcars[,2]) ##histogram stat all rown, column 2
